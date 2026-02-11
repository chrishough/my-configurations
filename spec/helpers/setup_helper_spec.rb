# frozen_string_literal: true

require "fileutils"
require "helpers/setup_helper"
require "tmpdir"

# SetupHelper.process_paths receives a nested data structure (Array of Hashes)
# that mirrors the format used in applications/setup.rb and dotfiles/setup.rb.
#
# Example input (from applications/setup.rb):
#
#   [
#     {
#       tmux: [
#         { source: "$HOME/.tmux.conf",
#           destination: "$HOME/.myconfigurations/applications/tmux/conf" }
#       ],
#       claude: [
#         { source: "$HOME/.claude/settings.json",
#           destination: "$HOME/.myconfigurations.private/claude/global/settings.json" },
#         { source: "$HOME/.claude/CLAUDE.md",
#           destination: "$HOME/.myconfigurations.private/claude/brains/global/CLAUDE.md" }
#       ]
#     }
#   ]
#
# For each entry the method creates a symlink at `source` pointing to
# `destination`, creating parent directories as needed. It handles several
# edge cases: existing correct symlinks (skip), incorrect symlinks (replace),
# and regular files at the source location (skip with warning).
#
# All specs use a temporary directory so the real filesystem is never touched.
RSpec.describe SetupHelper do
  describe ".process_paths" do
    # Create a fresh temp directory for every example and clean it up after.
    # We override $HOME so that PathHelper.expand_shell_path resolves "$HOME"
    # to our sandbox instead of the real home directory.
    let( :tmpdir ) { Dir.mktmpdir( "setup_helper_spec" ) }
    let( :original_home ) { Dir.home }
    let( :highline_instance ) { instance_double( HighLine ) }

    before do
      original_home
      ENV["HOME"] = tmpdir
      allow( $stdout ).to receive( :write )
      allow( $stdout ).to receive( :puts )
      # Stub HighLine.new so interactive prompts don't block tests.
      allow( HighLine ).to receive( :new ).and_return( highline_instance )
      allow( highline_instance ).to receive( :say )
      allow( highline_instance ).to receive( :agree ).and_return( false )
    end

    after do
      ENV["HOME"] = original_home
      FileUtils.rm_rf( tmpdir )
    end

    # --------------------------------------------------------------------------
    # Basic symlink creation
    # The most common path: source does not exist yet, destination file exists,
    # and we expect a symlink to be created at source pointing to destination.
    # --------------------------------------------------------------------------
    context "when the source does not exist" do
      it "creates a symlink from source to destination" do
        # Simulate a destination config file that already exists in the repo.
        dest_file = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )
        FileUtils.mkdir_p( File.dirname( dest_file ) )
        File.write( dest_file, "tmux config content" )

        # This mirrors the tmux entry from applications/setup.rb.
        paths = [
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        source_path = File.join( tmpdir, ".tmux.conf" )

        # The source should now be a symlink pointing to the destination.
        expect( File.symlink?( source_path ) ).to be true
        expect( File.readlink( source_path ) ).to eq( dest_file )
      end
    end

    # --------------------------------------------------------------------------
    # Correct symlink already exists -- skip
    # When re-running setup, existing correct symlinks should not be recreated.
    # The method prints "Symlink already correct" and calls `next`.
    # --------------------------------------------------------------------------
    context "when a correct symlink already exists at source" do
      it "leaves the symlink unchanged" do
        source_path = File.join( tmpdir, ".tmux.conf" )
        dest_file = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )
        FileUtils.mkdir_p( File.dirname( dest_file ) )
        File.write( dest_file, "tmux config" )

        # Pre-create the correct symlink.
        File.symlink( dest_file, source_path )

        paths = [
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        # Symlink should still exist and still point to the same destination.
        expect( File.symlink?( source_path ) ).to be true
        expect( File.readlink( source_path ) ).to eq( dest_file )
      end
    end

    # --------------------------------------------------------------------------
    # Incorrect symlink -- replace
    # If a symlink exists but points to the wrong target (e.g., after moving
    # config files), the method deletes the old symlink and creates a new one.
    # --------------------------------------------------------------------------
    context "when an incorrect symlink exists at source" do
      it "removes the old symlink and creates a correct one" do
        source_path = File.join( tmpdir, ".tmux.conf" )
        wrong_dest = File.join( tmpdir, "old/wrong/path" )
        correct_dest = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )

        FileUtils.mkdir_p( File.dirname( wrong_dest ) )
        FileUtils.mkdir_p( File.dirname( correct_dest ) )
        File.write( correct_dest, "correct config" )

        # Pre-create a symlink pointing to the wrong location.
        File.symlink( wrong_dest, source_path )

        paths = [
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        # The symlink should now point to the correct destination.
        expect( File.symlink?( source_path ) ).to be true
        expect( File.readlink( source_path ) ).to eq( correct_dest )
      end
    end

    # --------------------------------------------------------------------------
    # Regular file exists at source -- user approves replacement
    # When a real file exists, HighLine prompts the user. If they approve,
    # the file is removed and replaced with a symlink.
    # --------------------------------------------------------------------------
    context "when a regular file exists and user approves replacement" do
      it "removes the file and creates a symlink" do
        source_path = File.join( tmpdir, ".tmux.conf" )
        dest_file = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )
        FileUtils.mkdir_p( File.dirname( dest_file ) )
        File.write( dest_file, "repo config" )

        # Create a real file (not a symlink) at the source path.
        File.write( source_path, "user local config" )

        # User approves the replacement.
        allow( highline_instance ).to receive( :agree ).and_return( true )

        paths = [
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        # The regular file should be replaced with a symlink.
        expect( File.symlink?( source_path ) ).to be true
        expect( File.readlink( source_path ) ).to eq( dest_file )
      end
    end

    # --------------------------------------------------------------------------
    # Regular file exists at source -- user declines replacement
    # When a real file exists and the user declines, the file is left intact
    # and no symlink is created.
    # --------------------------------------------------------------------------
    context "when a regular file exists and user declines replacement" do
      it "leaves the file intact and does not create a symlink" do
        source_path = File.join( tmpdir, ".tmux.conf" )
        dest_file = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )
        FileUtils.mkdir_p( File.dirname( dest_file ) )
        File.write( dest_file, "repo config" )

        # Create a real file (not a symlink) at the source path.
        File.write( source_path, "user local config" )

        # User declines the replacement (default stub returns false).

        paths = [
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        # The regular file should remain untouched -- no symlink created.
        expect( File.symlink?( source_path ) ).to be false
        expect( File.read( source_path ) ).to eq( "user local config" )
      end
    end

    # --------------------------------------------------------------------------
    # Parent directory creation
    # Both source and destination directories are created automatically with
    # FileUtils.mkdir_p if they don't exist. This is important for first-time
    # setup on a fresh machine where directories like ~/.claude/ may not exist.
    # --------------------------------------------------------------------------
    context "when parent directories do not exist" do
      it "creates source and destination parent directories" do
        # Use a deeply nested path that definitely doesn't exist yet.
        paths = [
          {
            newtool: [
              {
                source: "$HOME/.config/newtool/deep/settings.json",
                destination: "$HOME/.myconfigurations/apps/newtool/deep/settings.json",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        source_dir = File.join( tmpdir, ".config/newtool/deep" )
        dest_dir = File.join( tmpdir, ".myconfigurations/apps/newtool/deep" )

        # Both directory trees should have been created.
        expect( Dir.exist?( source_dir ) ).to be true
        expect( Dir.exist?( dest_dir ) ).to be true
      end

      # .keep files are added to newly created directories so they can be
      # tracked in git. Verify both source and destination directories get one.
      it "adds a .keep file to newly created source and destination directories" do
        paths = [
          {
            newtool: [
              {
                source: "$HOME/.config/keeptest/settings.json",
                destination: "$HOME/.myconfigurations/apps/keeptest/settings.json",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        source_keep = File.join( tmpdir, ".config/keeptest/.keep" )
        dest_keep = File.join( tmpdir, ".myconfigurations/apps/keeptest/.keep" )

        expect( File.exist?( source_keep ) ).to be true
        expect( File.exist?( dest_keep ) ).to be true
      end
    end

    # --------------------------------------------------------------------------
    # Deeply nested source directories within $HOME
    # Mirrors the applications/claude/setup.rb pattern where the source path
    # includes multiple nested directories (e.g., test/.claude/) that may not
    # exist on a fresh machine. All intermediate directories after $HOME must
    # be created automatically so the symlink succeeds.
    # --------------------------------------------------------------------------
    context "when source has deeply nested directories that do not exist" do
      it "creates all intermediate source directories and the symlink" do
        # Destination file exists in the repo (simulating the config store).
        dest_file = File.join( tmpdir, ".myconfigurations.private/claude/local/settings.json" )
        FileUtils.mkdir_p( File.dirname( dest_file ) )
        File.write( dest_file, "{}" )

        # Source path mirrors applications/claude/setup.rb: nested dirs
        # "test/" and "test/.claude/" do not exist yet inside $HOME.
        paths = [
          {
            claude: [
              {
                source: "$HOME/test/.claude/settings.local.json",
                destination: "$HOME/.myconfigurations.private/claude/local/settings.json",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        source_path = File.join( tmpdir, "test/.claude/settings.local.json" )
        test_dir = File.join( tmpdir, "test" )
        claude_dir = File.join( tmpdir, "test/.claude" )

        # Both intermediate directories should have been created.
        expect( Dir.exist?( test_dir ) ).to be true
        expect( Dir.exist?( claude_dir ) ).to be true

        # The symlink should have been created successfully.
        expect( File.symlink?( source_path ) ).to be true
        expect( File.readlink( source_path ) ).to eq( dest_file )
      end
    end

    # --------------------------------------------------------------------------
    # Deeply nested destination directories within $HOME
    # The destination side also uses mkdir_p. Verify that when the destination
    # directory tree doesn't exist, all intermediate directories are created.
    # --------------------------------------------------------------------------
    context "when destination has deeply nested directories that do not exist" do
      it "creates all intermediate destination directories and the symlink" do
        # Neither the source nor destination directories exist yet.
        paths = [
          {
            newtool: [
              {
                source: "$HOME/.newtool/config.json",
                destination: "$HOME/deep/nested/repo/store/config.json",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        dest_dir = File.join( tmpdir, "deep/nested/repo/store" )
        source_path = File.join( tmpdir, ".newtool/config.json" )
        dest_path = File.join( tmpdir, "deep/nested/repo/store/config.json" )

        # All intermediate destination directories should exist.
        expect( Dir.exist?( dest_dir ) ).to be true

        # Symlink should point to the destination.
        expect( File.symlink?( source_path ) ).to be true
        expect( File.readlink( source_path ) ).to eq( dest_path )
      end
    end

    # --------------------------------------------------------------------------
    # $HOME guard -- skip when $HOME does not exist
    # SetupHelper must NEVER create the $HOME directory itself. If $HOME does
    # not exist and a path is under it, the entry is skipped with an error
    # message. This prevents accidentally creating a bogus home directory.
    # --------------------------------------------------------------------------
    context "when $HOME does not exist" do
      it "skips the entry without creating directories or symlinks" do
        # Point $HOME to a path that does not exist.
        fake_home = File.join( tmpdir, "nonexistent_home" )
        ENV["HOME"] = fake_home

        paths = [
          {
            claude: [
              {
                source: "$HOME/.claude/settings.json",
                destination: "$HOME/.myconfigurations/settings.json",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        # $HOME should NOT have been created.
        expect( Dir.exist?( fake_home ) ).to be false

        # No symlink should have been created.
        source_path = File.join( fake_home, ".claude/settings.json" )
        expect( File.exist?( source_path ) ).to be false
      end
    end

    # --------------------------------------------------------------------------
    # Multiple tools in a single path group
    # The applications/setup.rb file defines tmux, claude, and vscode in a
    # single hash. Verify that all tools in the group are processed.
    # --------------------------------------------------------------------------
    context "when processing multiple tools in one path group" do
      it "creates symlinks for every tool entry" do
        # Set up destination files for two tools.
        tmux_dest = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )
        claude_dest = File.join( tmpdir, ".myconfigurations.private/claude/global/settings.json" )

        FileUtils.mkdir_p( File.dirname( tmux_dest ) )
        FileUtils.mkdir_p( File.dirname( claude_dest ) )
        File.write( tmux_dest, "tmux" )
        File.write( claude_dest, "claude" )

        # This mirrors the structure from applications/setup.rb with two tools.
        paths = [
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
            claude: [
              {
                source: "$HOME/.claude/settings.json",
                destination: "$HOME/.myconfigurations.private/claude/global/settings.json",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        tmux_source = File.join( tmpdir, ".tmux.conf" )
        claude_source = File.join( tmpdir, ".claude/settings.json" )

        # Both tools should have their symlinks created.
        expect( File.symlink?( tmux_source ) ).to be true
        expect( File.readlink( tmux_source ) ).to eq( tmux_dest )

        expect( File.symlink?( claude_source ) ).to be true
        expect( File.readlink( claude_source ) ).to eq( claude_dest )
      end
    end

    # --------------------------------------------------------------------------
    # Multiple path entries for a single tool
    # Claude has two path entries (settings.json and CLAUDE.md).
    # VSCode has three (settings, keybindings, snippets).
    # Verify all entries under one tool key are processed.
    # --------------------------------------------------------------------------
    context "when a tool has multiple path entries" do
      it "creates a symlink for each path entry" do
        settings_dest = File.join( tmpdir, ".myconfigurations.private/claude/global/settings.json" )
        claude_md_dest = File.join( tmpdir, ".myconfigurations.private/claude/brains/global/CLAUDE.md" )

        FileUtils.mkdir_p( File.dirname( settings_dest ) )
        FileUtils.mkdir_p( File.dirname( claude_md_dest ) )
        File.write( settings_dest, "{}" )
        File.write( claude_md_dest, "# CLAUDE" )

        # Mirrors the claude entry from applications/setup.rb exactly.
        paths = [
          {
            claude: [
              {
                source: "$HOME/.claude/settings.json",
                destination: "$HOME/.myconfigurations.private/claude/global/settings.json",
              },
              {
                source: "$HOME/.claude/CLAUDE.md",
                destination: "$HOME/.myconfigurations.private/claude/brains/global/CLAUDE.md",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        settings_source = File.join( tmpdir, ".claude/settings.json" )
        claude_md_source = File.join( tmpdir, ".claude/CLAUDE.md" )

        expect( File.symlink?( settings_source ) ).to be true
        expect( File.readlink( settings_source ) ).to eq( settings_dest )

        expect( File.symlink?( claude_md_source ) ).to be true
        expect( File.readlink( claude_md_source ) ).to eq( claude_md_dest )
      end
    end

    # --------------------------------------------------------------------------
    # Multiple path groups (separate array elements)
    # The main lib/setup.rb loads both dotfiles/setup.rb and
    # applications/setup.rb, each appending a separate hash to the PATHS array.
    # Verify that multiple array elements are all processed.
    # --------------------------------------------------------------------------
    context "when processing multiple path groups" do
      it "processes each group independently" do
        dotfile_dest = File.join( tmpdir, ".myconfigurations/dotfiles/.zshrc" )
        app_dest = File.join( tmpdir, ".myconfigurations/applications/tmux/conf" )

        FileUtils.mkdir_p( File.dirname( dotfile_dest ) )
        FileUtils.mkdir_p( File.dirname( app_dest ) )
        File.write( dotfile_dest, "zsh config" )
        File.write( app_dest, "tmux config" )

        # Two separate path groups, as if loaded from two different setup files.
        paths = [
          {
            dotfiles: [
              {
                source: "$HOME/.zshrc",
                destination: "$HOME/.myconfigurations/dotfiles/.zshrc",
              }
            ],
          },
          {
            tmux: [
              {
                source: "$HOME/.tmux.conf",
                destination: "$HOME/.myconfigurations/applications/tmux/conf",
              }
            ],
          }
        ]

        described_class.process_paths( paths )

        zshrc_source = File.join( tmpdir, ".zshrc" )
        tmux_source = File.join( tmpdir, ".tmux.conf" )

        expect( File.symlink?( zshrc_source ) ).to be true
        expect( File.readlink( zshrc_source ) ).to eq( dotfile_dest )

        expect( File.symlink?( tmux_source ) ).to be true
        expect( File.readlink( tmux_source ) ).to eq( app_dest )
      end
    end
  end
end

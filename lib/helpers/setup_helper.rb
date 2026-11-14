# frozen_string_literal: true

require "fileutils"
require "highline"
require_relative "path_helper"

module SetupHelper
  def self.ensure_private_path!
    return unless ENV["MYCONFIGURATIONS_PRIVATE_PATH"].to_s.strip.empty?

    abort( <<~ERROR )
      ERROR: MYCONFIGURATIONS_PRIVATE_PATH is not set.

      This variable must point to your private configurations directory
      (not tracked in git) before running setup, e.g.:

        export MYCONFIGURATIONS_PRIVATE_PATH="$HOME/.myconfigurations.private"

      Add it to your shell profile (or ~/.myconfigurations.private.keys),
      reload your shell, then re-run this script.
    ERROR
  end

  def self.process_paths( paths )
    cli = HighLine.new
    paths.each do |path_group|
      # Handle nested structure with tool names as keys (e.g., claude, claude2, etc.)
      path_group.each do |tool_name, tool_paths|
        puts( "\nProcessing paths for: #{tool_name}" )

        tool_paths.each do |path_config|
          source = PathHelper.expand_shell_path( path_config[:source] )
          destination = PathHelper.expand_shell_path( path_config[:destination] )

          if File.exist?( source ) || File.symlink?( source )
            if File.symlink?( source )
              current_target = File.readlink( source )
              if current_target == destination
                puts( "  Symlink already correct: #{source} -> #{destination}" )
                next
              else
                puts( "  Removing incorrect symlink: #{source} -> #{current_target}" )
                File.delete( source )
              end
            else
              cli.say( "  WARNING: Regular file exists at <%= color('#{source}', :yellow) %>" )
              if cli.agree( "  Replace with symlink? " )
                cli.say( "  Removing regular file: #{source}" )
                File.delete( source )
              else
                cli.say( "  Skipping: #{source}" )
                next
              end
            end
          end

          # Guard: never create $HOME itself -- only subdirectories within it.
          home_dir = Dir.home

          source_dir = File.dirname( source )
          if source_dir.start_with?( home_dir ) && !File.exist?( home_dir )
            puts( "  ERROR: Home directory does not exist: #{home_dir}, skipping!" )
            next
          end

          destination_dir = File.dirname( destination )
          if destination_dir.start_with?( home_dir ) && !File.exist?( home_dir )
            puts( "  ERROR: Home directory does not exist: #{home_dir}, skipping!" )
            next
          end

          unless File.exist?( source_dir )
            base_dir = deepest_existing_ancestor( source_dir )
            puts( "  Creating source directory: #{source_dir}" )
            FileUtils.mkdir_p( source_dir )
            add_keep_files( source_dir, base_dir )
          end

          unless File.exist?( destination_dir )
            base_dir = deepest_existing_ancestor( destination_dir )
            FileUtils.mkdir_p( destination_dir )
            add_keep_files( destination_dir, base_dir )
          end

          puts( "  Creating symlink: #{source} -> #{destination}" )
          File.symlink( destination, source )
        end
      end
    end
  end

  def self.deepest_existing_ancestor( dir )
    current = dir
    current = File.dirname( current ) until File.exist?( current ) || current == "/" || current == "."
    current
  end

  def self.add_keep_files( dir, base_dir )
    current = dir
    dirs_to_keep = []
    while current != base_dir && current != "/" && current != "."
      dirs_to_keep << current
      current = File.dirname( current )
    end
    dirs_to_keep.each do |d|
      keep_file = File.join( d, ".keep" )
      FileUtils.touch( keep_file ) unless File.exist?( keep_file )
    end
  end
end

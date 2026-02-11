# frozen_string_literal: true

require 'helpers/path_helper'

# PathHelper.expand_shell_path takes a path string that may contain shell-style
# variables ($HOME, $USER, $PWD) and returns a fully expanded absolute path.
# It performs simple string substitution — not a full shell eval — then delegates
# to File.expand_path for final resolution.
RSpec.describe PathHelper do
  describe '.expand_shell_path' do
    # --------------------------------------------------------------------------
    # $HOME expansion
    # The method replaces the literal string "$HOME" with ENV['HOME'].
    # This is the most common variable used in the project's setup configs
    # (e.g., "$HOME/.tmux.conf" → "/Users/christopherhough/.tmux.conf").
    # --------------------------------------------------------------------------
    context 'when the path contains $HOME' do
      it 'replaces $HOME with the HOME environment variable' do
        path = '$HOME/.config/settings.json'
        result = described_class.expand_shell_path(path)

        expect(result).to eq(File.join(ENV['HOME'], '.config/settings.json'))
      end

      # Paths from applications/setup.rb use $HOME in both source and destination,
      # e.g., "$HOME/.claude/settings.json". Verify multiple $HOME tokens in a
      # single string are all replaced.
      it 'replaces multiple occurrences of $HOME' do
        path = '$HOME/from/$HOME/to'
        result = described_class.expand_shell_path(path)

        expected = File.join(ENV['HOME'], 'from', ENV['HOME'], 'to')
        expect(result).to eq(expected)
      end
    end

    # --------------------------------------------------------------------------
    # $USER expansion
    # The method replaces "$USER" with ENV['USER'], but only when that
    # environment variable is set. This guards against nil substitution.
    # --------------------------------------------------------------------------
    context 'when the path contains $USER' do
      it 'replaces $USER with the USER environment variable' do
        path = '/home/$USER/projects'
        result = described_class.expand_shell_path(path)

        expect(result).to eq("/home/#{ENV['USER']}/projects")
      end
    end

    # When ENV['USER'] is nil (e.g., inside some containerized environments),
    # the $USER token must be left untouched so it doesn't blow up.
    context 'when ENV["USER"] is nil' do
      around do |example|
        original_user = ENV['USER']
        ENV.delete('USER')
        example.run
      ensure
        ENV['USER'] = original_user
      end

      it 'leaves $USER unexpanded in the path' do
        path = '/home/$USER/projects'
        result = described_class.expand_shell_path(path)

        # File.expand_path won't touch the literal "$USER" text, so it stays.
        expect(result).to include('$USER')
      end
    end

    # --------------------------------------------------------------------------
    # $PWD expansion
    # Replaces "$PWD" with Dir.pwd — useful when paths are relative to the
    # directory the setup script is invoked from.
    # --------------------------------------------------------------------------
    context 'when the path contains $PWD' do
      it 'replaces $PWD with the current working directory' do
        path = '$PWD/lib/helpers'
        result = described_class.expand_shell_path(path)

        expect(result).to eq(File.join(Dir.pwd, 'lib/helpers'))
      end
    end

    # --------------------------------------------------------------------------
    # Combined variables
    # The project's setup files can theoretically mix variables. Ensure all
    # three are expanded in a single pass.
    # --------------------------------------------------------------------------
    context 'when the path contains multiple different variables' do
      it 'expands all recognized variables' do
        path = '$HOME/$USER/$PWD'
        result = described_class.expand_shell_path(path)

        # After substitution the path is processed by File.expand_path, which
        # resolves it to an absolute path. We check that none of the variable
        # tokens remain in the result.
        expect(result).not_to include('$HOME')
        expect(result).not_to include('$USER')
        expect(result).not_to include('$PWD')
        expect(result).to include(ENV['HOME'])
      end
    end

    # --------------------------------------------------------------------------
    # No variables — passthrough
    # A plain absolute path should be returned unchanged (after expand_path
    # normalization).
    # --------------------------------------------------------------------------
    context 'when the path contains no variables' do
      it 'returns the path resolved by File.expand_path' do
        path = '/usr/local/bin/tool'
        result = described_class.expand_shell_path(path)

        expect(result).to eq('/usr/local/bin/tool')
      end
    end

    # --------------------------------------------------------------------------
    # Relative path resolution
    # File.expand_path converts relative paths to absolute ones using the
    # current working directory as the base. Verify this final step works.
    # --------------------------------------------------------------------------
    context 'when the path is relative after substitution' do
      it 'resolves it to an absolute path' do
        path = 'relative/path/file.txt'
        result = described_class.expand_shell_path(path)

        expect(result).to eq(File.expand_path('relative/path/file.txt'))
        expect(Pathname.new(result)).to be_absolute
      end
    end
  end
end

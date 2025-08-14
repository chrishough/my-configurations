require 'fileutils'
require_relative 'path_helper'

module SetupHelper
  def self.process_paths(paths)
    paths.each do |path_config|
      source = PathHelper.expand_shell_path(path_config[:source])
      destination = PathHelper.expand_shell_path(path_config[:destination])

      if File.exist?(source) || File.symlink?(source)
        if File.symlink?(source)
          current_target = File.readlink(source)
          if current_target != destination
            puts "Removing incorrect symlink: #{source} -> #{current_target}"
            File.delete(source)
          else
            puts "Symlink already correct: #{source} -> #{destination}"
            next
          end
        else
          puts "Regular file exists at #{source}, cannot create symlink"
          next
        end
      end

      destination_dir = File.dirname(destination)
      FileUtils.mkdir_p(destination_dir) unless File.exist?(destination_dir)

      puts "Creating symlink: #{source} -> #{destination}"
      File.symlink(destination, source)
    end
  end
end
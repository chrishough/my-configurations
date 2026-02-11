# frozen_string_literal: true

require "fileutils"
require_relative "path_helper"

module SetupHelper
  def self.process_paths( paths )
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
              puts( "  Regular file exists at #{source}, cannot create symlink" )
              next
            end
          end

          # Guard: never create $HOME itself -- only subdirectories within it.
          home_dir = Dir.home

          source_dir = File.dirname( source )
          if source_dir.start_with?( home_dir ) && !File.exist?( home_dir )
            puts( "  ERROR: Home directory does not exist: #{home_dir}, skipping" )
            next
          end

          destination_dir = File.dirname( destination )
          if destination_dir.start_with?( home_dir ) && !File.exist?( home_dir )
            puts( "  ERROR: Home directory does not exist: #{home_dir}, skipping" )
            next
          end

          unless File.exist?( source_dir )
            puts( "  Creating source directory: #{source_dir}" )
            FileUtils.mkdir_p( source_dir )
          end

          FileUtils.mkdir_p( destination_dir )

          puts( "  Creating symlink: #{source} -> #{destination}" )
          File.symlink( destination, source )
        end
      end
    end
  end
end

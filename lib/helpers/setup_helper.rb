# frozen_string_literal: true

require "fileutils"
require "highline"
require_relative "path_helper"

module SetupHelper
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
            puts( "  Creating source directory: #{source_dir}" )
            FileUtils.mkdir_p( source_dir )
            add_keep_file( source_dir )
          end

          unless File.exist?( destination_dir )
            FileUtils.mkdir_p( destination_dir )
            add_keep_file( destination_dir )
          end

          puts( "  Creating symlink: #{source} -> #{destination}" )
          File.symlink( destination, source )
        end
      end
    end
  end

  def self.add_keep_file( dir )
    keep_file = File.join( dir, ".keep" )
    FileUtils.touch( keep_file ) unless File.exist?( keep_file )
  end
end

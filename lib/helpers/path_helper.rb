module PathHelper
  def self.expand_shell_path(path)
    expanded = path.gsub('$HOME', ENV['HOME'])
    expanded = expanded.gsub('$USER', ENV['USER']) if ENV['USER']
    expanded = expanded.gsub('$PWD', Dir.pwd)
    File.expand_path(expanded)
  end
end
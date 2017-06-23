require 'fileutils'

def create_itermocil
  app_dir = File.join(Dir.home, '.myconfigurations', 'workstation', 'itermocil')
  dofile_shortcut =  File.join(Dir.home, '.itermocil')
  FileUtils.ln_s(app_dir, dofile_shortcut, force: true)
  puts "itermocil} shortcut has been created successfully..."
end

create_itermocil

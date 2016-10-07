module Settings
  DOT_FILE_LIST = ['config.cson', 'keymap.cson', 'packages.cson', 'snippets.cson', 'styles.less']
  HOME_DIR = File.join(Dir.home,'.atom')
  BACKUP_DIR = File.join(Dir.home,'.atom-backups')
  WORKING_DIR = File.join(Dir.home,'.myconfigurations','workstation','atom')

  def build_file_vars(filename)
    @curr_dot_file = File.join(HOME_DIR,filename)
    @new_dot_file = File.join(WORKING_DIR,filename)
  end
end

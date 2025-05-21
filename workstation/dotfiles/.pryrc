begin
  Pry.config.default_window_size = 25
  Pry.config.pager = false
rescue
  puts 'gem pry is not installed!'
end

begin
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'e', 'exit'
rescue
  puts 'gem pry-nav is not installed!'
end

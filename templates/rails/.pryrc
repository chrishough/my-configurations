Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'e', 'exit'
Pry.config.default_window_size = 25

require 'factory_girl_rails'
require 'ffaker'

class FactoryGirlPry
  def method_missing(name, *args)
    FactoryGirl.create(name.to_sym, *args)
  end
end
@fg = FactoryGirlPry.new

def env
  env = Rails.env
  if env.production?
    "\e[1;31m#{env}\e[0m - "
  else
    "\e[1;32m#{env}\e[0m - "
  end
end

prompt = env

Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt}(#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt}(#{obj}):#{nest_level} * " }
]

Pry.config.hooks.add_hook(:before_session, :show_ruby_version) do
  puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
end

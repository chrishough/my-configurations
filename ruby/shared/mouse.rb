def get_mouse_position
  `cliclick p:.`
end

def move_mouse(x,y)
  `cliclick m:#{x},#{y}`
end

def click_mouse(x,y)
  `cliclick c:#{x},#{y}`
end

def parse_position
  pos = get_mouse_position
  pos.scan(/\d+/)
end

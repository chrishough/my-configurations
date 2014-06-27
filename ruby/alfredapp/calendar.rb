require_relative '../shared/mouse.rb'

curr_pos = parse_position
x = curr_pos[0]
y = curr_pos[1]

move_mouse(1646,10)
click_mouse(1646,10)
move_mouse(x,y)

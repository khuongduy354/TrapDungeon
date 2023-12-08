extends Node2D
class_name BaseInputHandler

enum InputMode{basic, mousespace, updown}

func get_action(player: Player, mode:InputMode = InputMode.basic)->Action: 
	match mode: 
		InputMode.basic: 
			if Input.is_action_just_pressed("jump"): 
				return JumpAction.new()
			var dir = get_basic_input()
			return MovementAction.new(dir)			
		InputMode.mousespace: 
			var dir = get_spacemouse_input(player)
			if Input.is_action_pressed("jump"): 
				return FlyAction.new(dir)
			return FlyAction.new(Vector2.ZERO)
		InputMode.updown: 
			return DiveAction.new(Input.is_action_just_pressed("jump"))
			
			
	return null

func get_basic_input(): 
	var dir = Vector2.ZERO
	dir.x = Input.get_axis("ui_left","ui_right")
	dir.y = Input.get_axis("ui_up","ui_down")
	return dir

func get_spacemouse_input(player: Player): 
	var mousepos = get_global_mouse_position()
	var dir = player.global_position.direction_to(mousepos)
	return dir 

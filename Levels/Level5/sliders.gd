extends Node2D

var move = false 
func _physics_process(delta): 
	if move:
		for child in get_children(): 
			child.position.x -= 10*delta

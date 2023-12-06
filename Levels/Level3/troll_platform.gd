extends CharacterBody2D

@export var move_speed = 3000 
@export var should_move = false
func _physics_process(delta):
	if !should_move: 
		return 
	var dir = global_position.direction_to($move_dir.global_position)
	velocity = move_speed * dir * delta 

	move_and_slide()


func _on_area_2d_body_entered(body):
	should_move = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

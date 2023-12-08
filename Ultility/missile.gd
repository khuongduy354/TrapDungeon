extends CharacterBody2D
class_name MissileBullet

@export var initial_dir = Vector2.UP
@export var speed = 3000
@export var drag = 0.1

var target: Player 
func _ready(): 
	set_as_top_level(true)
	velocity = initial_dir * 1500
func _on_hitbox_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

func set_target(p): 
	target = p 

func _physics_process(delta): 
	if target: 
		var dir = global_position.direction_to(target.global_position)
		var target_veloc = speed * delta * dir 
		velocity = velocity + (target_veloc - velocity) * drag
		look_at(target.global_position)
	move_and_slide()
	

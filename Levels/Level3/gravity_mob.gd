extends CharacterBody2D
class_name GravityMob

@export var flipped = false: 
	set(val): 
		flipped = val  
		if flipped: 
			$flip_pivot.scale.y = -abs($flip_pivot.scale.y)
		else:
			$flip_pivot.scale.y = abs($flip_pivot.scale.y)
			

func apply_gravity(delta): 
	var grav_dir = -1 if flipped else 1
	velocity.y += grav_dir * StaticGlobal.GRAVITY * delta
	
func _physics_process(delta):
	apply_gravity(delta)

	move_and_slide()


func _on_hitbox_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

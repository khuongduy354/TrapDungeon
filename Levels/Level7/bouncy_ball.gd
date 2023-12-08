extends RigidBody2D
class_name BouncyBall
signal bounce_changed

var velocity = Vector2.ZERO
var force = 250
var bounce = 2:
	set(val): 
		bounce = val 
		bounce_changed.emit(bounce)
		
var p: Player

func _initialize_(_p):
	p = _p
func target_player(): 
	var dir = global_position.direction_to(p.global_position) 
	velocity = dir * force 
func _physics_process(delta): 
	var collision_info = move_and_collide(velocity * delta)
	if collision_info and bounce < 2:
		bounce += 1
		velocity = velocity.bounce(collision_info.get_normal())
	elif bounce == 2:
		target_player()
		bounce = 0 

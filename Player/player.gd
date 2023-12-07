extends MoveableEntity
class_name Player 
@onready var input_handler = $BaseInputHandler as BaseInputHandler 
@onready var cam = $Camera2D
@export var jump_force = 500
var grav_dir = 1
func _physics_process(delta): 
	var action = input_handler.get_action(self)
	apply_gravity(delta)
	if action is MovementAction: 
		_move(action.dir,delta)
	elif action is JumpAction: 
		_jump() 
	move_and_slide()
		
func _jump(): 
	velocity.y = -jump_force * grav_dir
func _move(dir, delta): 
	velocity.x = dir.x * move_speed * delta

func apply_gravity(delta): 
	velocity.y += grav_dir * StaticGlobal.GRAVITY * delta 
	pass 


func _on_hurtbox_area_entered(area):
	g.player_hitted.emit()


func _on_check_stuck_body_entered(body):
	await get_tree().create_timer(.3).timeout
	if $CheckStuck.get_overlapping_bodies().size() > 0: 
		print("Stuck")
		$CollisionShape2D.set_deferred("disabled",true)
		$CheckStuck/CollisionShape2D2.set_deferred("disabled",true)
		await get_tree().create_timer(.01).timeout
		$CollisionShape2D.set_deferred("disabled",false)
		$CheckStuck/CollisionShape2D2.set_deferred("disabled",false)
		
		

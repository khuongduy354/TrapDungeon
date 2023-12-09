extends MoveableEntity
class_name Player 
signal stuck
@onready var input_handler = $BaseInputHandler as BaseInputHandler 
@onready var cam = $Camera2D
@export var jump_force = 500
@export var fly_force = 10 
var grav_dir = 1:
	set(val): 
		grav_dir = val
		up_direction = Vector2.UP * grav_dir
var input_mode = BaseInputHandler.InputMode.basic
var dive_dir = Vector2(1,1)

func _physics_process(delta): 
	var action = input_handler.get_action(self,input_mode)
	if action is MovementAction:
		apply_gravity(delta)
		_move(action.dir,delta)
	elif action is JumpAction: 
		apply_gravity(delta)
		if is_on_floor(): 
			_jump() 
	elif action is FlyAction: 
		_fly(action.dir,delta)
	elif action is DiveAction: 
		_dive(delta,action.switch) 
	move_and_slide()
func _dive(delta,switch): 
	if switch:
		dive_dir.y = -dive_dir.y	
	velocity = dive_dir * move_speed * delta
func _jump(): 
	velocity.y = -jump_force * grav_dir
func _fly(dir,delta): 
	velocity = dir * move_speed * delta
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
		stuck.emit() 
		$CollisionShape2D.set_deferred("disabled",true)
		$CheckStuck/CollisionShape2D2.set_deferred("disabled",true)
		await get_tree().create_timer(.01).timeout
		$CollisionShape2D.set_deferred("disabled",false)
		$CheckStuck/CollisionShape2D2.set_deferred("disabled",false)
		
		

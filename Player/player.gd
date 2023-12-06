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

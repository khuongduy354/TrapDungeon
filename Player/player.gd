extends MoveableEntity
class_name Player 
@onready var input_handler = $BaseInputHandler as BaseInputHandler 
@onready var cam = $Camera2D
@export var jump_force = 500

func _physics_process(delta): 
	var action = input_handler.get_action(self)
	apply_gravity(delta)
	if action is MovementAction: 
		_move(action.dir,delta)
	elif action is JumpAction: 
		_jump() 
	move_and_slide()
		
func _jump(): 
	velocity.y = -jump_force
func _move(dir, delta): 
	velocity.x = dir.x * move_speed * delta

func apply_gravity(delta): 
	velocity.y += StaticGlobal.GRAVITY * delta 
	pass 


func _on_hurtbox_area_entered(area):
	g.player_hitted.emit()

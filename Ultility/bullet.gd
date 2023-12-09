extends CharacterBody2D
class_name Bullet

@export var speed = 5000
var dir = Vector2.ZERO 

func _ready(): 
	set_as_top_level(true)
	
func set_dir(_dir: Vector2): 
	dir = _dir 
	look_at(dir)

func _physics_process(delta):
	velocity = speed * dir * delta
	move_and_slide() 


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hitbox_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

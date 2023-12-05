extends RigidBody2D

@export var dir = 1
@export var speed = 4
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta): 
	var velocity = speed * dir * Vector2.DOWN * delta
	move_and_collide(velocity)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

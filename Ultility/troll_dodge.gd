extends Area2D

@export var offset = 10
@export var oneshot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Player: 
		var dir = -global_position.direction_to(body.global_position)
		get_parent().position += dir * offset
		if oneshot: 
			$CollisionShape2D.set_deferred("disabled",true)
		

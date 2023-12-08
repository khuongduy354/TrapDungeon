extends Area2D
signal switched
# Called when the node enters the scene tree for the first time.

@export var activated = false: 
	set(val): 
		activated = val 
		monitorable = activated
		monitoring = activated
		visible = activated
		
func _ready():
	activated = activated
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is BouncyBall: 
		self.modulate = Color.html("#236d7b")
		switched.emit()
		activated = true 
		$Sprite.frame = 1 

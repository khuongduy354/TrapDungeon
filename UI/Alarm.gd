extends CanvasLayer

var activated = false 
func _ready():
	set_physics_process(false)
func activate(): 
	set_physics_process(true)
	var activated = true 
	$ColorRect.visible = true 
	$TextureRect.visible = true
	$AudioStreamPlayer.play()
func _process(delta):
	if Input.is_action_just_pressed("enter") or Input.is_action_just_pressed("left_click"): 
		queue_free()
	

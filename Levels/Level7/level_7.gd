extends BaseLevel
var started = false
func _initialize_(_p: Player): 
	super._initialize_(_p) 
	$BouncyBall._initialize_(_p)
	$BouncyBall.bounce_changed.connect(_on_bounce_change)
	setup_switches()
	$BouncyBall.set_physics_process(false)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept") and !started: 
		started = true
		$BouncyBall.set_physics_process(true)
		$Label3.queue_free()
	
func setup_switches(): 
	for switch in $Buttons.get_children(): 
		var idx = switch.get_index()
		if idx < $Buttons.get_child_count()-1:
			switch.switched.connect(func(): $Buttons.get_child(idx+1).activated = true )
		else: 
			switch.switched.connect(_on_last_switch)
func _on_last_switch(): 
	for switch in $Buttons.get_children(): 
		if !switch.activated: 
			return 
	for pos in $Positions.get_children(): 
		clear_tile(pos.global_position)
	

func _on_bounce_change(val): 
	$CanvasLayer/Label.text = "Bounces: "+str(val+1)
#		$CanvasLayer/L abel.text += "! Next bounce retarget!"
func _on_area_2d_body_entered(body):
	if body is Player: 
		out_scene.emit()

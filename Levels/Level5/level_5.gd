extends BaseLevel

func _initialize_(_p: Player): 
	super._initialize_(_p)
	_p.input_mode = BaseInputHandler.InputMode.mousespace
	_p.stuck.connect(func(): g.player_hitted.emit())
	_p.cam.zoom = Vector2(1.5,1.5)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_c_1_body_entered(body):
	$sliders/RigidBody2D8.shoot_left_to_right()
	$sliders/RigidBody2D8.speed = 5 
	pass # Replace with function body.


func _on_c_2_body_entered(body):
	$sliders/RigidBody2D9.shoot_left_to_right()
	$AnimationPlayer.play("rotate")


func _on_spawnoncollide_body_entered(body):
	for colli in $trigger/spawnoncollide.get_children(): 
		fill_tile(colli.global_position)



func _on_c_3_body_entered(body):
	$trigger/spawnoncollide.monitorable = true
	$trigger/spawnoncollide.monitoring = true
	


func _on_c_4_body_entered(body):
	$static_traps.move = true
	$sliders/RigidBody2D6.shoot_left_to_right()
	$sliders/RigidBody2D6.speed = 4
	$sliders/RigidBody2D7.speed = 4


func _on_c_5_body_entered(body):
	$sliders/RigidBody2D.shoot_left_to_right()
	await get_tree().create_timer(3).timeout
	$sliders/RigidBody2D2.shoot_left_to_right()


func _on_c_6_body_entered(body):
	$sliders/RigidBody2D3.speed = 15
	$sliders/RigidBody2D4.speed = 20


func _on_c_7_body_entered(body):
	$sliders/RigidBody2D4.dir = 1
	$sliders/RigidBody2D4.speed = 40
	


func _on_c_8_body_entered(body):
	if $CanvasLayer: 
		$CanvasLayer.activate()
  

func _on_c_10_body_entered(body):
	out_scene.emit()


func _on_c_9_body_entered(body):
	$sliders/RigidBody2D5.shoot_left_to_right()
	pass # Replace with function body.

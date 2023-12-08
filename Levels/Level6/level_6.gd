extends BaseLevel

# collide = doom 
# setup basic traps 
# improvise

func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.input_mode = BaseInputHandler.InputMode.updown
#func _physics_process(delta): 
#	if p.get_slide_collision_count() > 0: 
#		print("DOOM")


func _on_c_1_body_entered(body):
	for child in $MovingTrap.get_children(): 
		if child.get_index() == 0: 
			continue 
		if !child.is_in_group("no_move"):
			child.speed = 10
		child.shoot_left_to_right()


func _on_c_2_body_entered(body):
	var t = $trigger/c2/StaticTrap22
	$trigger/c2/CollisionShape2D.set_deferred("disabled",false)
	t.visible = true 
	await get_tree().create_timer(3).timeout
	t.queue_free()


func _on_c_3_body_entered(body):
	$AnimationPlayer.play("last")
	pass # Replace with function body.


func _on_c_4_body_entered(body):
	out_scene.emit()

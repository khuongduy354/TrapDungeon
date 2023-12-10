extends BaseLevel
var boss_speed = 0 

func _physics_process(delta):
	$Boss.global_position.x += boss_speed * delta 
	
func _initialize_(_p: Player): 
	super._initialize_(_p)
	_p.jump_force = 400
	_p.cam=Vector2(1,1)
func _on_area_2d_body_entered(body):
	if body is Player: 
		boss_speed = 60
		$AnimationPlayer.play("walk")


func _on_c_2_body_entered(body):
	for slide in $sliders.get_children(): 
		slide.shoot_left_to_right()


func _on_c_3_body_entered(body):
	for slide in $sliders2.get_children(): 
		slide.shoot_left_to_right()


func _on_c_4_area_entered(area):
	if area.owner is Boss: 
		$AnimationPlayer.play("RESET")
		boss_speed = 0 
		$boss_timer.start()


func _on_boss_timer_timeout():
	print("hi")
	$Boss.shoot(p)
	
var health = 1000
func _on_c_5_area_entered(area):
	if area.owner.is_in_group("block_bullet"): 
		health -= 10
		if g.show_hint: 
			$Label.visible = !$Label.visible
		else: 
			$Label.visible = false
		if health <= 0: 
			for pos in $Positions3.get_children(): 
				clear_tile(pos.global_position)
		area.owner.queue_free()


func _on_death_zone_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

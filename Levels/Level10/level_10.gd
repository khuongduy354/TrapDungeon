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
		boss_speed = 0 
		$boss_timer.start()


func _on_boss_timer_timeout():
	$Boss.shoot(p)
	
var health = 1000
func _on_c_5_area_entered(area):
	if area.owner.is_in_group("block_bullet"): 
		health -= 5
		$Label.visible = !$Label.visible
		print("hey")
		if health <= 0: 
			print("WIN")	
		area.owner.queue_free()

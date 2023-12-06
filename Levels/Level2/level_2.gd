extends BaseLevel

# 2 limiters done 
# 2 mobs done 
# shooting done 
# platforms done 
# jump nerfs
var is_snapped = false 
func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.cam.zoom = Vector2(1.3,1.3)
	p.jump_force = 350
	for mobs in $Mobs.get_children(): 
		mobs._initialize_(p)
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_top_area_entered(area):
	if area.is_in_group("knife"): 
		area.owner.speed = 0
		area.owner.shoot_left_to_right()
		await get_tree().create_timer(5).timeout
		if !is_snapped:
			$AnimationPlayer.play("slap")
			is_snapped = true

var mob_kills = 0 
func _on_rigid_body_2d_mob_killed(_mob):
	_mob.queue_free()
	if mob_kills < 1: 
		mob_kills +=1
		return
	for mob in $Mobs.get_children():
		mob.queue_free()
	for exit in $Exit.get_children(): 
		clear_tile(exit.global_position)


func _on_exit_body_entered(body):
	out_scene.emit()

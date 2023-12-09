extends Node2D


func shoot(gpos): 
	if !$shoot_rate.is_stopped():
		return 
	var bullet:Bullet = preload("res://Levels/Level9/block_bullet.tscn").instantiate()
	bullet.set_dir(global_position.direction_to(gpos))
	add_child(bullet)
	bullet.global_position = global_position
	$shoot_rate.start()

extends GravityMob





func _on_timer_timeout():
	var bullet = preload("res://Levels/Level2/bone_bullet.tscn").instantiate()
	var dir = Vector2.UP * (-1 if flipped else 1)
	bullet.speed *= 1.5
	bullet.set_dir(dir)
	add_child(bullet)
	bullet.global_position = global_position

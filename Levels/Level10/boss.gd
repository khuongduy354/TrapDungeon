extends Node2D
class_name Boss
func shoot(p:Player): 
	match randi()%3: 
		0: 
			for i in range(10): 
				shoot_straight(p)
				await get_tree().create_timer(.1).timeout
		1: 
			for i in range(3): 
				shoot_circle()
				await get_tree().create_timer(.3).timeout
		2: shoot_hell()
		
	pass
func shoot_straight(p: Player): 
	var dir = global_position.direction_to(p.global_position) 
	var bullet = preload("res://Levels/Level9/block_bullet.tscn").instantiate()
	bullet.set_dir(dir)
	bullet.speed = 7000
	add_child(bullet)
	bullet.global_position = global_position
func shoot_circle(): 
	for i in range(36): 
		var dir = Vector2.RIGHT.rotated(i*PI/18)
		var bullet = preload("res://Levels/Level9/block_bullet.tscn").instantiate()
		bullet.set_dir(dir)
		bullet.speed = 7000
		
		add_child(bullet)
		bullet.global_position = global_position
		
func shoot_hell(): 
	var bullets = [] 
	for i in range(36): 
		var dir = Vector2.RIGHT.rotated(i*PI/18)
		var bullet = preload("res://Levels/Level9/block_bullet.tscn").instantiate()
		bullet.speed = 7000
		
		bullet.set_dir(dir)
		add_child(bullet)
		bullet.global_position = global_position
		bullets.append(bullet)
	await get_tree().create_timer(3).timeout
	for obullet in bullets: 
		if !obullet: 
			continue
		var dirs = [] 
		for i in range(4): 
			var sdir = obullet.dir.rotated(i*PI/2)
			dirs.append(sdir)
		for dir in dirs: 
			var bullet = preload("res://Levels/Level9/block_bullet.tscn").instantiate()
			bullet.set_dir(dir)
			bullet.scale = obullet.scale/2
			bullet.speed = 8000
			add_child(bullet)
			bullet.global_position = obullet.global_position
		
		


func _on_hitbox_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

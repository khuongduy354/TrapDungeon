extends CharacterBody2D

var p: Player 

func _initialize_(_p: Player): 
	p = _p


func _on_shoot_rate_timeout():
	if p: 
		var dir = global_position.direction_to(p.global_position)
		var bullet: Bullet = preload("res://Levels/Level2/bone_bullet.tscn").instantiate()
		bullet.set_dir(dir)
		get_tree().root.add_child(bullet)
		bullet.global_position = global_position

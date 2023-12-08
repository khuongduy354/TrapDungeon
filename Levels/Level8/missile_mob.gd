extends CharacterBody2D

func shoot(p: Player): 
	var bullet = preload("res://Ultility/missile.tscn").instantiate()
	bullet.set_target(p)
	add_child(bullet)
	bullet.global_position = global_position

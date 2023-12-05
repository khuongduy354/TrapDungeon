extends Node2D

@onready var input_handler = $BaseInputHandler as BaseInputHandler
var current_level:BaseLevel
var current_level_idx = 1
var player: Player 

	
func _ready(): 
	load_player()
	load_level()
	

func load_level(): 
	if current_level_idx == 0: 
		var node = preload("res://Levels/base_level.tscn").instantiate()
		add_child(node)
		current_level = node 
		return 
		
	var path = "res://Levels/level_"+ str(current_level_idx) + ".tscn"
	var node = load(path).instantiate() 
	add_child(node)
	node._initialize_(player)
	current_level = node 
	pass 
	
func load_player(pos: Vector2 = Vector2.ZERO):
	player = preload("res://Player/player.tscn").instantiate()
	add_child(player)
	player.global_position = pos


extends Node2D

@onready var input_handler = $BaseInputHandler as BaseInputHandler
var current_level:BaseLevel
var real_idx = 1 
var current_level_idx = 1:
	set(val):
		current_level_idx = level_mapper(val)
var player: Player 

var death_count = 0
var hearts = 0

func level_mapper(idx: int): 
	var result = 0
	match idx: 
		1: 
			result = 8 
		2: 
			result = 4
		3: 
			result = 3
		4: 
			result = 1
		5: 
			result = 7
		6: 
			result = 9
		7: 
			result = 2
		8: 
			result = 6
		9: 
			result = 5
		10: 
			result = 10
	return result
func _ready(): 
	current_level_idx = g.level_idx
	real_idx = g.level_idx
	
	if g.mode == g.modes.LIMITLESS:
		g.player_hitted.connect(_on_limitless_death)
		$PlayerUI/Label.text = "Death Counts: 0" 
	elif g.mode == g.modes.HEARTS:
		g.player_hitted.connect(_on_heart_death)
		hearts = g.hearts
		$PlayerUI/Label.text = "Lifes: " + str(g.hearts)
	start_level()
		
		
func _on_heart_death(): 
	hearts -= 1 
	$PlayerUI/Label.text = "Lifes: " + str(hearts)
	if hearts <= 0: 
		current_level_idx = 1
		hearts = g.hearts
		$PlayerUI/Label.text = "Lifes: " + str(hearts)

	clear()
	$CanvasLayer.visible = true 
	await get_tree().create_timer(1).timeout
	$CanvasLayer.visible = false 
	
	start_level()
	
func _on_limitless_death(): 
	clear()
	$CanvasLayer.visible = true 
	await get_tree().create_timer(1).timeout
	$CanvasLayer.visible = false 
	start_level()
	death_count += 1
	$PlayerUI/Label.text = "Death Counts: "+str(death_count)
func clear(): 
	player.queue_free()
	current_level.queue_free()
	
func start_level(): 
	load_level()
	load_player()
	current_level._initialize_(player)
	current_level.out_scene.connect(_on_level_done)	

func _on_level_done(): 
	# save new progress 
	var old = g.read_max_lv_from_file()
	if real_idx > old: 
		g.save(str(real_idx))
		
	# do level done 
	clear()
	if real_idx == 10:
		get_tree().change_scene_to_file("res://UI/win.tscn")
		return
	$NextLevel.visible = true
	real_idx += 1 
	current_level_idx = real_idx
	await get_tree().create_timer(1).timeout
	$NextLevel.visible = false
	start_level()
	
func _physics_process(delta): 
	if Input.is_action_just_pressed("r"): 
		if current_level != null:
			current_level.out_scene.emit()
	if Input.is_action_just_pressed("esc"): 
		$Pause.visible = true 
		get_tree().paused = true

	pass
func load_level(): 
	if current_level_idx == 0: 
		var node = preload("res://Levels/base_level.tscn").instantiate()
		add_child(node)
		current_level = node 
		return 
		
	var path = "res://Levels/Level"+ str(current_level_idx) + "/level_"+ str(current_level_idx) + ".tscn"
	var node = load(path).instantiate() 
	add_child(node)
	current_level = node 
	pass 
	
func load_player(pos: Vector2 = Vector2.ZERO):
	player = preload("res://Player/player.tscn").instantiate()
	add_child(player)
	player.global_position = pos


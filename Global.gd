extends Node
class_name G

signal player_hitted

enum modes{LIMITLESS,HEARTS}
var mode = modes.LIMITLESS
var hearts = 0
var level_idx = 1

func wait(time): 
	await get_tree().create_timer(time).timeout	

func _ready(): 
	player_hitted.connect(func(): print("HITTED"))

func read_max_lv_from_file(): 
	

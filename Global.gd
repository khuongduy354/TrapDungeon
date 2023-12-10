extends Node
class_name G

signal player_hitted

enum modes{LIMITLESS,HEARTS}
var mode = modes.LIMITLESS
var hearts = 0
var level_idx = 1
var show_hint = true
var dmg_immune = false
func wait(time): 
	await get_tree().create_timer(time).timeout	

func _ready(): 
	player_hitted.connect(func(): print("HITTED"))

func read_max_lv_from_file()->int: 
	var result =""
	var txtFile = FileAccess.open("user://max_level.txt", FileAccess.READ)
	if !FileAccess.file_exists("user://max_level.txt"): 
		txtFile = FileAccess.open("user://max_level.txt", FileAccess.WRITE)
	result = txtFile.get_as_text()
	if result == "": 
		save(str(10))
		return 10
	txtFile.close()
	return int(result)
	
func save(content):
	var file = FileAccess.open("user://max_level.txt", FileAccess.WRITE)
	file.store_string(content)
	file.close()

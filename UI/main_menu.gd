extends CanvasLayer
@onready var lvinfo = $CenterContainer/MarginContainer/VBoxContainer/level_info
@onready var lvslider = $CenterContainer/MarginContainer/VBoxContainer/HSlider2
@onready var hearts_edit = $CenterContainer/MarginContainer/VBoxContainer/LineEdit


func _ready():
	lvslider.max_value = g.read_max_lv_from_file()

func _on_nolimit_pressed():
	g.mode = g.modes.LIMITLESS
	get_tree().change_scene_to_file("res://Levels/game.tscn")
	
func _on_heart_pressed():
	if !hearts_edit.text.is_valid_int():
		return
	g.mode = g.modes.HEARTS
	g.hearts = int(hearts_edit.text)
	get_tree().change_scene_to_file("res://Levels/game.tscn")


func _on_h_slider_2_value_changed(value):
	lvinfo.text = "Level selected: "+str(value)
	g.level_idx = value

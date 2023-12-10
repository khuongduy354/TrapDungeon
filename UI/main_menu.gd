extends CanvasLayer
@onready var lvinfo = $CenterContainer/MarginContainer/VBoxContainer/level_info
@onready var lvslider = $CenterContainer/MarginContainer/VBoxContainer/HSlider2
@onready var hearts_edit = $CenterContainer/MarginContainer/VBoxContainer/LineEdit


func _ready():
	$CenterContainer/MarginContainer/VBoxContainer/CheckBox3.button_pressed = g.dmg_immune
	lvslider.max_value = 10
	$HBoxContainer/CheckBox2.button_pressed = g.show_hint
	$HBoxContainer/CheckBox.button_pressed = g.show_hint
func _on_nolimit_pressed():
	g.mode = g.modes.LIMITLESS
	get_tree().change_scene_to_file("res://Levels/game.tscn")
	
func _on_heart_pressed():
	if !hearts_edit.text.is_valid_int() or hearts_edit.text == "0":
		return
	g.mode = g.modes.HEARTS
	g.hearts = int(hearts_edit.text)
	get_tree().change_scene_to_file("res://Levels/game.tscn")


func _on_h_slider_2_value_changed(value):
	lvinfo.text = "Level selected: "+str(value)
	g.level_idx = value




func _on_check_box_2_toggled(button_pressed):
	AudioServer.set_bus_mute(0,!button_pressed)


func _on_check_box_toggled(button_pressed):
	g.show_hint = button_pressed


func _on_check_box_3_toggled(button_pressed):
	g.dmg_immune = button_pressed

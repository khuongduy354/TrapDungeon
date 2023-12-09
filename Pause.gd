extends CanvasLayer


func _on_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_button_2_pressed():
	get_tree().paused = false
	self.visible = false

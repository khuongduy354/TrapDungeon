extends CharacterBody2D

func _on_area_2d_body_entered(body):
	g.player_hitted.emit()
	
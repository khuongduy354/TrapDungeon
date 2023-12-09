extends CharacterBody2D


func _on_hitbox_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()

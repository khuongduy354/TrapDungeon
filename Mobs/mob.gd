extends CharacterBody2D


func _on_hitbox_body_entered(body):
	g.player_hitted.emit()

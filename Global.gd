extends Node
class_name G

signal player_hitted

func wait(time): 
	await get_tree().create_timer(time).timeout	

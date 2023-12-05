extends Node2D
class_name TilemapWrapper 

var tm: TileMap
var positions = []

func _ready():
	for child in get_children(): 
		if child is TileMap: 
			tm = child 
		elif child is Marker2D: 
			positions.append(child)


func _clear_tile()

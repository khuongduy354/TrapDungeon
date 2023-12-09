extends Node2D
class_name Block
signal chaos
@onready var tm = $TileMap

# in global position
var tile_blocks = [] 
var offseted = false 
var stilled = false

func update_cells():
	tile_blocks = []
	for i in range(-5,6): 
		for j in range(-5,6): 
			if tm.get_cell_source_id(0,Vector2i(i,j)) != -1: 
				tile_blocks.append(tm.to_global(tm.map_to_local(Vector2(i,j))))
func set_pos(gpos):
	global_position = gpos
	if !offseted: 
		global_position += ($TileMap.global_position - global_position)
		offseted = true
	update_cells()
	
func _rotate(agle): 
	rotate(agle)	
	rotation_degrees = fmod(rotation_degrees,360.0)
	update_cells()


func _on_to_chaos_timeout():
	chaos.emit() 

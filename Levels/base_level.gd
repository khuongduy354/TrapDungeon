extends Node2D
class_name BaseLevel
var p: Player = null 

signal out_scene

@onready var p_start = $player_start
@onready var tm = $TileMap

func _initialize_(_p: Player): 
	p = _p
	p.global_position = p_start.global_position
	
func to_map(gpos): 
	return tm.local_to_map(tm.to_local(gpos))
func clear_tile(gpos): 
	var lpos = to_map(gpos)
	tm.set_cell(0,lpos,-1)
	
func fill_tile(gpos): 
	var lpos = to_map(gpos)
	tm.set_cell(0,lpos,0,Vector2i(3,2))	

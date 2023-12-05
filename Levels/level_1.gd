extends BaseLevel 
@onready var mobs = $Mobs

@export var mob_move_speed = 0.25
var dir = 1
var f3_moved = false 
var f4_moved = false 

func _physics_process(delta): 
	mobs_move(delta)
	
func mobs_move(delta): 
	for path in mobs.get_children(): 
		path = path.get_child(0) 
		path.progress_ratio += dir * mob_move_speed * delta 
		if path.progress_ratio == 1: 
			dir = -dir
 
	
	
func connect_floor3(): 
	for pos in $Floor3.get_children(): 
		clear_tile(pos.global_position)

func move_hole_right_floor4(): 
	if f4_moved: 
		return 
	f4_moved = true 
	
	var fake = $Floor4.get_child(0)
	var fpos = fake.global_position 
	var real = $Floor4.get_child(1)
	var rpos = real.global_position
	var cell_size = tm.cell_quadrant_size 
	
	while to_map(fpos) != to_map(rpos): 
		fill_tile(fpos)
		fpos.x += cell_size 
		clear_tile(fpos)
		await g.wait(.1)
	
	


func _on_floor_3_body_entered(body):
	connect_floor3()


func _on_floor_4_body_entered(body):
	move_hole_right_floor4()


func _on_floor_5_body_entered(body):
	$triggers/floor5/CollisionShape2D.set_deferred("disabled",true)
	for pos in $Floor5.get_children(): 
		if pos.get_index() == 0 or pos.get_index() == 1: 
			fill_tile(pos.global_position) 	
		else: 
			clear_tile(pos.global_position)
			
		

	


func _on_floor_5_2_body_entered(body):
	var fake = $Floor4.get_child(0)
	var fpos = fake.global_position 
	clear_tile(fpos)
	


func _on_floor_5_3_body_entered(body):
	for pos in $Floor5.get_children(): 
		if pos.get_index() == 0 or pos.get_index() == 1: 
			clear_tile(pos.global_position) 	


func _on_out_scene_body_entered(body):
	out_scene.emit()

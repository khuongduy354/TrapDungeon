extends Node2D
class_name Board 

signal sweep_line 

@onready var tm = $TileMap
@export var drop_time = 0.6
var cell_size = 16 
var current_block: Block = null
var stilled_blocks = []
var cols = 10 
var rows = 19
var rushed = false: 
	set(val): 
		rushed = val 
		$Label.visible = rushed

func clear_tile(gpos): 
	var pos = tm.local_to_map(tm.to_local(gpos))
	tm.set_cell(0,pos,-1)
	
func fill_tile(gpos): 
	var pos = tm.local_to_map(tm.to_local(gpos))
	tm.set_cell(0,pos,0,Vector2(3,2))
	
func start(): 
	sweep_line.emit() 
	spawn() 
	$drop.start()

func spawn(): 
	var prev = current_block
	rushed = false 
	$drop.wait_time = drop_time
	current_block = select_block() 
	add_child(current_block)
	current_block.chaos.connect(_on_chaos)
	current_block.set_pos($spawn.global_position)  
	
	if prev: 
		prev.queue_free()

func _on_chaos(): 
	$drop.wait_time = 0.15
	rushed = true 
	pass 
func _physics_process(delta): 
	if rushed: 
		return 
	if Input.is_action_just_pressed("jump"): 
		rotate_block()
	if Input.is_action_just_pressed("ui_right"):
		move(Vector2.RIGHT)
	if Input.is_action_just_pressed("ui_left"):
		move(Vector2.LEFT)

func select_block()->Block: 
	var scene = ""
	var i = randi()%7
	match i: 
		0: 
			scene = "res://Levels/Level9/Tetris/Blocks/CBlock.tscn"
		1: 
			scene = "res://Levels/Level9/Tetris/Blocks/IBlock.tscn"
		2: 
			scene = "res://Levels/Level9/Tetris/Blocks/JBlock.tscn"
		3: 
			scene = "res://Levels/Level9/Tetris/Blocks/LBlock.tscn"
		4: 
			scene = "res://Levels/Level9/Tetris/Blocks/SBlock.tscn"
		5: 
			scene = "res://Levels/Level9/Tetris/Blocks/TBlock.tscn"
		6: 
			scene = "res://Levels/Level9/Tetris/Blocks/ZBlock.tscn"
	var block = load(scene).instantiate()
	return block

# player jump = rotate 
# player out of below block = move 
# block has prob to blow up and drop 
func is_pos_blocked(offset): 
	for pos in current_block.tile_blocks: 
		var tpos = tm.local_to_map(tm.to_local(pos + offset))
		if tm.get_cell_source_id(0,tpos) != -1: 
			return true
	return false

func move(dir): 
	if !is_pos_blocked(dir*cell_size):
		var newpos = current_block.global_position + dir * cell_size 
		current_block.set_pos(newpos)
		return true
	return false
func rotate_block(is_cw = true): 
	var agle = PI/2 if is_cw else -PI/2
	current_block._rotate(agle)	
	if is_pos_blocked(Vector2.ZERO): 
		current_block._rotate(-agle)	
		
		


func _on_drop_timeout():
	if !move(Vector2.DOWN):
		to_still() 
func remove_curr_block(): 
	current_block.queue_free()
func to_still(): 
	for tile in current_block.tile_blocks: 
		var pos = tm.local_to_map(tm.to_local(tile))
		tm.set_cell(0,pos,0,Vector2i(3,2))
	sweep()
	spawn()
	if check_gameover(): 
		reset_board()
		
func reset_board(): 
	for x in range(1,cols+1): 
		for y in range(1,rows+1): 
			tm.set_cell(0,Vector2i(x,y),-1)
func check_gameover(): 
	for y in range(1,3): 
		for x in range(1,cols+1): 
			if tm.get_cell_source_id(0,Vector2i(x,y)) != -1: 
				return true
	return false
	
	
	
func sweep():
	for i in range(1,rows+1): 
		if is_row_cleared(i): 
			sweep_line.emit()
			clear_row(i)
			drop_row(i)
			
func clear_row(r): 
	for i in range(1,cols+1): 
		tm.set_cell(0,Vector2i(i,r),-1)

func drop_row(base_y): 
	# drop all rows above r
	for y in range(base_y-1,0,-1): 
		for x in range(1,cols+1): 
			# cut curr_cell, paste below row
			var curr_cell = tm.get_cell_source_id(0,Vector2i(x,y))
			var fill_cell = Vector2i(3,2) if curr_cell != -1 else Vector2i(-1,-1)
			tm.set_cell(0,Vector2i(x,y+1),0,fill_cell)
			tm.set_cell(0,Vector2i(x,y),-1)
			

func is_row_cleared(x): 
	for i in range(1,cols+1): 
		if tm.get_cell_source_id(0,Vector2i(i,x)) == -1: 
			return false 
	return true 





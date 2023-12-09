extends BaseLevel
@onready var board = $Board as Board

var is_shooting = false 
func _physics_process(delta):
	if Input.is_action_just_pressed("break_block") and !board.rushed: 
		is_shooting = true
		board.spawn() 
	if is_shooting: 
		if $shooter_timer.is_stopped():
			$shooter_timer.start()
		$BlockShooter.shoot(p.global_position)

func _initialize_(_p: Player): 
	super._initialize_(_p)
	_p.stuck.connect(func(): g.player_hitted.emit())
	_p.jump_force = 300
	_p.cam.zoom = Vector2.ONE
	board.sweep_line.connect(_on_line_sweep)
	board.start()
	
	
var sweep_count = 0 
func _on_line_sweep(): 
	for pos in $Positions.get_children(): 
		board.fill_tile(pos.global_position)
		pos.global_position.y += tm.cell_quadrant_size
		board.clear_tile(pos.global_position)
		
	for pos in $Positions2.get_children(): 
		pos.global_position.y += tm.cell_quadrant_size
		board.clear_tile(pos.global_position)
	sweep_count += 1
	if sweep_count == 6: 
		$trigger/c1.monitorable = true
		$trigger/c1.monitoring = true
		$Label.visible =true
		
		
func _on_shooter_timer_timeout():
	is_shooting = false


func _on_c_1_body_entered(body):
	if body is Player: 
		out_scene.emit()


func _on_death_zone_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()
		


func _on_timer_timeout():
	$Label3.visible = false

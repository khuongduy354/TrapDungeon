extends BaseLevel
@onready var slider = $flip/RigidBody2D
var flipped = false 

func _initialize_(_p: Player): 
	super._initialize_(_p)
	_p.stuck.connect(func(): g.player_hitted.emit())
	_p.jump_force = 400
func _ready():
	$flip/Label.visible = g.show_hint
	$Label2.visible = g.show_hint
func check_player():
	var face_v = Vector2.LEFT 
	var player_v = slider.global_position.direction_to(p.global_position)
	if face_v.dot(player_v) < 0 and !flipped: 
		flipped = true 
		$AnimationPlayer.play("flip")
		$Mob.shoot(p)
		
func _physics_process(delta):
	if !flipped:
		check_player()

func _on_c_1_body_entered(body):
	$AnimationPlayer.play("move_slider")
	
	while to_map($Positions.get_child(0).global_position) != to_map($Positions2.get_child(0).global_position): 
		for pos in $Positions.get_children(): 
			fill_tile(pos.global_position)
			pos.global_position.x += tm.cell_quadrant_size 
			clear_tile(pos.global_position)
		await get_tree().create_timer(.1).timeout


func _on_area_2d_area_entered(area):
	if area.owner is MissileBullet: 
		area.owner.queue_free()
#		$flip.queue_free()
		for pos in $Positions3.get_children(): 
			clear_tile(pos.global_position)


func _on_c_2_body_entered(body):
	out_scene.emit()

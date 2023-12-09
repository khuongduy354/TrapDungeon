extends BaseLevel

# player reach c1, then arrow block below plat 1 
# player jump plat c2, arrow shoot, up, 
# player drop down c3, arrow shoot horizon, plat disappear

# phase 2: 
# c4 arrow block p1 
# c5 jump remove plat, arrow shoot p2, 
# c6 player at bottom arrow, drop

@onready var arrow1 = $Path2D/PathFollow2D
@onready var arrow2 = $Path2D2/PathFollow2D
var points = [0.16,0.38]
var points2 = [0.34,0.86,1]
# Called when the node enters the scene tree for the first time.
func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.jump_force = 350
	p.cam.zoom =Vector2(1.5,1.5)
func arrow_move(val,dur,idx = 1,cb =func(): pass): 
	var tween = create_tween()
	var node = arrow1 if idx == 1 else arrow2
	tween.tween_property(node,"progress_ratio",val,dur)
	tween.tween_callback(cb)
	

func _on_c_1_body_entered(body):
	arrow_move(points[0],0.8)
	$triggers/c1/CollisionShape2D.set_deferred("disabled",true)

func _on_c_2_body_entered(body):
	arrow_move(points[1],.5)
	$triggers/c2/CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.


func _on_c_3_body_entered(body):
	arrow_move(1,.2,1,func(): arrow1.queue_free())
	$triggers/c3/CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.

func off_collision(node):
	node.set_deferred("disabled",true)	
func _on_c_4_body_entered(body):
	for pos in $Positions.get_children(): 
		fill_tile(pos.global_position)
	arrow_move(points2[0],1.2,2)
	off_collision($triggers/c4/CollisionShape2D)
	
	pass # Replace with function body.


func _on_c_5_body_entered(body):
	for pos in $Positions.get_children(): 
		clear_tile(pos.global_position)
	off_collision($triggers/c5/CollisionShape2D)
	await get_tree().create_timer(1).timeout
	arrow_move(points2[1],.5,2)
	


func _on_c_6_body_entered(body):
	arrow_move(points2[2],.15,2)
	off_collision($triggers/c6/CollisionShape2D)
	pass # Replace with function body.


func _on_c_7_body_entered(body):
	fill_tile($triggers/c7/CollisionShape2D.global_position)
	fill_tile($triggers/c8/CollisionShape2D.global_position)
	fill_tile($triggers/c8/CollisionShape2D2.global_position)
	
	


func _on_c_9_body_entered(body):
	if body is Player: 
		out_scene.emit()


func _on_c_10_body_entered(body):
	for pos in $Positions2.get_children():
		clear_tile(pos.global_position)
	await get_tree().create_timer(1).timeout
	for pos in $Positions3.get_children():
		clear_tile(pos.global_position)
	
	
		


func _on_c_11_body_entered(body):
	g.player_hitted.emit()

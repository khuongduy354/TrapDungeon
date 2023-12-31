extends BaseLevel

func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.cam.zoom = Vector2(1.5,1.5)
	p.jump_force = 350

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = g.show_hint

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player: 
		out_scene.emit()

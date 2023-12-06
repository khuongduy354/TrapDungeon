extends BaseLevel

func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.cam.zoom = Vector2(1.3,1.3)
	p.jump_force = 350

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

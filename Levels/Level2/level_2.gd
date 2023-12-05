extends BaseLevel

# 2 limiters done 
# 2 mobs done 
# shooting done 
# platforms done 
# jump nerfs
func _initialize_(_p: Player): 
	super._initialize_(_p)
	p.cam.zoom = Vector2(1.3,1.3)
	for mobs in $Mobs.get_children(): 
		mobs._initialize_(p)
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

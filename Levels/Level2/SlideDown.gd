extends RigidBody2D
class_name SlideDown

signal mob_killed

@export var dir = 1
@export var speed = 4
@export var knife_speed = 30
@export var knife_delay = 0.5

var shoot_idx = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $Sprite2D.get_children(): 
		var area = child.get_child(0)
		area.body_entered.connect(func(body): if body is Player: g.player_hitted.emit())

func shoot_left_to_right(): 
	for knife in $Sprite2D.get_children(): 
		var idx = knife.get_index() 
		shoot_idx.append(idx)
		var area = knife.get_child(0)
		area.area_entered.connect(func(area): if area.is_in_group("enemy"): mob_killed.emit(area.owner))
		await get_tree().create_timer(knife_delay).timeout

func _physics_process(delta): 
	for knife in $Sprite2D.get_children(): 
		var idx = knife.get_index()
		if idx in shoot_idx: 
			knife.position += knife_speed * delta * Vector2.DOWN * dir 
	var velocity = speed * dir * Vector2.DOWN * delta
	move_and_collide(velocity)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Player: 
		g.player_hitted.emit()


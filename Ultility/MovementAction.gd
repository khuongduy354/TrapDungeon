extends Action
class_name MovementAction

var dir: Vector2
var is_gravity
func _init(_dir: Vector2, _is_gravity = true):
	dir = _dir
	is_gravity = _is_gravity

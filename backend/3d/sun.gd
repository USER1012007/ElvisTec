extends CSGSphere3D

var sphere: CSGSphere3D
var rotating := false
var last_mouse_pos := Vector2.ZERO

func _ready() -> void:
	var planet_name = get_parent().get_parent().get_meta("name")


	if not planet_name:
		push_warning("No 'planet' metadata found on %s" % name)
		sphere = self
	else:
		sphere = self

# function made with IA
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		rotating = event.pressed
		last_mouse_pos = event.position

	elif event is InputEventMouseMotion and rotating:
		var delta = event.relative
		rotation.y -= deg_to_rad(delta.x * 0.5)
		rotation.x -= deg_to_rad(delta.y * 0.5)

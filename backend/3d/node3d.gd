extends Node3D
func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_M:
			if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

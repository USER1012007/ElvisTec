extends CSGSphere3D
var speed = 4
var angular_speed = PI
@export var animation: bool = true

func _process(delta):
	if animation:
		rotation.y -= angular_speed * delta * 1/speed

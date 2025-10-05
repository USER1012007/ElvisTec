extends CSGSphere3D
var speed = 4
var angular_speed = PI

func _process(delta):
	rotation.y += angular_speed * delta * 1/speed

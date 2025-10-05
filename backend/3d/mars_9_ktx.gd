extends CSGSphere3D
var speed = 4
var angular_speed = 2
var angle: float = 0.0
var orbit_radius: float = position.x
var orbit_speed: float = 0.0

func _ready():
	orbit_speed = self.get_meta("orbit_speed")

	
func _process(delta):
	rotation.y += angular_speed * delta * 1/speed
	angle += orbit_speed / 100 * delta

	# compute new x, z
	var new_x = orbit_radius * cos(angle)
	var new_z = orbit_radius * sin(angle)

	# set the global position (y is fixed)
	position = Vector3(new_x, 0, new_z)

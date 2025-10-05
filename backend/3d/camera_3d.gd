extends Camera3D

@export var mouse_sensitivity: float = 0.002
@export var min_pitch: float = deg_to_rad(-70.0)
@export var max_pitch: float = deg_to_rad(70.0)

var yaw: float = self.rotation.x
var pitch: float = self.rotation.y

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		var rel = event.relative * mouse_sensitivity
		
		yaw -= rel.x
		
		pitch -= rel.y
		pitch = clamp(pitch, min_pitch, max_pitch)

		transform.basis = Basis()
		rotate_y(yaw)
		rotate_object_local(Vector3.RIGHT, pitch)
		
	if Input.is_action_pressed("ui_left"):
		self.rotation.y += 0.005
	if Input.is_action_pressed("ui_right"):
		self.rotation.y -= 0.005
	if Input.is_action_pressed("ui_up"):
		self.rotation.x += 0.005
	if Input.is_action_pressed("ui_down"):
		self.rotation.x -= 0.005
	if Input.is_action_pressed("camera_left"):
		self.position.z -= 0.5
	if Input.is_action_pressed("camera_right"):
		self.position.z += 0.5
	if Input.is_action_pressed("camera_up"):
		self.position.y += 0.5
	if Input.is_action_pressed("camera_down"):
		self.position.y -= 0.5
	if Input.is_action_just_released("planetas_acercar_zoom"):
		if self.fov > 10:
			self.fov -= 1
		else:
			self.fov -= 0.5
	if Input.is_action_just_released("planetas_alejar_zoom"):
		if self.fov > 10:
			self.fov += 1
		else:
			self.fov += 0.5

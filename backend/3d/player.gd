extends CharacterBody3D

const SPEED: int = 50
@export var mouse_sensitivity: float = 0.2
@onready var cam: Camera3D = $Node3D/Camera3D
@onready var cam_pivot: Node3D = $Node3D

var pitch: float = 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.relative.x * mouse_sensitivity))

		pitch += event.relative.y * mouse_sensitivity
		pitch = clamp(pitch, -90, 90)
		cam_pivot.rotation.z = deg_to_rad(pitch)

	if Input.is_action_just_released("planetas_acercar_zoom"):
		if cam.fov > 10:
			cam.fov -= 1
		else:
			cam.fov -= 0.5

	if Input.is_action_just_released("planetas_alejar_zoom"):
		if cam.fov < 90:
			cam.fov += 1
		else:
			cam.fov += 0.5

	if Input.is_action_just_pressed("atajo_descripcion"):
		mostrar_descripcion_planeta()

func mostrar_descripcion_planeta():
	print("Mostrando descripción del planeta...")

func _physics_process(_delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("camera_up", "camera_down", "camera_right", "camera_left")
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if Input.is_action_pressed("go_up"):
		position.y -= 1
	if Input.is_action_pressed("go_down"):
		position.y += 1
	move_and_slide()

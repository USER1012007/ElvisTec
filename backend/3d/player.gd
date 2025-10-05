extends CharacterBody3D

const SPEED: int = 50
@export var mouse_sensitivity: float = 0.2
@onready var cam: Camera3D = $Node3D/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Movimiento de cámara con el mouse
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.relative.x * mouse_sensitivity))
	
	# Zoom con acciones
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

	# Atajo con la tecla E para mostrar descripción del planeta
	if Input.is_action_just_pressed("atajo_descripcion"):
		mostrar_descripcion_planeta()

func mostrar_descripcion_planeta():
	# Aquí defines lo que sucede al presionar E
	print("Mostrando descripción del planeta...")  # Puedes reemplazarlo con tu HUD o animación

func _physics_process(_delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("camera_up", "camera_down", "camera_right", "camera_left")
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

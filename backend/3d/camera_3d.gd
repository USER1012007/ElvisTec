extends Camera3D

func _process(_delta):
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
		

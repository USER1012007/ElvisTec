extends Button
var index = preload("res://frontend/index.tscn")

func _ready():
	# Conectamos la señal 'pressed' para que detecte el clic
	self.pressed.connect(_on_pressed)

func _on_pressed():
	get_tree().change_scene_to_packed(index)

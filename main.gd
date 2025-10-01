extends Node

@onready var camera: Camera3D = $Camera3D
@onready var label: Label = $Label
@onready var state_manager: Node = $"/root/state_manager"
@onready var tile_manager: Node = $"/root/tile_manager"

func _ready():
	print_debug("Main: [Main] Escena iniciada")

	state_manager.set_tile_manager(tile_manager)
	tile_manager.set_state_manager(state_manager)
	
	state_manager.zoom_changed.connect(_on_zoom_changed)
	tile_manager.tiles_changed.connect(_on_tiles_changed)

	state_manager.set_zoom(1)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			state_manager.set_zoom(state_manager.zoom_level + 1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			state_manager.set_zoom(state_manager.zoom_level - 1)

func _on_zoom_changed(new_zoom: int) -> void:
	print_debug("[Main] Zoom cambiado a:", new_zoom)
	label.text = "Zoom: %d" % new_zoom

func _on_tiles_changed(tiles: Array) -> void:
	print_debug("[Main] Tiles visibles:", tiles)

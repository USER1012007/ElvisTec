extends Node

signal zoom_changed(new_zoom: int)

var zoom_level: int = 0 

func _ready():
	print_debug("state_manager.gd: [StateManager] inicializado")

func set_zoom(value: int) -> void:
	value = clamp(value, 0, tile_manager.metadata.get("max_zoom", 40))
	if zoom_level != value:
		zoom_level = value
		emit_signal("zoom_changed", zoom_level)
		tile_manager.request_tiles_refresh()

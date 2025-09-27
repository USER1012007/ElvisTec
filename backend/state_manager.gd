extends Node

signal zoom_changed(new_zoom: int)
signal dataset_changed(new_dataset: String)
signal tiles_changed(tiles: Array)

var zoom_level: int = 0 
var dataset: String = "default" 
var visible_tiles: Array = []

var metadata := {
	"max_zoom": 4,
	"tile_size": 256,
	"image_width": 8192,
	"image_height": 8192
}

func _ready():
	print("state_manager.gd: [StateManager] inicializado")

func set_zoom(value: int) -> void:
	value = clamp(value, 0, metadata.get("max_zoom", 4))
	if zoom_level != value:
		zoom_level = value
		emit_signal("zoom_changed", zoom_level)
		request_tiles_refresh()

func set_dataset(value: String) -> void:
	if dataset != value:
		dataset = value
		emit_signal("dataset_changed", dataset)
		request_tiles_refresh()

func request_tiles_refresh() -> void:
	visible_tiles = [
		"%d/0_0.png" % zoom_level,
		"%d/1_0.png" % zoom_level,
		"%d/0_1.png" % zoom_level,
		"%d/1_1.png" % zoom_level
	]
	emit_signal("tiles_changed", visible_tiles)

func load_metadata(path: String) -> void:
	if not FileAccess.file_exists(path):
		push_warning("[StateManager] No se encontró metadata en %s" % path)
		return
	var file = FileAccess.open(path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	if typeof(data) == TYPE_DICTIONARY:
		metadata = data
		print("[StateManager] Metadata cargada:", metadata)
	else:
		push_error("[StateManager] Error leyendo metadata")

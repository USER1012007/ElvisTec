extends Node

signal tiles_changed(tiles: Array)

var dataset: String = "default" 
var visible_tiles: Array = []
var state_manager: Node = null

var metadata := {
	"max_zoom": 40,
	"tile_size": 256,
	"image_width": 8192,
	"image_height": 8192
}

func _ready():
	print_debug("tile_manager.gd: [TileManager] inicializado")
	
func request_tiles_refresh() -> void:
	visible_tiles = [
		"%d/0_0.png" % state_manager.zoom_level, 
		"%d/1_0.png" % state_manager.zoom_level, 
		"%d/0_1.png" % state_manager.zoom_level, 
		"%d/1_1.png" % state_manager.zoom_level
	]
	emit_signal("tiles_changed", visible_tiles)

func set_state_manager(manager: Node) -> void:
	state_manager = manager
	
func load_metadata(path: String) -> void:
	if not FileAccess.file_exists(path):
		push_warning("[TileManager] No se encontró metadata en %s" % path)
		return
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	var data: Dictionary = JSON.parse_string(file.get_as_text())
	if typeof(data) == TYPE_DICTIONARY:
		metadata = data
		print_debug("[TileManager] Metadata cargada:", metadata)
	else:
		push_error("[TileManager] Error leyendo metadata")

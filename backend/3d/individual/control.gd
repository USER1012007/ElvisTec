extends Control

@export var metadata_key: String = "name"  # which metadata to read from target node
@export var target_node_path = "res://backend/3d/individual/"   # path to the planet or info source
@onready var label: Label = $Label

@export var file_folder: String = "res://backend/3d/individual/info/"

func _on_button_pressed() -> void:
	var target_name = get_parent().get_meta(metadata_key)
	if target_name == null:
		push_error("No metadata '%s' found on parent" % metadata_key)
		return

	var file_path = "%s%s.txt" % [file_folder, target_name]
	if not FileAccess.file_exists(file_path):
		push_error("File not found: %s" % file_path)
		return

	var file = FileAccess.open(file_path, FileAccess.READ)
	label.text = file.get_as_text()
	file.close()

	label.visible = !label.visible

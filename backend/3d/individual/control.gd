extends Control

@export var metadata_key: String = "name" 
@export var target_node_path = "res://backend/3d/individual/" 
@onready var label: Label = $Label
@export var file_folder: String = "res://backend/3d/individual/info/"

func _ready() -> void:
	var target_name = get_parent().get_parent().get_meta(metadata_key)
	print("target_name: " + target_name)
	if target_name == null:
		push_error("No metadata '%s' encontrada" % metadata_key)
		return

	var file_path = "%s%s.txt" % [file_folder, target_name]
	if not FileAccess.file_exists(file_path):
		push_error("arhivo inexistente: %s" % file_path)
		return

	var file = FileAccess.open(file_path, FileAccess.READ)
	label.text = file.get_as_text()
	file.close()
	
func _on_button_pressed() -> void:
	label.visible = !label.visible

func _input(event) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_E:
			label.visible = !label.visible

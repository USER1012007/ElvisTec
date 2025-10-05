extends Button
func _ready() -> void:
	var normal = StyleBoxFlat.new()
	normal.bg_color = Color(0,0,0,0)
	normal.corner_radius_top_left = 8
	normal.corner_radius_top_right = 8
	normal.corner_radius_bottom_left = 8
	normal.corner_radius_bottom_right = 8

	add_theme_stylebox_override("normal", normal)

	var hover = normal.duplicate()
	hover.bg_color = Color("#390879")  
	add_theme_stylebox_override("hover", hover)

func on_sun_pressed() -> void:
	print(self.get_meta("scene"))
	var scene_path = "res://backend/3d/individual/" + self.get_meta("scene")
	get_tree().change_scene_to_file(scene_path)


func _on_pressed() -> void:
	print(self.get_meta("scene"))
	var scene_path = "res://backend/3d/" + self.get_meta("scene")
	get_tree().change_scene_to_file(scene_path)

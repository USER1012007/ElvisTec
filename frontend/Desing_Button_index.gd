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
	hover.bg_color = Color("EAE0C8CC")  
	add_theme_stylebox_override("hover", hover)

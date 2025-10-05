extends Node3D

@onready var sun_ktx: CSGSphere3D = get_node(get_meta("planet"))
func _ready():
	# Example: store the name of the node in metadata
	set_meta("planet", "sun_ktx")

	# Now you can access it dynamically:
	sun_ktx = get_node(get_meta("planet"))

	sun_ktx.material_override = StandardMaterial3D.new()
	sun_ktx.material_override.albedo_color = Color(1, 1, 0)

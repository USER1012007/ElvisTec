extends CheckButton
@onready var parent: Node = $'../../../../../Node3D'

func _toggled(toggled_on: bool) -> void:
	for child in parent.get_children():
		if child is CSGSphere3D:
			child.animation = toggled_on

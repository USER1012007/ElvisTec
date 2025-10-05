extends CheckButton
@onready var parent: Node = $'../../../../../Node3D'

func _toggled(toggled_on: bool) -> void:
	for child in parent.get_children():
		if child is CSGPolygon3D:
			child.visible = toggled_on

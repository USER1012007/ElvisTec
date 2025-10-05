extends Control

@onready var box_container2=$VBoxContainer2
@onready var box_container3=$VBoxContainer3
@onready var box_container1 = $VBoxContainer


func _on_start_pressed() -> void:
	box_container1.visible = false
	box_container2.visible=true
	pass 

func _on_return_pressed() -> void:
	box_container2.visible = false
	box_container1.visible = true
	pass # Replace with function body.


func _on_planets_pressed() -> void:
	box_container2.visible = false
	box_container3.visible = true
	pass # Replace with function body.


func _on_return_2_pressed() -> void:
	box_container3.visible = false
	box_container2.visible = true
	pass # Replace with function body.

extends Control

@onready var pop1_popup = $Popup
@onready var pop2_popup = $Popup2

func _on_button_pressed() -> void:
	pop1_popup.popup_centered()
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

func _on_planetas_pressed() -> void:
	pop2_popup.popup_centered()
	pass # Replace with function body.


func _on_volver_2_pressed() -> void:
	pop1_popup.popup_centered()
	pass # Replace with function body.

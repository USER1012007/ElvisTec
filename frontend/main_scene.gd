extends Control

@onready var pop1_popup = $Popup

func _on_button_pressed() -> void:
	pop1_popup.popup_centered()
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

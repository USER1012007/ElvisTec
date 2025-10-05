extends Control

@export var speed: float = 70.0
@export var horizontal: bool = true
@export var vertical: bool = false
@export var start_direction: Vector2 = Vector2(-1, 0)

@onready var bg: TextureRect = $TextureRect

var dir := Vector2.ZERO
@onready var box_container2=$VBoxContainer2
@onready var box_container3=$VBoxContainer3
@onready var box_container1 = $VBoxContainer
func _ready():
	box_container2.visible=false
	box_container3.visible=false
	if bg.texture:
		bg.size = bg.texture.get_size()   

	
	bg.anchor_left = 0
	bg.anchor_top = 0
	bg.anchor_right = 0
	bg.anchor_bottom = 0

	dir = start_direction.normalized()


	if bg.size.x <= size.x:
		horizontal = false
	if bg.size.y <= size.y:
		vertical = false

func _process(delta):
	var move = Vector2.ZERO
	if horizontal:
		move.x = dir.x * speed * delta
	if vertical:
		move.y = dir.y * speed * delta

	if move == Vector2.ZERO:
		return

	bg.position += move
	_check_and_bounce()

func _check_and_bounce():
	var area = size                
	var tex_size = bg.size          

	var min_x = min(area.x - tex_size.x, 0)
	var max_x = 0
	var min_y = min(area.y - tex_size.y, 0)
	var max_y = 0

	if horizontal:
		if bg.position.x < min_x:
			bg.position.x = min_x
			dir.x = -dir.x
		elif bg.position.x > max_x:
			bg.position.x = max_x
			dir.x = -dir.x

	if vertical:
		if bg.position.y < min_y:
			bg.position.y = min_y
			dir.y = -dir.y
		elif bg.position.y > max_y:
			bg.position.y = max_y
			dir.y = -dir.y


func _on_close_app_pressed() -> void:
	get_tree().quit()
	pass 


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

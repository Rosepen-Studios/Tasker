extends TextureRect

signal finished(change,color)
@onready var color_picker: ColorPicker = $MarginContainer/VBoxContainer/ColorPicker


func _ready() -> void:
	visible = false

func pick(oldcolor):
	color_picker.color = oldcolor
	visible = true

func done_pressed() -> void:
	finished.emit(true,color_picker.color.to_html())
	visible = false

func cancel_pressed() -> void:
	finished.emit(false,color_picker.color.to_html())
	visible = false

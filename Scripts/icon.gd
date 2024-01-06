extends Button

@export var iconID :int
# Called when the node enters the scene tree for the first time.
func _toggled(button_pressed):
	print("lel")
	gvh.icon = iconID
	
	

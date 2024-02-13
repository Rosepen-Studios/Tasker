extends Button

@export var iconID :int
# Called when the node enters the scene tree for the first time.
func _toggled(button_pressed):
	gvh.icon = str(iconID)
	gvh.iconsel = false
	
	

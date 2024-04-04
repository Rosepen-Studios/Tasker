extends Button

@export var iconID :int

func _toggled(button_pressed):
	$"../../../../Icon2".play(str(iconID))
	gvh.iconsel = false
	
	

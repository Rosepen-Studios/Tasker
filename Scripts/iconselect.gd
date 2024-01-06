extends Button

var btoggled:bool = false
func _ready():
	pass 


func _toggled(button_pressed):
	if btoggled == false:
		$ScrollContainer.vistible = true
		btoggled = false
	else:
		$ScrollContainer.vistible = false
		btoggled = true

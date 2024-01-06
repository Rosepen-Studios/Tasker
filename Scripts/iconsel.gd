extends CheckButton
var btoggled = 1

func _toggled(button_pressed):
	_toggle()
	
func _iconset():
		btoggled = 0
		_toggle()
		
func _toggle():
	if btoggled == 1:
		$ScrollContainer.visible = true
		btoggled = 0
	else:
		$ScrollContainer.visible = false
		btoggled = 1

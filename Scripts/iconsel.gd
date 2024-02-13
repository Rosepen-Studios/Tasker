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
		gvh.iconsel = true
	else:
		$ScrollContainer.visible = false
		btoggled = 1
func _process(delta):
	if gvh.iconsel == false:
		$ScrollContainer.visible = false
		btoggled = 1

extends LineEdit
var textctrl:String
var acttext:String
func _save():
	text = ""
	
func _process(delta):
		textctrl = get_text()
		if textctrl != null:
			acttext = textctrl
		print(acttext)
	
func _nosave():
	text = ""


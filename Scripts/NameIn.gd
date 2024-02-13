extends LineEdit
var textctrl:String
var acttext:String

func _process(delta):
	textctrl = get_text()
	if textctrl != str(null):
		acttext = textctrl
	gvh.acttext = acttext
	

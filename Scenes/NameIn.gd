extends LineEdit
var textctrl:String
var acttext:String

func _save():
	textctrl = get_text()
	if textctrl == str_to_var("null") or  get_text() == str_to_var("null") :
		textctrl = get_text()
		if textctrl != null:
			print("text2"+textctrl)
			gvh.savename = textctrl
	else:
		print(str_to_var(textctrl))
		print(str_to_var(get_text()))
		gvh.savename = textctrl

func _nosave():
	text = ""


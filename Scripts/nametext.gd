extends TextEdit

func _save():
	@warning_ignore("unused_variable")
	var check2 = get_text()
	var plswork = get_text()
	print("name" + check2)
	print("name" + plswork)
	
	text = ""
func _nosave():
	text = ""


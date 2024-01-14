extends RichTextLabel
<<<<<<< HEAD
var icon1:String = "res://Images/Icons/Pencil.png"
var icon2:String = "res://Images/Icons/Notebook.png"
var icon3:String = "res://Images/Icons/Face.png"
func _save():
	if gvh.tsknum == tskxmpl.ID:
		print("pog")
		if gvh.saveicon == 1:
			$"../Icon".texture = icon1
		elif gvh.saveicon == 2:
			$"../Icon".texture = icon2
		elif gvh.saveicon == 3:
			$"../Icon".texture = icon3
=======

func _save():
	if gvh.tsknum == tskxmpl.ID:
		pass
		
>>>>>>> 2936fd2b16cece62f5215c16ac8297de5e70e1c0

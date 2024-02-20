extends Label

func _process(delta):
	if gvh.tskscomp == 0:
		visible = true
	else:
		visible = false

extends Label

func _process(delta):
	if gvh.tsknum == gvh.tskscomp and gvh.tsknum != 0:
		visible = true
	else:
		visible = false
	
	

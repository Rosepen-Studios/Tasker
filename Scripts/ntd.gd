extends Label

func _process(delta):
	if gvh.taskCP[1] == 0 and gvh.taskCP[2] == 0 and gvh.taskCP[3] == 0 and gvh.taskCP[4] == 0 and gvh.taskCP[5] == 0 and gvh.taskCP[6] == 0 and gvh.taskCP[7] == 0 and gvh.taskCP[8] == 0 and gvh.taskCP[9] == 0 and gvh.taskCP[10] == 0:
		visible = true
	else:
		visible = false

extends Label

func _process(delta):
	if gvh.taskCP[1] == 1 and gvh.taskCP[2] == 1 and gvh.taskCP[3] == 1 and gvh.taskCP[4] == 1 and gvh.taskCP[5] == 1 and gvh.taskCP[6] == 1 and gvh.taskCP[7] == 1 and gvh.taskCP[8] == 1 and gvh.taskCP[9] == 1 and gvh.taskCP[10] == 1:
		visible = true
	else:
		visible = false
	
	

extends Label

func _process(delta):
	if gvh.taskDB["1"] == 0 and gvh.taskDB["2"] == 0 and gvh.taskDB["3"] == 0 and gvh.taskDB["4"] == 0 and gvh.taskDB["5"] == 0 and gvh.taskDB["6"] == 0 and gvh.taskDB["7"] == 0 and gvh.taskDB["8"] == 0 and gvh.taskDB["9"] == 0 and gvh.taskDB["10"] == 0:
		visible = true
	else:
		visible = false
	
		

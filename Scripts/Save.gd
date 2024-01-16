extends Button

func _pressed():
	if gvh.tsknum <= 10:
		nmtxt._save()
		Name._save()
		gvh.saveicon = gvh.icon
		
		

		gvh.icon = "1"
		gvh.tsknum += 1
		
	else:
		nmtxt._nosave()
		gvh.icon = "1"
		print("Error no more tasks available")
	$"../..".visible = false

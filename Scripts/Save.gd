extends Button

func _pressed():
	if gvh.tsknum <= 10 and $"../name/LineEdit".text != "":
		gvh.savename = gvh.acttext
		$"../../Timer".start()
		$"../name/LineEdit".text = ""
		gvh.saveicon = gvh.icon
		gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
		gvh.icon = "1"
		gvh.tsknum += 1
		$"../..".visible = false
	
	elif $"../name/LineEdit".text == "":
		gvh.icon = "1"
		print("ERROR: Task needs to have a name. (Exit Code 2)")
	else:
		$"../name/LineEdit".text = ""
		gvh.icon = "1"
		print("ERROR: No more tasks available. (Exit Code 1)")
	$"../..".visible = false

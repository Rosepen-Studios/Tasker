extends Button

func _pressed():
	if gvh.tsknum <= 10 and $"../name/LineEdit".text != "":
		if gvh.taskDB["1"] == 0:
			print("Attempting 1")
			gvh.targettask = 1
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["2"] == 0:
			gvh.targettask = 2
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["3"] == 0:
			gvh.targettask = 3
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["4"] == 0:
			gvh.targettask = 4
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["5"] == 0:
			gvh.targettask = 5
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["6"] == 0:
			gvh.targettask = 6
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["7"] == 0:
			gvh.targettask = 7
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["8"] == 0:
			gvh.targettask = 8
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["9"] == 0:
			gvh.targettask = 9
			gvh.saving = true
			gvh.savename = gvh.acttext
			$"../../Timer".start()
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
		elif gvh.taskDB["10"] == 0:
			gvh.targettask = 10
			gvh.saving = true
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

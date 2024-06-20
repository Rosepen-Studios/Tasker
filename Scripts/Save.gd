extends Button
func _process(delta):
	if Input.is_action_just_pressed("Enter"):
		_pressed()
func _pressed():
	if gvh.tsknum <= 10 and $"../name/LineEdit".text != "":
		if gvh.taskDB["1"] == 0:
			print("Attempting 1")
			gvh.targettask = 1
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
			
		elif gvh.taskDB["2"] == 0:
			gvh.targettask = 2
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["3"] == 0:
			gvh.targettask = 3
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["4"] == 0:
			gvh.targettask = 4
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["5"] == 0:
			gvh.targettask = 5
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["6"] == 0:
			gvh.targettask = 6
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["7"] == 0:
			gvh.targettask = 7
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
		elif gvh.taskDB["8"] == 0:
			gvh.targettask = 8
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			
		elif gvh.taskDB["9"] == 0:
			gvh.targettask = 9
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			
			gvh.nowsaving = false
		elif gvh.taskDB["10"] == 0:
			gvh.targettask = 10
			gvh.nowsaving = true
			gvh.savename = gvh.acttext
			$"../name/LineEdit".text = ""
			gvh.saveicon = gvh.icon
			gvh.saveiconcolor = $"../Icon/Label/OptionButton".selected
			gvh.icon = "1"
			gvh.tsknum += 1
			$"../..".visible = false
			
	elif $"../name/LineEdit".text == "":
		gvh.icon = "1"
	else:
		$"../name/LineEdit".text = ""
		gvh.icon = "1"


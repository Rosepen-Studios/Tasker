extends Button

func _pressed():
	if gvh.tsknum <= 10:
		gvh.savename = $"../name/Nametext".text
		gvh.saveicon = gvh.icon
		print(gvh.savename)
		print(gvh.saveicon)
		$"../name/Nametext".text = ""

		gvh.icon = 1
		tskxmpl._savedata()
		gvh.tsknum += 1
	else:
		$"../name/Nametext".text = ""
		gvh.icon = 1
		print("Error no more tasks available")
	$"../..".visible = false

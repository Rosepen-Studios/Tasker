extends LineEdit

@onready var output = $Output


func _process(delta):
	if gvh.devmode == true and Input.is_action_just_pressed("Dev"):
		visible = true
		gvh.conopen = true
		grab_focus()
	if Input.is_action_just_pressed("close"):
		visible = false
		gvh.conopen = false
	if  Input.is_action_just_pressed("Enter"):
		_send()
func _send():
	output.newline()
	output.add_text(str(output.get_line_count()-1) + " "  + ">"+ text)
	_find_command()
	
func _find_command():
	var sep = text.split(":")
	if text == "del:all":
		text = ""
		_exe_command("del","all",null,null)
	elif  text == "info":
		text = ""
		_exe_command("info",null,null,null)
	elif  text == "easter_egg":
		text = ""
		_exe_command("easter_egg",null,null,null)
	elif  sep[0] == "del":
		text = ""
		_exe_command("del",sep[1],null,null)
	elif sep[0] == "add":
		var sufixsep = sep[1].split(",")
		_exe_command("add",sufixsep[0],sufixsep[1],sufixsep[2])
		text = ""
	elif sep[0] == "count":
		_exe_command("count",null,null,null)
		text = ""
	else:
		output.newline()
		output.append_text(str(output.get_line_count()-1) + " <" + "[color=red]Error: invalid command[/color]")
		text = ""
func _exe_command(command, sufix, sufix2, sufix3):
	if command == "del" and sufix == "all":
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Deleting all tasks")
		Input.action_press("delall")
		Input.action_release("delall")
		gvh.taskDB = {"1":0,"10":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0}
		gvh.taskCP = {1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0}
	elif command == "info":
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Tasker version: 0.2.3 stable")
	elif command == "easter_egg":
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Great job, you found an easter egg!🐣")
		print_rich("[wave][rainbow]I am an easter egg too![/rainbow][/wave]")
	elif command == "del":
		if int(sufix) <= 10 and gvh.taskDB[str(sufix)] == 0:
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error 404: Task not found")
		elif  int(sufix) <= 10:
			gvh.taskDB[sufix] = 0
			gvh.taskCP[int(sufix)] = 0
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "<Deleting task "+str(sufix))
		else:
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error 400: Bad request")
	elif command == "add":
		if gvh.tsknum <= 10 and sufix != "" and sufix2 != "" and sufix3 != "" and int(sufix2) > 0 and int(sufix2) < 11 and int(sufix3) >-1 and int(sufix3) < 6 and (gvh.taskDB["1"] == 0 or gvh.taskDB["2"] == 0 or gvh.taskDB["3"] == 0 or gvh.taskDB["4"] == 0 or gvh.taskDB["5"] == 0 or  gvh.taskDB["6"] == 0 or gvh.taskDB["7"] == 0 or gvh.taskDB["8"] == 0 or gvh.taskDB["9"] == 0 or gvh.taskDB["10"] == 0):
			if gvh.taskDB["1"] == 0:
				gvh.targettask = 1
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["2"] == 0:
				gvh.targettask = 2
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["3"] == 0:
				gvh.targettask = 3
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["4"] == 0:
				gvh.targettask = 4
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["5"] == 0:
				gvh.targettask = 5
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["6"] == 0:
				gvh.targettask = 6
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["7"] == 0:
				gvh.targettask = 7
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["8"] == 0:
				gvh.targettask = 8
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["9"] == 0:
				gvh.targettask = 9
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
			elif gvh.taskDB["10"] == 0:
				gvh.targettask = 10
				gvh.saving = true
				gvh.savename = sufix
				gvh.saveicon = sufix2
				gvh.saveiconcolor = sufix3
				gvh.icon = "1"
				gvh.tsknum += 1
				output.newline()
				output.add_text(str(output.get_line_count()-1) + " " + "Added task(Name: "+sufix+" Icon: "+ sufix2+ " Color: "+ sufix3+ ")")
		elif sufix == "":
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error 400: Bad request")
			gvh.icon = "1"
		elif sufix2 == "" or int(sufix2) > 0 or int(sufix2) < 11:
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error 400: Bad request")
			gvh.icon = "1"
		elif sufix3 == "" or int(sufix3) > -1 or int(sufix3) < 6:
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error 400: Bad request")
			gvh.icon = "1"
		else:
			gvh.icon = "1"
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "ERROR 500: No tasks available")
	elif command == "count":
		var count:int
		if gvh.taskDB["1"] == 1:
			count += 1
		if gvh.taskDB["2"] == 1:
			count += 1
		if gvh.taskDB["3"] == 1:
			count += 1
		if gvh.taskDB["4"] == 1:
			count += 1
		if gvh.taskDB["5"] == 1:
			count += 1
		if gvh.taskDB["6"] == 1:
			count += 1
		if gvh.taskDB["7"] == 1:
			count += 1
		if gvh.taskDB["8"] == 1:
			count += 1
		if gvh.taskDB["9"] == 1:
			count += 1
		if gvh.taskDB["10"] == 1:
			count += 1
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Task count: "+ str(count))
	elif command == "set_win":
		ProjectSettings.set_setting("display/window/size/viewport_height",int(sufix))
		ProjectSettings.set_setting("display/window/size/viewport_width",int(sufix2))
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Window height set to:"+sufix+" and window width set to:"+sufix2)

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
		_exe_command("del","all")
	elif  text == "info":
		text = ""
		_exe_command("info",null)
	elif  text == "easter_egg":
		text = ""
		_exe_command("easter_egg",null)
	elif  sep[0] == "del":
		text = ""
		_exe_command("del",sep[1])
func _exe_command(command, sufix):
	if command == "del" and sufix == "all":
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Deleting all tasks")
		Input.action_press("delall")
		Input.action_release("delall")
		gvh.taskDB = {"1":0,"10":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0}
		gvh.taskCP = {1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0}
	elif command == "info":
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Tasker version: 0.2 stable")
	elif command == "easter_egg":
		output.newline()
		output.add_text(str(output.get_line_count()-1) + " " + "<Great job, you found an easter egg!🐣")
	elif command == "del":
		if int(sufix) <= 10 and gvh.taskDB[str(sufix)] == 0:
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error: Task doesen't exist")
		elif  int(sufix) <= 10:
			gvh.taskDB[sufix] = 0
			gvh.taskCP[int(sufix)] = 0
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "<Deleting task "+str(sufix))
		else:
			output.newline()
			output.add_text(str(output.get_line_count()-1) + " " + "Error: Not valid sufix")

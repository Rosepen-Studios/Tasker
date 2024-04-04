extends LineEdit

@onready var output = $Output


func _process(delta):
	if gvh.devmode == true and Input.is_action_just_pressed("Dev"):
		visible = true
		grab_focus()
	if Input.is_action_just_pressed("close"):
		visible = false
	if  Input.is_action_just_pressed("Enter"):
		_send()
func _send():
	output.newline()
	output.add_text(str(output.get_line_count()) + " "  + ">"+ text)
	_find_command()
	
func _find_command():
	if text == "del:all":
		text = ""
		_exe_command("del:all")

func _exe_command(command):
	if command == "del:all":
		output.newline()
		output.add_text(str(output.get_line_count()) + " " + "<Deleting all tasks")
		Input.action_press("delall")
		Input.action_release("delall")
		gvh.taskDB = {"1":0,"10":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0}
	

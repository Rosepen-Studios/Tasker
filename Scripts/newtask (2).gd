extends Button


func _pressed():
	release_focus()
	Input.action_press("NewTask")
	Input.action_release("NewTask")

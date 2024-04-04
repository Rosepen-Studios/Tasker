extends Button
func _pressed():
	Input.action_press("close")
	Input.action_release("close")

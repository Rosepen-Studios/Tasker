extends Control
func _ready():
	visible = false

func _process(delta):
	if Input.is_action_just_released("NewTask") and gvh.conopen == false:
		visible = true
		print("yes")
		$BG/name/LineEdit.grab_focus()
	
	
	

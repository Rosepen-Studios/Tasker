extends Control
func _ready():
	visible = false

func _process(delta):
	if Input.is_action_just_released("NewTask"):
		visible = true
		print("yes")
	
	
	
	

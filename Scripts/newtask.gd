extends Control
func _ready():
	visible = false

func _process(delta):
	if Input.is_action_pressed("NewTask"):
		visible = true
	
	

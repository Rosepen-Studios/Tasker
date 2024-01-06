extends CheckBox


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _toggled(button_pressed):
	if $"../duedate/holder".visible == true:
		$"../duedate/holder".visible = false
	else:
		$"../duedate/holder".visible = true

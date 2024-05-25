extends Button

func _pressed():
	print("press")
	$"../../AnimationPlayer".play("Press Edit")

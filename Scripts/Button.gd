extends Button

@onready var newtask = $"../Newtask"

func _pressed():
	nt._newtask()

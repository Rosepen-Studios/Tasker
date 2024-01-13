extends Button
@onready var control = $"../.."

func _pressed():
		nmtxt._nosave()
		$"../..".visible = false

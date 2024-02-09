extends Button
@onready var control = $"../.."

func _pressed():
		namein._nosave()
		$"../..".visible = false

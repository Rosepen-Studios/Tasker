extends Button
@onready var control = $"../.."

func _pressed():
		$"../name/LineEdit".text = ""
		$"../..".visible = false

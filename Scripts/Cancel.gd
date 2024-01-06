extends Button
@onready var control = $"../.."

func _pressed():
		$"../name/Nametext".text = ""
		$"../..".visible = false

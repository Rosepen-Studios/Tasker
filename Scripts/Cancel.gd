extends Button
@onready var control = $"../.."

func _pressed():
		$"../name/LineEdit".text = ""
		$"../../AnimationPlayer".play("Out")
		$"../../Timer".start
		await $"../../Timer".timeout
		$"../..".visible = false

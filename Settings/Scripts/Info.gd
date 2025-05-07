extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Info: Version "+rtv.version+" Loaded tasks "+str(rtv.iddic.size())

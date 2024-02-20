extends Label

func _onready():
		$Time.position = Vector2(975, -2)
		

func _process(_delta):
	var time = Time.get_time_string_from_system()
	text = time
	

extends Label
var time = Time.get_time_string_from_system().split(":")

func _process(_delta):
	text = (str(time[0])+":"+str(time[2]))
	

extends Label
var time = Time.get_time_string_from_system().split(":")

func _ready():
	timecont()
	text = (str(time[0])+":"+str(time[1]))
	
func timecont():
	$Timer.start()
	await $Timer.timeout
	var time = Time.get_time_string_from_system().split(":")
	text = (str(time[0])+":"+str(time[1]))
	timecont()

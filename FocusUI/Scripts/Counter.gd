extends HBoxContainer

@onready var hrstext: Label = $Hours/Label
@onready var mintext: Label = $Minutes/Label
@onready var sectext: Label = $Seconds/Label

func update(hrs,min,sec):
	hrs = str(hrs)
	if hrs.split("").size() == 1:
		hrs = "0"+hrs

	min = str(min)
	if min.split("").size() == 1:
		min = "0"+min

	sec = str(sec)
	if sec.split("").size() == 1:
		sec = "0"+sec
	
	hrstext.text = hrs
	mintext.text = min
	sectext.text = sec

extends Control
@onready var contribution: TextureRect = $TextureRect/MarginContainer/HBoxContainer2/TextureRect
@onready var delete: TextureProgressBar = $TextureRect/MarginContainer/HBoxContainer2/TextureProgressBar
@onready var time: Label = $TextureRect/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var len: Label = $TextureRect/MarginContainer/HBoxContainer/VBoxContainer/Label2
var timedata
var done = false
var focuslens = 0
var focuslenm = 0
var focuslenh = 0
var sessionid
var contribnum:int
func _ready() -> void:
	if done == false:
		contribution.visible = false
		delete.visible = false
	time.text = "Session at "+timedata
	update()

func update():
	if done != true:
		focuslens += 1
		if focuslens == 60:
			focuslenm += 1
			focuslens = 0
		if focuslenm == 60:
			focuslenh += 1
			focuslenm = 0
		if focuslenh == 24:
			focuslenh = 0
			
		var trues = str(focuslens)
		var truem = str(focuslenm)
		var trueh = str(focuslenh)
		
		if trues.split("").size() == 1:
			trues = "0"+trues
		if truem.split("").size() == 1:
			truem = "0"+truem
		if trueh.split("").size() == 1:
			trueh = "0"+trueh
		
		len.text = "Focused for "+trueh+":"+truem+":"+trues
	
		await get_tree().create_timer(1).timeout
		update()

func complete() -> int:
	done = true
	contribution.visible = true
	delete.visible = true
	contribnum = focuslenm + focuslenh*60
	contribution.update(contribnum,"day")
	return contribnum

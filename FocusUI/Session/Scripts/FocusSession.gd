extends Control
@onready var contribution: TextureRect = $TextureRect/MarginContainer/HBoxContainer2/TextureRect
@onready var delete: TextureProgressBar = $TextureRect/MarginContainer/HBoxContainer2/TextureProgressBar
@onready var label: Label = $TextureRect/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var label_2: Label = $TextureRect/MarginContainer/HBoxContainer/VBoxContainer/Label2
@onready var icon: TextureRect = $TextureRect/MarginContainer/HBoxContainer/Control/TextureRect
var timedata:String = ""
var done = null
var focuslens = 0
var focuslenm = 0
var focuslenh = 0
var id
var contribnum:int
var paused:bool = false
func _ready() -> void:
	if done == false:
		contribution.visible = false
		delete.visible = false
		update()
	label.text = "Session at "+timedata
	if id != null:
		rtv.dolog("(Focus Session "+str(id)+") INFO: Created")
	else:
		rtv.dolog("(Focus Session) WARN: Unidentified session loaded!")
func update():
	if done != true:
		heartbeat([-focuslenh,-focuslenm,-focuslens])
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
		
		label_2.text = "Focused for "+trueh+":"+truem+":"+trues
		heartbeat([focuslenh,focuslenm,focuslens])
		if paused:
			await get_parent().resume
			icon.texture = load("res://Sidebar/Textures/Focus Icon.svg")
		await get_tree().create_timer(1).timeout
		update()
		if paused:
			icon.texture = load("res://FocusUI/Textures/PauseIcon.png")
		else: 
			icon.texture = load("res://Sidebar/Textures/Focus Icon.svg")

func complete():
	done = true
	contribution.visible = true
	delete.visible = true
	contribution.update(focuslenm + focuslenh*60,"day")
	contribution.update_color()
	rtv.dolog("(Focus Session "+str(id)+") INFO: Complete")

func on_delete_pressed() -> void:
	rtv.sessiondate.erase(id)
	rtv.sessionlen.erase(id)
	rtv.sessiontime.erase(id)
	get_parent().remove_session([focuslenh,focuslenm,focuslens])

	rtv.dolog("(Focus Session "+str(id)+") INFO: Deleted")
	queue_free()

func heartbeat(data:Array):
	get_parent().heartbeat(data)
	
func load_data(time,len):
	rtv.dolog("(Focus Session "+str(id)+") INFO: Created")
	focuslenh = len[0]
	focuslenm = len[1]
	focuslens = len[2]
	complete()
	
	label.set_text("Focused for "+time)
	
	var trueh = str(len[0])
	var truem = str(len[1])
	var trues = str(len[2])
	if trueh.split("").size() == 1:
		trueh = "0"+trueh
	if truem.split("").size() == 1:
		truem = "0"+truem
	if trues.split("").size() == 1:
		trues = "0"+trues
	label_2.text = "Focused for "+trueh+":"+truem+":"+trues
	heartbeat([focuslenh,focuslenm,focuslens])
	

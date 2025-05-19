extends Control

@onready var sidebar: Control = $Sidebar
@onready var focus_button: Button = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/HBoxContainer/Button
@onready var focus_button_label: Label = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/HBoxContainer/Button/Label
@onready var progress: Container = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/Ring/Container
@onready var instantiator: VBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/TextureRect2/MarginContainer/ScrollContainer/VBoxContainer


var is_in_session:bool = false
var workingid = -1
var focustime = 0
func focus_pressed() -> void:
	if is_in_session:
		end_session()
		focus_button_label.text = "Focus"
		is_in_session = false
	else:
		begin_session()
		focus_button_label.text = "Done"
		is_in_session = true

func begin_session():
	workingid = rtv.last_given_session_id+1
	instantiator.add_session(workingid)
	
func end_session():
	focustime += instantiator.end_session()
	progress.update(focustime,"day")


func tab_switched(tab: String) -> void:
	if tab == "focus":
		await get_tree().create_timer(0.1).timeout
		progress.update(focustime,"day")

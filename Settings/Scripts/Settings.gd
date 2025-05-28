extends Control

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var warning: Label = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/Control/HBoxContainer2/Warning
@onready var scroll: ScrollContainer = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer


signal settings_changed
signal reorientate
#-----Settings------#

@onready var time_setting = $"MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Show time/Label2/HBoxContainer/Time Setting"
@onready var username = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Nickname/Label2/HBoxContainer/Username
@onready var sidebar_selection: OptionButton = $"MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Sidebar selection Method/Label2/HBoxContainer/Sidebar Selection"
@onready var accent_color: LineEdit = $"MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Accent color/Label2/HBoxContainer/Color"
@onready var notify_for_updates: CheckButton = $"MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Notify For Updates/Label2/HBoxContainer/CheckButton"
@onready var focus_goal: LineEdit = $"MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Focus goal/Label2/HBoxContainer/LineEdit"

#-----End Settings-----#

#-----Containers-----#

@onready var focus_goal_con: HBoxContainer = $"MarginContainer/TextureRect/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/Focus goal"

#-----End Containers-----#

var past_settings:Dictionary
var settings:Dictionary
var applied:bool
var apply_pass:bool = false



func _ready() -> void:
	warning.set_warn("")
	animator.play("Closed")
	

func enter():
	begin_setting()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Settings") and rtv.iscreating == false and rtv.isediting == false and rtv.issetting == false:
		begin_setting()

func open_at(pos:int,high:String):
	begin_setting()
	await get_tree().create_timer(0.3).timeout
	if rtv.settings["notify_for_updates"] and rtv.latest_version != rtv.version:
		get_tree().create_tween().tween_property(scroll,"scroll_vertical",pos,0.2).set_ease(Tween.EASE_OUT)
	else:
		get_tree().create_tween().tween_property(scroll,"scroll_vertical",pos-122,0.2).set_ease(Tween.EASE_OUT)
	highlight(high)

func highlight(setting:String):
	var target
	if setting == "focus_goal":
		target = focus_goal_con
	var tween = get_tree().create_tween()
	tween.tween_property(target,"modulate",Color(rtv.settings["accent_color"]),0.3)
	tween.tween_property(target,"modulate",Color(1,1,1),0.3)
	tween.tween_property(target,"modulate",Color(rtv.settings["accent_color"]),0.3)
	tween.tween_property(target,"modulate",Color(1,1,1),0.3)
	tween.tween_property(target,"modulate",Color(rtv.settings["accent_color"]),0.3)
	tween.tween_property(target,"modulate",Color(1,1,1),0.3)

func begin_setting():
	apply_pass = false
	applied = false
	animator.play("In")
	rtv.issetting = true
	settings = rtv.settings
	time_setting.select(settings["time_setting"])
	username.text = settings["username"]
	sidebar_selection.select(settings["sidebar_selection"])
	accent_color.text = settings["accent_color"]
	notify_for_updates.button_pressed = settings["notify_for_updates"]
	focus_goal.text = str(settings["focus_goal_day"])
	
	
func apply():
	if  username.text == "" or accent_color.text == "" or accent_color.text.split().size() != 6:
		warning.set_warn("1 or more spaces have been left empty!")
	elif accent_color.text.split().size() != 6:
		warning.set_warn("Sidebar Selection Color needs to be 6 characters (HEX)")
	else: #Forwards new settings to the settings dictionary
		settings["sidebar_selection"] = sidebar_selection.selected
		settings["time_setting"] = time_setting.selected
		settings["username"] = username.text
		settings["accent_color"] = accent_color.text  
		settings["notify_for_updates"] = notify_for_updates.button_pressed
		settings["focus_goal_day"] = int(focus_goal.text)
		applied = true
		rtv.settings = settings

func on_apply_pressed() -> void:
	apply()



func on_done_pressed() -> void:
	if (applied == true and username.text != "" and accent_color.text != "") or apply_pass == true:
		animator.play("Out")
		rtv.issetting = false
		settings_changed.emit()
	else:
		warning.set_warn("Click again to exit without saving.")
		apply_pass = true

func _on_open_aud_pressed() -> void:
	OS.shell_show_in_file_manager(OS.get_user_data_dir())


func _on_restart_orientation_pressed() -> void:
	rtv.orientationcomp = false
	rtv.settings["username"] = ""
	rtv.settings["time_setting"] = 0
	apply_pass = true
	on_done_pressed()
	reorientate.emit()
	settings_changed.emit()


func open_console() -> void:
	apply_pass = true
	on_done_pressed()
	await animator.animation_finished
	get_tree().change_scene_to_file("res://Console/Console.tscn")

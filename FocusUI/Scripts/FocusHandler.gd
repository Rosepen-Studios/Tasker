extends Control

@onready var sidebar: Control = $Sidebar
@onready var focus_button: Button = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/HBoxContainer/Focus/Button2
@onready var focus_button_label: Label = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/HBoxContainer/Focus/Label
@onready var progress: Container = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/Ring/Container
@onready var instantiator: VBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/TextureRect2/MarginContainer/ScrollContainer/VBoxContainer
@onready var counter: HBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/TextureRect/HBoxContainer
@onready var saving: TextureRect = $"../../../Background"
@onready var pause_button: Control = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/HBoxContainer/Pause
@onready var pause_button_label: Label = $MarginContainer/HBoxContainer/Container1/MarginContainer/VBoxContainer/HBoxContainer/Pause/Label



var is_in_session:bool = false
var workingid = -1
var focustimehrs = 0
var focustimemin = 0
var focustimesec = 0
var heartbeatcount = 0
var paused:bool = false
var dataloaded = false
signal dataready
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
	focus_button.modulate = rtv.settings["accent_color"]
	pause_button.visible = true
	rtv.last_given_session_id+=1
	workingid = rtv.last_given_session_id
	rtv.sessionid.append(str(workingid))
	instantiator.add_session(workingid)
	
func end_session():
	focus_button.modulate = "1d1d1d"
	pause_button.visible = false
	instantiator.end_session()
	update_session_data(workingid,instantiator.get_session_len())
	workingid = -1
	heartbeatcount = 0


func tab_switched(tab: String) -> void:
	if tab == "focus":
		await get_tree().create_timer(0.1).timeout
		update_ui()
		
func update_ui():
	progress.update(focustimehrs*60+focustimemin,"day")
	counter.update(focustimehrs,focustimemin,focustimesec)

func remove_session(timeremoved:Array):
	await update_time(-timeremoved[0],-timeremoved[1],-timeremoved[2])
	update_ui()
	saving.savefocus()

func update_time(hrs,min,sec):
	var allfocustime = focustimesec+focustimemin*60+focustimehrs*3600
	var allnewtime = sec+min*60+hrs*3600
	
	allfocustime += allnewtime
	
	focustimehrs = floori(allfocustime/3600)
	focustimemin = floori((allfocustime/60) - (60*focustimehrs))
	focustimesec = allfocustime-(focustimehrs*3600+focustimemin*60)

	
func heartbeat(heartbeattime):
	await update_time(heartbeattime[0],heartbeattime[1],heartbeattime[2])
	update_ui()
	if heartbeattime[2] >= 0: #Heartbeats get called two times a sec first to remove old session len (-len) and then to add the new len
		heartbeatcount += 1
		if heartbeatcount == 10:
			update_session_data(workingid,[heartbeattime[0],heartbeattime[1],heartbeattime[2]])
			heartbeatcount = 1
	
func update_session_data(id,len:Array):
	rtv.sessiondate[id] = Time.get_date_string_from_system()
	rtv.sessiontime[id] = instantiator.get_session_time()
	rtv.sessionlen[id] = len
	saving.savefocus()


func pause_pressed() -> void:
	if paused:
		paused = false
		pause_button_label.text = "Pause"
		instantiator.workingsession.paused = false
		instantiator.resume.emit()
		rtv.dolog("(Focus Handler) INFO: Session resumed")
	else:
		paused = true
		pause_button_label.text = "Resume"
		instantiator.workingsession.paused = true
		instantiator.workingsession.icon.texture = load("res://FocusUI/Textures/PauseIcon.png")
		rtv.dolog("(Focus Handler) INFO: Session paused")


func settings_changed() -> void:
	instantiator.update_children()
	progress._ready()


func on_focusloaded() -> void:
	dataready.emit()
	if not dataloaded:
		await get_tree().create_timer(0.01).timeout
		on_focusloaded()

func _ready() -> void:
	await dataready
	instantiator.load_sessions()
	dataloaded = true
	

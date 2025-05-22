extends TextureRect
@onready var savetimer: Timer = $Timer
@onready var web: HTTPRequest = $Timer/HTTPRequest
@onready var pop_up: Control = $"../Pop Up"
@onready var update: Control = $"../Update"
@onready var tag: TextureRect = $"../Greeting/MarginContainer/HBoxContainer/TextureRect"

var console_callouts:bool = false
var latest:bool
signal focusloaded
func _ready() -> void:
	rtv.dolog("(System) INFO: Log date is " + Time.get_date_string_from_system())
	if rtv.version.split("_obd").size() == 2:
		rtv.dolog("(System) INFO: Beta version detected")
		rtv.beta = true
		tag.texture = load("res://Main/Textures/Beta_Tag.svg")
	if rtv.production:
		rtv.dolog("(System) INFO: RTV production is enabled and could be causing errors with task creation, if this is a production log ignore this message")
	if FileAccess.file_exists("user://taskdata.json"):
		loadtaskdata()
		rtv.isloading = true
	if FileAccess.file_exists("user://lastlog.json"):
		rtv.lastlogwasloaded = true
		loadlastlog()
	if FileAccess.file_exists("user://orientation.json"):
		loadorientation()
	if FileAccess.file_exists("user://focus.json"):
		loadfocus()
	else:
		rtv.lastlogwasloaded = false
		var file = FileAccess.open("user://lastlog.json", FileAccess.WRITE)
		var save:Dictionary
		save["lastlogd"] = Time.get_date_string_from_system()
		var json = JSON.stringify(save)
		file.store_string(json)
		file.close()
	if FileAccess.file_exists("user://bg.jpg"):
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.jpg"))
	savetimer.start()
	if OS.has_feature("editor"):
		rtv.dolog("(System) INFO: Debugger detected")
		tag.texture = load("res://Main/Textures/Debug_Tag.svg")
	await  is_latest()
	if latest == false:
		if rtv.settings["notify_for_updates"]:
			rtv.dolog("(System) INFO: Running on older version!")
			pop_up.make_popup("Notice","You are running an outdated version of Tasker. Click here to update.")
			await pop_up.clicked
			rtv.popup_clicked = false
			update.visible = true
	else:
		rtv.dolog("(System) INFO: Applications is up-to-date")

	
func savetaskdata(): # Saves task data
	var file = FileAccess.open("user://taskdata.json", FileAccess.WRITE)
	var save:Dictionary
	save["namedic"] = rtv.namedic
	save["iddic"] = rtv.iddic 
	save["colordic"] = rtv.colordic
	save["icondic"] = rtv.icondic
	save["donedic"] = rtv.donedic
	save["streakdic"] = rtv.streakdic
	save["lastgivenid"] = rtv.lastgivenid
	save["complastlogdic"] = rtv.comlastlogdic
	save["version"] = rtv.version
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Saved taskdata")

func loadtaskdata(): #Loads task data
	var file = FileAccess.open("user://taskdata.json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	rtv.namedic = save["namedic"]
	rtv.iddic = save["iddic"]
	rtv.colordic = save["colordic"] 
	rtv.icondic = save["icondic"] 
	rtv.donedic = save["donedic"] 
	rtv.streakdic = save["streakdic"]
	rtv.lastgivenid = save["lastgivenid"] 
	rtv.comlastlogdic = save["complastlogdic"]
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Loaded taskdata")

	
	
func savelastlog(): # Saves lastlog data
	var file = FileAccess.open("user://lastlog.json", FileAccess.WRITE)
	var save:Dictionary
	save["lastlogd"] = rtv.lastlogd
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Saved lastlog")

func saveorientation(): # Saves orientation data
	var file = FileAccess.open("user://orientation.json", FileAccess.WRITE)
	var save:Dictionary
	save["orientationcomp"] = rtv.orientationcomp
	save["settings"] = rtv.settings
	
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Saved orientation")

func savefocus(): # Saves lastlog data
	var file = FileAccess.open("user://focus.json", FileAccess.WRITE)
	var save:Dictionary
	save["sessiontime"] = rtv.sessiontime 
	save["sessionlen"] = rtv.sessionlen 
	save["sessiondate"] = rtv.sessiondate
	save["last_given_session_id"] = rtv.last_given_session_id 
	save["sessionid"] = rtv.sessionid 
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Saved focus")

func loadlastlog(): #Loads lastlog data
	var file = FileAccess.open("user://lastlog.json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	rtv.lastlogd = save["lastlogd"]
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Loaded lastlog")
	
func loadorientation(): #Loads orientation data
	var file = FileAccess.open("user://orientation.json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	rtv.orientationcomp = save["orientationcomp"]
	rtv.settings = save["settings"]
	if console_callouts:
		rtv.dolog("(Saving) INFO: Loaded orientation")

func loadfocus(): #Loads focus data
	var file = FileAccess.open("user://focus.json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	rtv.sessionid = save["sessionid"]
	rtv.sessiontime = save["sessiontime"]
	rtv.sessionlen = save["sessionlen"]
	rtv.sessiondate = save["sessiondate"]
	rtv.last_given_session_id = save["last_given_session_id"]
	file.close()
	if console_callouts:
		rtv.dolog("(Saving) INFO: Saved focus")
	focusloaded.emit()
	
func load_timeout() -> void:
	savetaskdata()
	savelastlog()
	savetimer.start()

func _on_orientationcomp() -> void:
	saveorientation()


func on_settings_changed() -> void:
	saveorientation()

func is_latest():
	if FileAccess.file_exists(OS.get_user_data_dir().split("Tasker")[0]+"Tasker Updater/latest.json"):
		rtv.updater_version = FileAccess.open(OS.get_user_data_dir().split("Tasker")[0]+"Tasker Updater/latest.json",FileAccess.READ).get_as_text().split("\"")[1]
	else:
		rtv.dolog("(System) WARN: File latest.json not found, aborting updater version check (404)")
		rtv.dolog("(System) INFO: The error above should be fixed automaticaly when you update Tasker")
	web.set_download_file("user://latest_version.txt")
	print(rtv.beta)
	if rtv.beta:
		web.request("https://github.com/Firepixel85/Tasker-Labs/releases/download/latest_pointer/latest_beta_version.txt")
	else:
		web.request("https://github.com/Firepixel85/Tasker-Labs/releases/download/latest_pointer/latest_version.txt")
	await web.request_completed
	rtv.latest_version = FileAccess.open("user://latest_version.txt",FileAccess.READ).get_as_text().split(",")[0]
	rtv.updater_latest_version = FileAccess.open("user://latest_version.txt",FileAccess.READ).get_as_text().split(",")[1]
	if rtv.beta:
		rtv.dolog("(System) INFO: Current vesrion: "+ rtv.version+ " Latest beta version: "+ rtv.latest_version)
	else:
		rtv.dolog("(System) INFO: Current vesrion: "+ rtv.version+ " Latest version: "+ rtv.latest_version)
	if rtv.latest_version == rtv.version:
		latest = true
	else:
		latest = false

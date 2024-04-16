extends Timer

var proccess = Time.get_date_string_from_system().split("-")
var lastlogd:String 
var lastlogm:String
var lastlogt:String

func _ready():
	_load()
	if lastlogd != proccess[2]:
		gvh.newday = true
	lastlogd = proccess[2]
	lastlogt = Time.get_time_string_from_system()
	_saveloop()
	

func _save(): # Saves Last Login Data
	var file = FileAccess.open("user://savetime.json", FileAccess.WRITE)
	var save = {}
	save["lastlogd"] = lastlogd
	save["lastlogt"] = lastlogt
	save["taskDB"] = gvh.taskDB
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()
	
func _load(): #Loads Last Login Data
	var file = FileAccess.open("user://savetime.json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	lastlogd = save["lastlogd"]
	lastlogt = save["lastlogt"]
	gvh.taskDB = save["taskDB"]
	if save["taskDB"] == null:
		gvh.taskDB = {"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0,"10":0}
	file.close()


func _saveloop():
	start()
	await timeout
	_save()
	_saveloop()

extends PanelContainer

@export var ID :int
var savename:String = gvh.savename
var localgvhchange:bool = false
var on = false
var done:bool = false
var doneloading = false


var locname 
var locicon
var loccolor 
func _ready():
	$Timer.start()
	await $Timer.timeout
	_load()
	$Task/Label2.text = locname
	$Task/Color.play(str(loccolor))
	$Task/Icon2.play(str(locicon))
	if gvh.taskDB[str(ID)] == 1:
		visible = true
	doneloading = true
func _process(delta):
	
	if gvh.targettask == ID and doneloading == true: #Creates the task
		print("goog")
		if on == false:
			gvh.targettask = 0
			on = true
			visible = true
			gvh.taskDB[str(ID)] = 1
			$Edit.visible = false
			_save()
		if gvh.saving == true:
			$Task/Label2.text = gvh.savename
			$Task/Color.play(str(gvh.saveiconcolor))
			$Task/Icon2.play(str(gvh.saveicon))
			gvh.saving = false
			_save()
	if done == true:
		gvh.tskscomp += 1
		gvh.comptask = true
		gvh.comptaskid = ID
		visible = false
		gvh.taskCP[ID] = 1
	if gvh.edit == true:
		_save()
	if $Edit/TextureRect/Delete.button_pressed == true and doneloading == true: #Deletes task
		print("delete")
		savename = gvh.savename
		localgvhchange = false
		gvh.taskDB[ID] = 0
		on = false
		done = false
		visible = false
		_save()

	if $Task/Done.button_pressed == true and doneloading == true:   #Completes Task
		print("done")
		if localgvhchange == false:
			done = true
			localgvhchange = true
			_save()
	if doneloading == true:
		locname = $Task/Label2.get_text()
		locicon = $Task/Icon2.animation
		loccolor = $Task/Color.animation
		
	
func _save(): # Saves task data
	
	var file = FileAccess.open("user://savetask"+str(ID)+".json", FileAccess.WRITE)
	var save = {}
	save["locname"] = locname
	save["locicon"] = locicon
	save["loccolor"] = loccolor
	save["done"] = done
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()

func _load(): #Loads Last Login Data
	var file = FileAccess.open("user://savetask"+str(ID)+".json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	locname = save["locname"]
	locicon = save["locicon"]
	loccolor = save["loccolor"]
	
	file.close()

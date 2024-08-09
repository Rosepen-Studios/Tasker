extends PanelContainer

@export var ID :int
var savename:String = gvh.savename
var localgvhchange:bool = false
var on = false
var done:bool = false
var doneloading = false

@onready var animatior = $AnimationPlayer


var locname 
var locicon
var loccolor 
func _ready():
	animatior.play("Press Edit")
	if Input.is_action_just_pressed("delall"):
		_delete()
	if gvh.taskDB[str(ID)] == 1: #Loads task from saved data
		_load()
		$Task/Label2.text = locname
		$Task/Color.play(str(loccolor))
		$Task/Icon2.play(str(locicon))
		$Task/Timer.start()
		if gvh.taskDB[str(ID)] == 1:
			visible = true
			if done == true:
				visible =false
		await $Task/Timer.timeout
		gvh.tsknum +=1
	doneloading = true
	_saveloop()
func _process(delta):
	if gvh.targettask == ID and doneloading == true: #Creates the task
		if on == false:
			gvh.targettask = 0
			on = true
			visible = true
			gvh.taskDB[str(ID)] = 1
			$Edit.visible = false
			_save()
		if gvh.nowsaving == true:
			$Task/Label2.text = gvh.savename
			$Task/Color.play(str(gvh.saveiconcolor))
			$Task/Icon2.play(str(gvh.saveicon))
			gvh.nowsaving = false
			gvh.savepassid = ID
			gvh.savepass = true
		_save()
	if done == true:
		gvh.tskscomp += 1
		gvh.comptask = true
		gvh.comptaskid = ID
		
		visible = false
		gvh.taskCP[ID] = 1
	if gvh.edit == true:
		_save()
	if ($Edit/TextureRect/Delete.button_pressed == true and doneloading == true): #Deletes task
		_delete()
		

	if $Task/Done.button_pressed == true and doneloading == true:   #Completes Task
		if localgvhchange == false:
			done = true
			localgvhchange = true
			_save()
			gvh.tskscomp +=1 
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

func _load(): #Loads task data
	var file = FileAccess.open("user://savetask"+str(ID)+".json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	locname = save["locname"]
	locicon = save["locicon"]
	loccolor = save["loccolor"]
	done = save["done"]
	file.close()
	if gvh.newday == true:
		done = false

func _saveloop():
	$Task/Timer.start()
	await $Task/Timer.timeout
	_save()
	_saveloop()
	if gvh.taskDB[str(ID)] == 0:
		visible = false

func _delete():
	savename = gvh.savename
	localgvhchange = false
	gvh.tsknum -= 1
	gvh.tskscomp -= 1
	on = false
	done = false
	visible = false
	$Task/Label2.text = ""
	$Task/Color.play("0")
	$Task/Icon2.play("1")
	gvh.taskDB[str(ID)] = 0
	print("del")
	_save()

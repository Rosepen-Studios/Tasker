extends Control

@export var ID :int
var savename:String = gvh.savename
var on:bool = false
var done:bool = false
var wasloaded = false
var isin:bool = false #stops the Done animation from repeating
func _ready():
	_load()
	
	if done == true:
		visible = true
func _process(delta):
	if gvh.taskDB[str(ID)]== 0:
		visible = false
	if gvh.taskDB[str(ID)] == 1 and on == false and wasloaded == false:
		_load()
		on = true
	if gvh.taskCP[ID] == 1:
		visible = true
		if isin == false:
			
			isin = true
	if gvh.edit == true and gvh.edittarget == ID:
		$Control/Label2.text = gvh.editname
		$Control/Color.play(str(gvh.editcolor))
		$Control/Icon2.play(str(gvh.editicon))
		
	if gvh.taskDB[str(ID)] == 0:
		on = false
	if Input.is_action_pressed("delall"):
		print("del")
		$Control/Label2.text = ""
		gvh.taskDB[str(ID)] = 0

func _load(): #Loads task data
	var wasloaded = true
	var file = FileAccess.open("user://savetask"+str(ID)+".json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	$Control/Label2.text = save["locname"]
	$Control/Icon2.play(str(save["locicon"]))
	$Control/Color.play(str(save["loccolor"]))
	done = save["done"]
	file.close()
	if gvh.newday == true:
		done = false

extends VBoxContainer

@onready var task_done_inst: VBoxContainer = $"../../../../../../Complete/MarginContainer/VBoxContainer/Control/ScrollContainer2/VBoxContainer"

func _ready(): 
	if rtv.isloading == true:
		loadfull()

func loadfull():
	rtv.dolog("(Task Instantiator) INFO: Loading in full")
	for i in rtv.namedic.size():
		var array = rtv.iddic.values()
		rtv.loadcreationstatus = 0
		rtv.justcreatedid = array[i]
		add_child(preload("res://Daily Task/Daily Task.tscn").instantiate())
		await rtv.loadcreationstatus == 1
	rtv.dolog("(Task Instantiator) INFO: Loaded full")
		


func new_task(id: int) -> void:
	rtv.dolog("(Task Instantiator) INFO: Recieved signal from Daily Handler")
	add_child(preload("res://Daily Task/Daily Task.tscn").instantiate())
	rtv.justcreatedid = id
	rtv.dolog("(Task Instantiator) INFO: Task instantiated")

func complete_task(id):
	task_done_inst.complete_task(id)
	
func decomplete_task(id):
	for i in get_child_count():
		get_children()[i].decomplete(id)

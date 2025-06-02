extends VBoxContainer
@onready var task_inst: VBoxContainer = $"../../../../../../Incomplete/MarginContainer/VBoxContainer/Control/ScrollContainer2/VBoxContainer"

func _ready():
	if rtv.isloading == true:
		loadfull()

func loadfull():
	for i in rtv.namedic.size():
		var array = rtv.iddic.values()
		rtv.loadcreationstatus = 0
		rtv.justcreatedid = array[i-1]
		add_child(preload("res://Daily Task/Daily Task Done/Daily Task Done.tscn").instantiate())
		await rtv.loadcreationstatus == 1

func new_task_done(id: int) -> void:
	add_child(preload("res://Daily Task/Daily Task Done/Daily Task Done.tscn").instantiate())
	rtv.justcreatedid = id
	
func complete_task(id):
	for i in get_child_count():
		get_children()[i].complete(id)
		
func decomplete_task(id):
	task_inst.decomplete_task(id)

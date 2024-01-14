extends PanelContainer

@export var ID :int
var savename:String = gvh.savename

func _process(delta):
	if gvh.tsknum >= ID or gvh.tsknum == ID:
		visible = true


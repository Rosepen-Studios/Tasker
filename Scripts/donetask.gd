extends Control

@export var ID :int
var savename:String = gvh.savename

func _process(delta):
	if gvh.tsknum == ID:
		$PanelContainer/Control/Label2.text = gvh.savename
		$PanelContainer/Control/Color.play(str(gvh.saveiconcolor))
		$PanelContainer/Control/Icon2.play(str(gvh.saveicon))
	if gvh.comptaskid == ID and gvh.comptask == true:
		visible = true

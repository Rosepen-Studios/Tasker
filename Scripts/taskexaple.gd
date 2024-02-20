extends PanelContainer

@export var ID :int
var savename:String = gvh.savename
var localgvhchange:bool = false
var on = false
func _process(delta):
	if gvh.tsknum == ID:
		if on == false:
			on = true
			visible = true
		$Control/Label2.text = gvh.savename
		$Control/Color.play(str(gvh.saveiconcolor))
		$Control/Icon2.play(str(gvh.saveicon))
	await $Control/Done.pressed
	if localgvhchange == false:
		gvh.tskscomp = (gvh.tskscomp + 1)
		localgvhchange = true
		gvh.comptask = true
		gvh.comptaskid = ID
		visible = false

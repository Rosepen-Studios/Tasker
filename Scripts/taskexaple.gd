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
		if gvh.saving == true:
			$Task/Label2.text = gvh.savename
			$Task/Color.play(str(gvh.saveiconcolor))
			$Task/Icon2.play(str(gvh.saveicon))
			gvh.saving = false
	await $Task/Done.pressed
	if localgvhchange == false:
		gvh.tskscomp = (gvh.tskscomp + 1)
		localgvhchange = true
		gvh.comptask = true
		gvh.comptaskid = ID
		visible = false
		

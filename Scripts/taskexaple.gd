extends PanelContainer

@export var ID :int
var savename:String = gvh.savename
var localgvhchange:bool = false
var on = false
var done:bool = false

func _process(delta):
	$Task/Label.text = str(ID)
	if gvh.targettask == ID:
		print("goog")
		if on == false:
			gvh.targettask = 0
			on = true
			visible = true
			gvh.taskDB[ID] = 1
			$Edit.visible = false
		if gvh.saving == true:
			$Task/Label2.text = gvh.savename
			$Task/Color.play(str(gvh.saveiconcolor))
			$Task/Icon2.play(str(gvh.saveicon))
			gvh.saving = false
			
	if $Edit/TextureRect/Delete.button_pressed == true:
		print("delete")
		savename = gvh.savename
		localgvhchange = false
		gvh.taskDB[ID] = 0
		on = false
		done = false
		visible = false
			

	if $Task/Done.button_pressed == true:
		print("done")
		if localgvhchange == false:
			done = true
			gvh.tskscomp = (gvh.tskscomp + 1)
			localgvhchange = true
			gvh.comptask = true
			gvh.comptaskid = ID
			visible = false

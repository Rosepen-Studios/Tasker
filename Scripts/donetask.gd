extends Control

@export var ID :int
var savename:String = gvh.savename
var on:bool = false
func _process(delta):
	if gvh.taskDB[str(ID)] == 1 and on == false:
		$Control/Label2.text = gvh.savename
		$Control/Color.play(str(gvh.saveiconcolor))
		$Control/Icon2.play(str(gvh.saveicon))
		on = true
	if gvh.taskCP[ID] == 1:
		visible = true
	if gvh.edit == true and gvh.edittarget == ID:
		$Control/Label2.text = gvh.editname
		$Control/Color.play(str(gvh.editcolor))
		$Control/Icon2.play(str(gvh.editicon))
	if gvh.taskDB[str(ID)] == 0:
		on = false

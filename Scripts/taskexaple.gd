extends PanelContainer

@export var ID :int
var savename:String = gvh.savename

func _process(delta):
	if gvh.tsknum == ID:
		visible = true
		$Control/Label2.text = gvh.savename
		$Control/Color.play(str(gvh.saveiconcolor))
		$Control/Icon2.play(str(gvh.saveicon))

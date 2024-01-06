extends PanelContainer

@export var ID :int

func _process(delta):
	if gvh.tsknum >= ID or gvh.tsknum == ID:
		visible = true
func _savedata():
	print("1")
	if gvh.tsknum == ID:
		print("name: " + gvh.savename)
		$Control/RichTextLabel.text = str(gvh.saveicon)

extends TextureRect

@onready var progress: TextureProgressBar = $MarginContainer/TextureProgressBar
@onready var text: Label = $MarginContainer/TextureProgressBar/Label

func update(min,type):
	if rtv.settings["focus_goal_"+str(type)] == 0:
		return 0
		
	var val = round(100*min/rtv.settings["focus_goal_"+type])
	create_tween().tween_property(progress,"value",val,0.6).set_trans(Tween.TRANS_SINE)
	text.text = str(val)+"%"
	return 200

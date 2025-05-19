extends Container

@onready var text: Label = $Label
@onready var progress: TextureProgressBar = $TextureProgressBar
func _ready() -> void:
	progress.modulate = Color(rtv.settings["accent_color"])
func update(min:int,type:String):
	if rtv.settings["focus_goal_"+str(type)] == 0:
		return 0
	
	var val = round(100*min/rtv.settings["focus_goal_"+type])
	create_tween().tween_property(progress,"value",val,0.6).set_trans(Tween.TRANS_SINE)
	text.text = str(val)+"%"
	return 200

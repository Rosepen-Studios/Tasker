extends Container

@onready var handler: Control = $"../../../../../../.."
@onready var text: Label = $Label
@onready var progress: TextureProgressBar = $TextureProgressBar
var comp:bool = true
func _ready() -> void:
	progress.modulate = Color(rtv.settings["accent_color"])
	await get_tree().create_timer(0.1).timeout
	comp = false
func update(min:int,type:String,silent:bool):
	if rtv.settings["focus_goal_"+str(type)] == 0:
		return 0
	
	var val = floor(100*min/rtv.settings["focus_goal_"+type])
	create_tween().tween_property(progress,"value",val*24,0.6).set_trans(Tween.TRANS_SINE)
	text.text = str(int(val))+"%"
	if min == rtv.settings["focus_goal_"+type] and !comp:
		if !silent:
			rtv.dolog("(Focus Progress) INFO: Goal reached")
			handler.do_confetti()
		comp = true
	return 200
	
func get_progress():
	return progress.value
	

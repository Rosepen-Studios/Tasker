extends HBoxContainer

@onready var selection: ScrollContainer = $TextureRect/ScrollContainer
var selected: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selection.scroll_horizontal = 91



func _on_day_pressed() -> void:
	create_tween().tween_property(selection,"scroll_horizontal",91,0.2).set_trans(Tween.TRANS_SINE)
	selected = 1

func _on_week_pressed() -> void:
	create_tween().tween_property(selection,"scroll_horizontal",5,0.2).set_trans(Tween.TRANS_SINE)
	selected = 2

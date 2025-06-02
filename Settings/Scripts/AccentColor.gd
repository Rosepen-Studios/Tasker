extends Button

@onready var color_picker: TextureRect = $"../../../../../../../../../../../TextureRect"

var color:String
func _pressed() -> void:
	color_picker.pick(modulate)


func picker_finished(change: Variant, newcolor: Variant) -> void:
	if change:
		color = newcolor
		modulate = Color(newcolor)

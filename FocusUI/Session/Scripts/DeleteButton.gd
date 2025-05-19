extends Button


@onready var bar: TextureProgressBar = $".."



func _on_mouse_entered() -> void:
	create_tween().tween_property(bar,"value",100,0.1).set_ease(Tween.EASE_IN)


func _on_mouse_exited() -> void:
	create_tween().tween_property(bar,"value",0,0.1).set_ease(Tween.EASE_IN)

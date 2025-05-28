extends Button

func _on_mouse_entered() -> void:
	modulate = Color(0.85,0.85,0.85)

func _on_mouse_exited() -> void:
	modulate = Color(1,1,1)


func _on_pressed() -> void:
	modulate = Color(0.75,0.75,0.75)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(1,1,1)

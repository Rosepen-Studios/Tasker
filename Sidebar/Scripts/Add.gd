extends Button
@onready var animator: AnimationPlayer = $AnimationPlayer

func _pressed():
	if rtv.iscreating == false:
		Input.action_press("Add")
		Input.action_release("Add")
		button_pressed = false
	else:
		animator.play("No")
	modulate = Color(0.75,0.75,0.75)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(1,1,1)




func _on_mouse_entered() -> void:
	modulate = Color(0.85,0.85,0.85)

func _on_mouse_exited() -> void:
	modulate = Color(1,1,1)

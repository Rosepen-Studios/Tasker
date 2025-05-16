extends Control
@onready var con: CodeEdit = $MarginContainer/VBoxContainer/CodeEdit

func _ready() -> void:
	for i in rtv.logs:
		con.insert_line_at(int(con.get_line_count())-1,i)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main/main.tscn")


func _on_clear_pressed() -> void:
	rtv.logs = []
	con.text = ""

extends Button

@export var tabid:String
@onready var sidebar: Control = $"../../../../.."



func _ready() -> void:
	modulate = Color(0.576,0.576,0.576)
	if sidebar.tab == tabid:
		modulate = Color(1,1,1)
	mouse_entered.connect(hover)
	mouse_exited.connect(dehover)

func hover():
	if sidebar.tab == tabid:
		modulate = Color(0.9,0.9,0.9)
	else:
		modulate = Color(0.7,0.7,0.7)

func dehover():
	if sidebar.tab == tabid:
		modulate = Color(1,1,1)
	else:
		modulate = Color(0.576,0.576,0.576)

func _pressed() -> void:
	if sidebar.tab == tabid:
		modulate = Color(0.8,0.8,0.8)
		await get_tree().create_timer(0.1).timeout
		modulate = Color(1,1,1)
	else:
		modulate = Color(0.5,0.5,0.5)
		await get_tree().create_timer(0.1).timeout
		modulate = Color(1,1,1)
		
func _process(delta: float) -> void:
	if sidebar.tab != tabid and not is_hovered():
		modulate = Color(0.576,0.576,0.576)

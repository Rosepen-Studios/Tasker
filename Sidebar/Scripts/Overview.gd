extends Button

@export var tabid:String
@onready var sidebar: Control = $"../../../../.."



func _ready() -> void:
	sidebar._settings_changes.connect(settings_changed)
	modulate = Color(1,1,1)
	if rtv.settings["sidebar_selection"] != 1 and sidebar.tab != tabid:
		modulate = Color(0.576,0.576,0.576)

	mouse_entered.connect(hover)

func hover():
	if sidebar.tab == tabid or rtv.settings["sidebar_selection"] == 1:
		modulate = Color(0.9,0.9,0.9)
	else:
		modulate = Color(0.7,0.7,0.7)

func _pressed() -> void:
	if sidebar.tab == tabid or rtv.settings["sidebar_selection"]:
		modulate = Color(0.8,0.8,0.8)
	elif rtv.settings["sidebar_selection"] != 1:
		modulate = Color(0.5,0.5,0.5)
	await get_tree().create_timer(0.1).timeout
	modulate = Color(1,1,1)
		
func _process(delta: float) -> void:
	if rtv.settings["sidebar_selection"] != 1:
		if sidebar.tab != tabid and not is_hovered():
			modulate = Color(0.576,0.576,0.576)
		if Input.is_action_just_pressed(tabid):
			pressed.emit()
			_pressed()
		
func settings_changed():
	_ready()

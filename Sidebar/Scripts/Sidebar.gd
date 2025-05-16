extends Control


@onready var tab_handler: ScrollContainer = $"../TabHandler"
@onready var selection: TextureRect = $TextureRect/Control/Upper/Selection/TextureRect
@onready var overview: TextureRect = $TextureRect/Control/Upper/VBoxContainer/Overview/TextureRect
@onready var daily: TextureRect = $TextureRect/Control/Upper/VBoxContainer/Daily/TextureRect
@onready var settings: Control = $"../Settings"

var tab:String = "daily"
var selectionpositions:Dictionary = {"daily":10,"overview":62,"placeholder1":115,"placeholder2":168}
signal changed_page(tab:String)
func _ready() -> void:
	selection.positionselection(selectionpositions["daily"])
	daily.modulate = Color(1, 1, 1)
	overview.modulate = Color(0.576, 0.576, 0.576)

func _process(delta: float) -> void:
	if rtv.settings["sidebar_selection"] == 1:
		daily.modulate = Color(1, 1, 1)
		overview.modulate = Color(1, 1, 1)
	else:
		if tab == "overview":
			overview.modulate = Color(1, 1, 1)
			daily.modulate = Color(0.576, 0.576, 0.576)
		else:
			daily.modulate = Color(1, 1, 1)
			overview.modulate = Color(0.576, 0.576, 0.576)

		
func _on_overview_pressed() -> void:
	if tab != "overview" and (rtv.settings["sidebar_selection"] == 0 or 2):
		overview.modulate = Color(1, 1, 1)
		daily.modulate = Color(0.576, 0.576, 0.576)
		switch_tab("overview")
	elif tab != "overview":
		switch_tab("overview")

func _on_daily_pressed() -> void:
	if tab != "daily" and (rtv.settings["sidebar_selection"] == 0 or 2):
		daily.modulate = Color(1, 1, 1)
		overview.modulate = Color(0.576, 0.576, 0.576)
		switch_tab("daily")
	elif tab != "daily":
		switch_tab("daily")


func _on_settings_pressed() -> void:
	if rtv.iscreating == false and rtv.isediting == false and rtv.issetting == false:
		settings.enter()

func switch_tab(tabid:String):
	tab = tabid
	selection.positionselection(selectionpositions[tabid])
	tab_handler.switch_to(tabid)
	changed_page.emit(tabid)

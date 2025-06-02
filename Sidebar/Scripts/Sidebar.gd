extends Control


@onready var tab_handler: ScrollContainer = $"../TabHandler"
@onready var selection: TextureRect = $TextureRect/Control/Upper/Selection/TextureRect
@onready var settings: Control = $"../Settings"
var tab:String = "daily"
var selectionpositions:Dictionary = {"daily":10,"overview":62,"focus":115,"placeholder2":168}
signal changed_tab(tab:String)
signal _settings_changes
func _ready() -> void:
	selection.positionselection(selectionpositions["daily"])

func _on_overview_pressed() -> void:
	switch_tab("overview")

func _on_daily_pressed() -> void:
	switch_tab("daily")

func _on_focus_pressed() -> void:
	switch_tab("focus")

func _on_settings_pressed() -> void:
	if rtv.iscreating == false and rtv.isediting == false and rtv.issetting == false:
		settings.enter()

func switch_tab(tabid:String):
	tab = tabid
	selection.positionselection(selectionpositions[tabid])
	tab_handler.switch_to(tabid)
	changed_tab.emit(tabid)

func settings_changed() -> void:
	_settings_changes.emit()

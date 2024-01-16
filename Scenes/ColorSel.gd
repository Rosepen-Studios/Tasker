extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	add_icon_item(load("res://Images/Icons/White.png"),"White",1)
	add_icon_item(load("res://Images/Icons/Blue.png"),"Blue",2)
	add_icon_item(load("res://Images/Icons/Red.png"),"Red",3)
	add_icon_item(load("res://Images/Icons/Green.png"),"Green",4)
	add_icon_item(load("res://Images/Icons/Orange.png"),"Orange",5)
	add_icon_item(load("res://Images/Icons/Purpel.png"),"Purple",6)
	
func _process(delta):
	gvh.color = str(selected)
	print(selected)

extends OptionButton

func _ready():
	add_icon_item(load("res://Images/Icons/Colors/White.png"),"White",1)
	add_icon_item(load("res://Images/Icons/Colors/Blue.png"),"Blue",2)
	add_icon_item(load("res://Images/Icons/Colors/Red.png"),"Red",3)
	add_icon_item(load("res://Images/Icons/Colors/Green.png"),"Green",4)
	add_icon_item(load("res://Images/Icons/Colors/Orange.png"),"Orange",5)
	add_icon_item(load("res://Images/Icons/Colors/Purple.png"),"Purple",6)
	
	
func _process(delta):
	gvh.color = str(selected)
	

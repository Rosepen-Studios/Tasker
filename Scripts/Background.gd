extends TextureRect

func _ready():
	
	if FileAccess.file_exists("user://config.json") == false:
		_write_config()
	else:
		_load()
	if FileAccess.file_exists("user://bg.png") == true:
		print("override:background")
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.png"))
	elif FileAccess.file_exists("user://bg.jpg") == true:
		print("override:background")
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.jpg"))
	elif FileAccess.file_exists("user://bg.jpeg") == true:
		print("override:background")
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.jpeg"))
		
func _write_config(): 
	var file = FileAccess.open("user://config.json", FileAccess.WRITE)
	var save = {}
	save["devmode"] = false
	var json = JSON.stringify(save)
	file.store_string(json)
	file.close()

func _load(): 
	var file = FileAccess.open("user://config.json", FileAccess.READ)
	var json = file.get_as_text()
	var save = JSON.parse_string(json)
	gvh.devmode = save["devmode"]
	file.close()
	

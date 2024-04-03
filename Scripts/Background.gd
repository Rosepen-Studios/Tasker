extends TextureRect



func _ready():
	if FileAccess.file_exists("user://bg.png") == true:
		print("bg_override")
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.png"))
	elif FileAccess.file_exists("user://bg.jpg") == true:
		print("bg_override")
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.jpg"))
	elif FileAccess.file_exists("user://bg.jpeg") == true:
		print("bg_override")
		texture = ImageTexture.create_from_image(Image.load_from_file("user://bg.jpeg"))

extends Control

func _process(delta):
	
	await $"../Task/Edit".pressed
	visible = true
	position = Vector2(32,32)
	$TextureRect/Name.text = $"../Task/Label2".text
	$TextureRect/Color.play($"../Task/Color".animation)
	$TextureRect/Icon2.play($"../Task/Icon2".animation)
	
	
	await $TextureRect/Close.pressed
	$"../Task/Label2".text = str($TextureRect/Name.text)
	$"../Task/Color".play($TextureRect/Color.animation)
	$"../Task/Icon2".play($TextureRect/Icon2.animation)
	gvh.edit = true
	gvh.edittarget = $"..".ID
	gvh.editname = $"../Task/Label2".text
	gvh.editicon = str($TextureRect/Icon2.animation)
	gvh.editcolor = str($TextureRect/Color.animation)
	visible = false

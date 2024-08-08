extends Node2D

@onready var animatior = $AnimationPlayer
@onready var timer = $Timer
@onready var header = $Small/Error
@onready var reason = $Small/Reason
@onready var container = $Small

var on:bool = false #Defines if the error is in the scene
var title
var message 

func _process(delta):
	if gvh.printerror == true:
		gvh.printerror = false
		title = gvh.errortitle
		message = gvh.errormessage
		if on == false:
			print("error2")
			if title == message == null:
				print_rich("[color=red]Error System: Error, no explanation provided.[/color]")
			if title != null:
				print_rich("[color=red]Error System: Error,"+ str(message) + "[/color]")
				header.text = title
			if message != null:
				reason.text = message
			else:
				reason.text = "No Explanation Provided"
				print_rich("[color=red]Error System:" +str(title) + "," + "no explanation provided.[/color]")
			_start()
		else:
			print("error print failed")

	
func _start():
	visible = true
	container.position = Vector2(576,-48.5)
	container.modulate = Color(1,1,1,1)
	on = true
	animatior.play("Enter")
	timer.start()
	await timer.timeout
	close()

func close():
	timer.stop()
	animatior.play("Exit")
	on = false
	await animatior.animation_changed
	visible = false


	

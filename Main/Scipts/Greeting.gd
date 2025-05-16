extends VBoxContainer

@onready var greeting: Label = $MarginContainer/HBoxContainer/Label
var username:String

var toastid
var toast
var greets
func _ready() -> void:
	
	username  = rtv.settings["username"]
	greets = [
	"Welcome back "+username,
	"Good to have you "+username,
	"Nice to see you "+username,
	"Ready for a productive day "+username+"?",
	"Have a nice day "+username
	]
	if rtv.beta == true:
		greets.append("Testing out the beta are we?")
	if OS.has_feature("editor"):
		greets.append("Doing a bit debugging "+username+"?")
	
	toastid = RandomNumberGenerator.new().randi_range(0,greets.size()-1)
	if RandomNumberGenerator.new().randi_range(1,1000) == 420:
		toast = "All systems online Captain"
		rtv.dolog("(???) INFO: There is an easter egg greeting you!")
	else:
		toast = greets[toastid]
	greeting.text = toast

func _process(delta: float) -> void:
	if rtv.settings["username"] == "":
		visible = false
	else:
		visible = true
		greeting.text = toast

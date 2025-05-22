extends VBoxContainer
@onready var handler: Control = $"../../../../../../.."

var workingid
var workingsession = null
var loading:bool = false
signal resume
func add_session(id):
	workingid = id
	add_child(preload("res://FocusUI/Session/FocusSession.tscn").instantiate())
	
	
func end_session():
	workingsession.complete()

func on_session_added(session: Node) -> void:
	workingsession = session
	if !loading:
		var time = Time.get_time_string_from_system()
		time = time.split(":")[0]+":"+time.split(":")[1]
		session.timedata = time
		session.id = workingid
		session.done = false


func remove_session(timeremoved:Array):
	handler.remove_session(timeremoved)
	
func heartbeat(heartbeattime:Array):
	handler.heartbeat(heartbeattime)

func get_session_time():
	return workingsession.timedata
	
func get_session_len():
	return [workingsession.focuslenh,workingsession.focuslenm,workingsession.focuslens]

func update_children():
	for i in get_child_count():
		get_child(i).contribution.update_color()
		
func load_sessions(removed_id:Array):
	loading = true
	for i in rtv.sessionid.size():
		add_child(preload("res://FocusUI/Session/FocusSession.tscn").instantiate())
		await workingsession != null
		workingsession.done = true
		workingsession.id = rtv.sessionid[i]
		workingsession.load_data(rtv.sessiontime[rtv.sessionid[i]],rtv.sessionlen[rtv.sessionid[i]])
		workingsession = null
	loading = false
	

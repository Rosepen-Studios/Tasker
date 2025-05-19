extends VBoxContainer

var workingid
var workingsession
func add_session(id):
	add_child(preload("res://FocusUI/Session/FocusSession.tscn").instantiate())
	workingid = id
	
func end_session() -> int:
	return workingsession.complete()

func on_session_added(session: Node) -> void:
	var time = Time.get_time_string_from_system()
	time = time.split(":")[0]+":"+time.split(":")[1]
	session.timedata = time
	session.sessionid = workingid
	workingsession = session

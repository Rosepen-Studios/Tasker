extends ScrollContainer


var positions = {"daily":0,"overview":652,"focus":1304}

	
func switch_to(tabid:String):
	get_tree().create_tween().tween_property(self,"scroll_vertical",positions[tabid],0.3).set_trans(Tween.TRANS_QUAD)

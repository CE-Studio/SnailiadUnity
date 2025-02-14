extends Node


func _process(delta):
	if Input.is_action_just_pressed("Debug") and not Statics.is_menu_open:
		Statics.noclip_mode = not Statics.noclip_mode

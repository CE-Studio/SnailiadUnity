extends Node


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Debug") and not Statics.is_menu_open:
		Statics.noclip_mode = not Statics.noclip_mode

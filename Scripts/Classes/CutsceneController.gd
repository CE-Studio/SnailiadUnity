extends Node
class_name CutsceneController


static var instance:CutsceneController


func _ready() -> void:
	instance = self
	print($Control.size)


func _process(delta: float) -> void:
	pass

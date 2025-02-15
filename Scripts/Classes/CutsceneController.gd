extends Node
class_name CutsceneController


static var instance:CutsceneController


enum Status {
	OK,
	
}


func _ready() -> void:
	instance = self
	print($Control.size)


func _process(delta: float) -> void:
	pass


func get_error() -> Status:
	return Status.OK


func load_event(path:String) -> bool:
	return false

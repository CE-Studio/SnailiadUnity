extends Node
class_name CutsceneController


static var instance:CutsceneController


static var events := {}
static var persistent_data := {}
static var _stat:Status


enum Status {
	OK,
	BUSY,
	FILE_ERROR,
	UNKOWN_ERROR,
}


#region Context
static var active := false


static var program := []
static var stack:Array[int] = []


func _process(delta: float) -> void:
	pass
#endregion


func _ready() -> void:
	instance = self
	print(name)
	print("!!!!!! READY")
	load_event("res://CusceneScripts/test.txt", &"test:test")


static func get_error() -> Status:
	return _stat


static func run_event(ID:StringName) -> Status:
	return Status.BUSY


static func load_event(path:String, ID:StringName) -> bool:
	if FileAccess.file_exists(path):
		var f = FileAccess.open(path, FileAccess.READ)
		var raw := f.get_as_text().replace("\r", "").split("\n", false) as Array
		f.close()
		for i in raw.size():
			var iter = raw[i]
			var piter = " " + iter
			var ppiter = " " + piter
			var indenting := true
			var indent = 0
			var instring := false
			var depth := 0
			for l in len(iter):
				var letter = iter[l]
				var pletter = piter[l]
				var ppletter = ppiter[l]
				if indenting and (letter in [" ", "\t"]):
					indent += 1
				else:
					indenting = false
					match letter:
						"(" when !instring:
							depth += 1
						")" when !instring:
							depth -= 1
						"\"" when instring:
							if not (pletter == "\\" and (not ppletter == "\\")):
								instring = false
						"\"" when !instring:
							instring = true
			if instring:
				print("Uneven string ", i)
				return false
			if depth != 0:
				print("Uneven parens ", i)
				return false
			raw[i] = [indent, iter.strip_edges()]
		for i in raw:
			var line = i[1]
	else:
		_stat = Status.FILE_ERROR
		return false
	_stat = Status.UNKOWN_ERROR
	return false

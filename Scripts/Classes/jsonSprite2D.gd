@icon("res://Editor/ico/JsonSprite2D.svg")
class_name JsonSprite2D
extends Sprite2D


static var _imgcache := {}
static var _datcache := {}


const _DATA_MATCH = {
	"tiles": [0, 0],
	"animations": {
		"an_action": {
			"fps": 30,
			"loop": true,
			"loop_point": 0, #optional
			"autoplay_next": "an_action", #optional
			"randomize_start": false, #optional
			"frames": [
				#X, Y, hflip, vflip
				[0, 0, false, false],
			]
		},
	}
}


@export_file("*.json") var texture_path:String
var _timer := 0.0
var data:Dictionary
var is_ready := false
var _has_action := false
var _recheck := false
var _index:int = 0
var action:String:
	set(value):
		action = value
		_index = 0
		_timer = 0
		_check_action()


func _check_action():
	if is_ready:
		_has_action = data["animations"].has(action)
		if _has_action:
			if data["animations"][action].has("randomize_start"):
				if data["animations"][action]["randomize_start"]:
					_index = randi_range(0, data["animations"][action]["frames"].size() - 1)
		_recheck = false
		return
	_recheck = true


func _ready() -> void:
	var pathtrimmed := texture_path.get_basename()
	if not texture_path.get_extension().to_lower() == "json":
		assert(false, "Path is not a json file!")
		return
	
	
	if _imgcache.has(pathtrimmed):
		texture = _imgcache[pathtrimmed]
	else:
		var found := false
		for i:String in [".png", ".svg", ".tga", ".hdr", ".exr", ".ktx", ".dds", ".bmp", ".jpg", ".jpeg", ".webp"]:
			var path := pathtrimmed + i
			if FileAccess.file_exists(path):
				var tex = load(path)
				if tex is Texture:
					_imgcache[pathtrimmed] = tex
					texture = tex
					found = true
					break
		if not found:
			assert(false, "Texture doesn't exist, or it hasn't been imported as a texture!")
			return
	
	
	if _datcache.has(pathtrimmed):
		data = _datcache[pathtrimmed]
	else:
		if not FileAccess.file_exists(texture_path):
			assert(false, "Path to json is invalid!")
			return
		var j := JSON.new()
		var f := FileAccess.open(texture_path, FileAccess.READ)
		if j.parse(f.get_as_text()) != OK:
			f.close()
			assert(
				false,
				"JSON parsing failed! Line " + str(j.get_error_line()) +
				", Message: \"" + j.get_error_message() +
				"\", In file " + texture_path
			)
			return
		f.close()
		var tempdata = j.data
		if not tempdata is Dictionary:
			assert(false, "Json data has invalid base type!")
			return
		tempdata = tempdata as Dictionary
		for i in _DATA_MATCH.keys():
			if tempdata.has(i):
				if not typeof(tempdata[i]) == typeof(_DATA_MATCH[i]):
					assert(false, "Key type mismatch: " + i)
					return
			else:
				assert(false, "Missing key: " + i)
				return
		for i in tempdata["animations"].keys():
			var t = tempdata["animations"][i]
			if not (t is Dictionary):
				assert(false, "Animation is incorrect type: " + i)
				return
			if not t.has_all(["fps", "frames"]):
				assert(false, "Animation is missing important keys")
				return
			for h in t["frames"]:
				if h is Array:
					if h.size() == 4:
						if (Statics.is_number(h[0]) and 
							Statics.is_number(h[1]) and 
							h[2] is bool and
							h[3] is bool):
								continue
				assert(false, "Invalid frame data!")
				return
			for h in t.keys():
				if _DATA_MATCH["animations"]["an_action"].has(h):
					if typeof(t[h]) == typeof(_DATA_MATCH["animations"]["an_action"][h]):
						continue
					else:
						if (Statics.is_number(t[h]) and 
							Statics.is_number(_DATA_MATCH["animations"]["an_action"][h])):
							continue
					assert(false, "Animation data type mismatch: " + h)
					return
				assert(false, "Extra animation data: " + h)
				return
		if tempdata["tiles"].size() != 2:
			assert(false, "tiles is not vector")
			return
		if not (Statics.is_number(tempdata["tiles"][0]) and
			Statics.is_number(tempdata["tiles"][1])):
			assert(false, "tiles is not vector")
			return
		_datcache[pathtrimmed] = tempdata
		data = tempdata
	
	hframes = data["tiles"][0]
	vframes = data["tiles"][1]
	is_ready = true


func _process(delta: float) -> void:
	if _recheck:
		_check_action()
	_timer += delta
	if _has_action:
		var _action:Dictionary = data["animations"][action]
		var _fps:float = _action["fps"]
		var _frames:Array = _action["frames"]
		var _frametime = 1 / _fps
		if _timer >= _frametime:
			_timer -= _frametime
			var frame = _frames[_index]
			if min(frame[0], frame[1]) < 0:
				hide()
			else:
				show()
				frame_coords = Vector2i(frame[0], frame[1])
			flip_h = frame[2]
			flip_v = frame[3]
			_index += 1
			if _index >= _frames.size():
				if _action["loop"]:
					if _action.has("loop_point"):
						_index = int(_action["loop_point"])
					else:
						_index = 0
				elif _action.has("autoplay_next"):
					action = _action["autoplay_next"]
					return
				else:
					action = "__NONE__"
					return

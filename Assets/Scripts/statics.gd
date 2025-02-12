extends RefCounted
class_name Statics


static func is_number(value:Variant, consider_strings := false) -> bool:
	if value is int:
		return true
	if value is float:
		return true
	if consider_strings:
		if value is String:
			if value.is_valid_float():
				return true
			if value.is_valid_int():
				return true
			if value.is_valid_hex_number():
				return true
			if value.is_valid_hex_number(true):
				return true
	return false

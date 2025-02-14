extends RefCounted
class_name Statics


#region Variables
const PI_OVER_EIGHT:float = PI * 0.125
const PI_OVER_FOUR:float = PI * 0.25
const PI_OVER_THREE:float = PI * 0.3333
const PI_OVER_TWO:float = PI * 0.5
const THREE_PI_OVER_TWO:float = TAU - PI_OVER_TWO
const FRAC_8:float = 0.125
const FRAC_16:float = 0.0625
const FRAC_32:float = 0.03125
const FRAC_64:float = 0.015625
const FRAC_128:float = 0.0078125
const VECTOR_DIAG:Vector2 = Vector2(cos(deg_to_rad(40)), sin(deg_to_rad(40)))

#region Directional enums
enum DirsCompass {
	N,
	NE,
	E,
	SE,
	S,
	SW,
	W,
	NW,
	NONE,
}
enum DirsCardinal {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	NONE,
}
enum DirsSurface {
	FLOOR,
	LWALL,
	RWALL,
	CEILING,
	NONE,
}
#endregion

const HEALTH_ORB_VALUES = [ 1, 2, 4 ]
const HEALTH_ORB_MULTS = [ 1.25, 0.6, 0.125 ]

static var is_menu_open:bool = false
static var is_in_boss_rush:bool = false
static var increment_boss_rush_timer:bool = false
static var is_random_game:bool = false

static var noclip_mode:bool = false
static var damage_mult:bool = false
static var show_entity_layer:bool = false

# Block of vars from musicParent to healthOrbPointer

static var palette := "res://Assets/Images/Palette.png"
static var missing := "res://Assets/Images/Missing.png"

static var current_area:int = 0
static var current_subarea:int = 0

static var player:Player
static var cam_layer:Node2D
static var cam:Camera2D
static var active_room:Node2D
# UI

enum Items {
	PEASHOOTER,
	BOOMERANG,
	RAINBOWWAVE,
	DEVASTATOR,
	HIGHJUMP,
	SHELLSHIELD,
	RAPIDFIRE,
	ICESHELL,
	FLYSHELL,
	METALSHELL,
	GRAVSHOCK,
	SSBOOM,
	DEBUGRW,
	HEART,
	FRAGMENT,
	RADARSHELL,
	NONE,
}
#endregion


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

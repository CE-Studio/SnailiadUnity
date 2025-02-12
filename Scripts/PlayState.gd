extends Node


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

enum DirsCompass { N, NE, E, SE, S, SW, W, NW, NONE }
enum DirsCardinal { UP, DOWN, LEFT, RIGHT, NONE }
enum DirsSurface { FLOOR, LWALL, RWALL, CEILING, NONE }

const HEALTH_ORB_VALUES = [ 1, 2, 4 ]
const HEALTH_ORB_MULTS = [ 1.25, 0.6, 0.125 ]




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Player


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	$JsonSprite2D.action = "an_action"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	pass

extends Sprite2D
class_name MarkerSprite
## A temporary sprite that removes itself on scene load.


func _ready() -> void:
	queue_free()

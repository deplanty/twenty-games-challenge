class_name Brick
extends StaticBody2D

# Export
@export var brick_image: BrickImage


func _ready():
	$Sprite2D.texture = brick_image.texture


func get_hit():
	queue_free()

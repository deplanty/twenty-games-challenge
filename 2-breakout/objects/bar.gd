class_name Bar
extends CharacterBody2D


# Export
@export var speed: float = 400.0

# Public
var size: Vector2

func _ready():
	size = $CollisionShape2D.shape.size

func _process(delta):
	var direction: int = 0
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = +1
	
	var motion = Vector2(direction * speed, 0)
	move_and_collide(motion * delta)

class_name Enemy
extends CharacterBody2D

# Exports
@export var vspeed: float = 100
@export var acceleration: float = 1.0


func _process(delta):
	var motion = Vector2(0, 0)
	motion.y += vspeed * acceleration
	
	move_and_collide(motion * delta)

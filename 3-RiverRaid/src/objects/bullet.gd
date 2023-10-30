@icon("res://assets/images/bullet.png")
class_name Bullet
extends CharacterBody2D

# Exports
@export var speed: float = 400.0


func _process(delta):
	var motion = Vector2(0, -speed)
	var collider = move_and_collide(motion * delta)
	if collider and collider.get_collider() is Enemy:
		collider.get_collider().hit_by_bullet()
		queue_free()

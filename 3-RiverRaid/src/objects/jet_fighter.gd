class_name JetFighter
extends CharacterBody2D

# Signal
signal collide_enemy(Enemy)

# Exports
@export var speed: float = 300

# Public
var lives: int = 3


func _ready():
	pass


func _process(delta):
	var motion: Vector2 = Input.get_vector("move_left", "move_right", "nothing", "nothing")
	motion *= speed
	
	var collide = move_and_collide(motion * delta)
	if collide:
		if collide.get_collider() is Enemy:
			collide_enemy.emit(collide.get_collider())

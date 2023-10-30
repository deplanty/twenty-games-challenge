@icon("res://assets/images/plane.png")
class_name JetFighter
extends CharacterBody2D

# Signal
signal collide_enemy(Enemy)

# Exports
@export_group("Motion")
## Base speed of the jet fight
@export var speed: Vector2 = Vector2(300, 100)
## Speed modifier when the jet accelerates
@export_range(1.0, 5.0) var accelerate: float = 1.5
## Speed modifier when the jet brakes
@export_range(0.0, 1.0) var brake: float = 0.5

# On ready
@onready var bullets: Node = $Bullets
@onready var canons: Node = $Canons

# Public
var lives: int = 3

# Private
var _bullet_instance: PackedScene = preload("res://src/objects/bullet.tscn")


func _ready():
	pass


func _process(delta):
	var motion_x: float = -Input.get_action_raw_strength("move_left")
	if motion_x == 0:
		motion_x = Input.get_action_raw_strength("move_right")
	var motion = Vector2(motion_x, -1) * speed
	
	if Input.is_action_pressed("accelerate"):
		motion.y *= accelerate
	elif Input.is_action_pressed("brake"):
		motion.y *= brake
	
	if Input.is_action_pressed("fire_bullet"):
		fire_bullet()
	
	var collide = move_and_collide(motion * delta)
	if collide:
		print(collide.get_collider())
		if collide.get_collider() is Enemy:
			collide_enemy.emit(collide.get_collider())


func fire_bullet():
	var bullet = _bullet_instance.instantiate()
	bullet.position = position + canons.get_next()
	bullets.add_child(bullet)

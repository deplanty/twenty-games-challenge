extends Node2D

# Exports
@export_group("Motion")
@export_range(1.0, 5.0) var acceleration: float = 1.5
@export_range(0.0, 1.0) var brake: float = 0.5

# On ready
@onready var enemies: Node = $Enemies
@onready var jet_fighter: JetFighter = $JetFighter

func _ready():
	jet_fighter.collide_enemy.connect(_on_jet_fighter_collide_enemy)


func _process(delta):
	var modifier = 1.0
	if Input.is_action_pressed("accelerate"):
		modifier = acceleration
	elif Input.is_action_pressed("brake"):
		modifier = brake
	
	for enemy in enemies.get_children():
		enemy.acceleration = modifier

# Events

func _on_jet_fighter_collide_enemy(enemy:Enemy):
	enemy.queue_free()
	jet_fighter.queue_free()

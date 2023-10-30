extends Node2D

# Exports

# On ready
@onready var jet_fighter: JetFighter = $JetFighter


func _ready():
	jet_fighter.collide_enemy.connect(_on_jet_fighter_collide_enemy)

# Events

func _on_jet_fighter_collide_enemy(enemy:Enemy):
	enemy.queue_free()
	jet_fighter.set_process(false)
	jet_fighter.hide()

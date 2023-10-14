extends Node2D


func _ready():
	get_tree().change_scene_to_file("res://views/play.tscn")
	Game.load_score()

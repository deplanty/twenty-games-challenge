extends Control


func _ready() -> void:
	$CenterContainer/VBoxContainer/ButtonPlayPvP.pressed.connect(_on_button_play_pvp_pressed)
	$CenterContainer/VBoxContainer/ButtonPlayPvAI.pressed.connect(_on_button_play_pvai_pressed)
	$CenterContainer/VBoxContainer/ButtonQuit.pressed.connect(_on_button_quit_pressed)


func _on_button_play_pvp_pressed() -> void:
	## Change scene
	Game.game_selected = "pvp"
	get_tree().change_scene_to_file("res://views/play.tscn")


func _on_button_play_pvai_pressed() -> void:
	## Change scene
	Game.game_selected = "pvai"
	get_tree().change_scene_to_file("res://views/play.tscn")


func _on_button_quit_pressed() -> void:
	## Close the window
	get_tree().quit()

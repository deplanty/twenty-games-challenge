extends Control

# On ready
@onready var button_play: Button = $VBoxContainer/ButtonPlay
@onready var button_quit: Button = $VBoxContainer/ButtonQuit


func _ready():
	button_play.pressed.connect(_on_button_play_pressed)
	button_quit.pressed.connect(_on_button_quit_pressed)
	
	
	# Remove after
	get_tree().change_scene_to_file("res://src/views/play.tscn")

# Events

func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://src/views/play.tscn")


func _on_button_quit_pressed():
	get_tree().quit()

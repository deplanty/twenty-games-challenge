extends Control

# Exports

# On ready
@onready var ball = $Ball
@onready var label_score_1 = $CanvasLayer/HBoxContainer/LabelScoreBar1
@onready var label_score_2 = $CanvasLayer/HBoxContainer/LabelScoreBar2
@onready var sound_goal = $AudioStreamPlayer2D

# Public
var window_size = DisplayServer.window_get_size()

# Private
var score_1: int = 0
var score_2: int = 0


func _ready():
	if Game.game_selected == "pvp":
		$Bar2.controller = Bar.Ctrl.PLAYER_2
	elif Game.game_selected == "pvai":
		$Bar2.controller = Bar.Ctrl.AI

	$AreaGoal1.body_entered.connect(_area_goal1_body_entered)
	$AreaGoal2.body_entered.connect(_area_goal2_body_entered)
	
	$Bar1.position.x = 100
	$Bar1.position.y = window_size.y / 2
	$Bar2.position.x = window_size.x - 100
	$Bar2.position.y = window_size.y / 2
	
	init_ui()
	init_ball()

# Events

func _area_goal1_body_entered(body):
	if body != ball:
		return
	
	score_2 += 1
	label_score_2.text = str(score_2)
	sound_goal.play()
	init_ball()


func _area_goal2_body_entered(body):
	score_1 += 1
	label_score_1.text = str(score_1)
	sound_goal.play()
	init_ball()

# Methods

func init_ui():
	score_1 = 0
	score_2 = 0
	label_score_1.text = str(score_1)
	label_score_2.text = str(score_2)


func init_ball():
	ball.hide()
	ball.position = window_size / 2
	ball.init_random_direction()
	ball.show()

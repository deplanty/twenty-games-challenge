extends Node2D

@onready var bar: Bar = $Bar
@onready var ball: Ball = $Ball

var state: String = "pause"
var lives: int = 3


func _ready():
	Game.score = 0
	
	ball.hit_brick.connect(_on_ball_hit_brick)
	$AreaBottom.body_entered.connect(_on_area_bottom_ball_entered)
	
	$CanvasLayer/VBoxContainer/LabelScore.text = str(Game.score)
	$CanvasLayer/VBoxContainer/LabelScoreMax.text = str(Game.score_max)
	$CanvasLayer/VBoxContainer/LabelLives.text = str(lives)
	
	spawn_ball()


func _process(delta):
	if state == "pause":
		ball.position.x = bar.position.x


func _input(event):
	if event is InputEventKey and event.is_action_pressed("launch"):
		state = "play"
		ball.set_process(true)

# Events

func _on_ball_hit_brick(brick:Brick):
	brick.get_hit()
	Game.score += 10
	$CanvasLayer/VBoxContainer/LabelScore.text = str(Game.score)


func _on_area_bottom_ball_entered(body:Ball):
	spawn_ball()
	lives -= 1
	$CanvasLayer/VBoxContainer/LabelLives.text = str(lives)
	# Game over
	if lives < 0:
		Game.save_score()
		get_tree().reload_current_scene()

# Methods

func spawn_ball():
	ball.position.x = bar.position.x
	ball.position.y = bar.position.y - 30
	ball.init()
	ball.show()
	ball.set_process(false)
	state = "pause"

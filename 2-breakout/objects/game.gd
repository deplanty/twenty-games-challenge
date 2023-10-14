extends Node


var score: int
var score_max: int



func save_score():
	score_max = max(score, score_max)
	
	var file = FileAccess.open("res://highscore.txt", FileAccess.WRITE)
	file.store_string(str(score_max))
	file.close()

func load_score():
	var file = FileAccess.open("res://highscore.txt", FileAccess.READ)
	score_max = int(file.get_as_text())
	file.close()

extends CharacterBody2D
class_name Bar

enum Ctrl {
	PLAYER_1,
	PLAYER_2,
	AI
}


# Exports
@export var speed: float = 400.0
@export var controller: Ctrl = Ctrl.PLAYER_1
@export var ball: Ball


func _ready():
	if controller == Ctrl.AI and ball == null:
		assert(false, "Bar is AI and no ball is given")


func _process(delta):
	var motion := Vector2()
	if controller == Ctrl.PLAYER_1:
		if Input.is_action_pressed("move_up_p1"):
			motion.y = - speed * delta
		elif Input.is_action_pressed("move_down_p1"):
			motion.y = speed * delta
	elif controller == Ctrl.PLAYER_2:
		if Input.is_action_pressed("move_up_p2"):
			motion.y = - speed * delta
		elif Input.is_action_pressed("move_down_p2"):
			motion.y = speed * delta
	elif controller == Ctrl.AI:
		var diff: Vector2 = ball.position - position
		var direction: int = sign(diff.y)
		motion.y = direction * speed * delta
		
	
	move_and_collide(motion)

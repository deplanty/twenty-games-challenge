extends CharacterBody2D
class_name  Ball

# Export
@export_category("Motion")
@export var speed: float = 400.0
@export var speed_accel: float = 1.2
@export var speed_limit: float = 1_000.0

# On ready
@onready var label_debug: Label = $LabelDebug
@onready var sound_bar: AudioStreamPlayer2D = $Node/AudioStreamPlayer2DBar
@onready var sound_wall: AudioStreamPlayer2D = $Node/AudioStreamPlayer2DWall

# Private
var _speed_limit_squared: float = pow(speed_limit, 2)


func _ready():
	velocity.x = speed
	label_debug.text = str(velocity)


func _process(delta):
	var collide = move_and_collide(velocity * delta)
	
	if collide:
		# Bounce
		velocity = velocity.bounce(collide.get_normal())
		if collide.get_collider() is Bar:
			sound_bar.play()
			# Accelerate the ball until a limit
			if velocity.length_squared() < _speed_limit_squared:
				velocity *= speed_accel
				# If the speed is greater than the limit
				if velocity.length_squared() > _speed_limit_squared:
					velocity = velocity.normalized() * speed_limit
		else:
			sound_wall.play()
		
		label_debug.text = str(velocity)


func init_random_direction():
	var vel = Vector2()
	var i = 0
	while vel.x < 0.5:
		vel = Vector2(randf(), randf())
		i += 1
		if i > 10:
			vel.x = 0.6
	
	velocity = vel.normalized() * speed

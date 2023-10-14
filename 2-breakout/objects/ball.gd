class_name Ball
extends CharacterBody2D

# Signals
signal hit_brick(Brick)

# Export
@export var speed: float = 400.0
@export var bar: Bar


func _ready():
	if not bar:
		assert(false, "The ball need the bar to be given.")
	init()


func _process(delta):
	var collide = move_and_collide(velocity * delta)
	
	if collide:
		# When collide on bar
		if collide.get_collider() is Bar:
			var percent = (position.x - bar.position.x) / (bar.size.x / 2)
			var angle = clamp(percent * PI/4, -1.0, 1.0)
			var normal = Vector2(0, -1).rotated(angle)
			velocity = normal * speed
			$Audio/AudioStreamPlayerBar.play()
		# When collide on a wall
		elif collide.get_collider() is Walls:
			velocity = velocity.bounce(collide.get_normal())
			$Audio/AudioStreamPlayerWall.play()
		# When collide on a brick
		elif collide.get_collider() is Brick:
			velocity = velocity.bounce(collide.get_normal())
			$Audio/AudioStreamPlayerBrick.play()
			hit_brick.emit(collide.get_collider())

func init():
	velocity = Vector2(0, -1) * speed

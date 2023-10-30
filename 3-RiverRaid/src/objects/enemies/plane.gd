@icon("res://assets/images/plane2.png")
extends Enemy

# Enums
enum Direction {
	LEFT = -1,
	RIGHT = 1
}

# Exports
## How long does the helicopter wait before starting to move.
## The value is randomized between this range.
@export var range_delay_start_move: Array[float] = [1.0, 2.0]
## How long does the helicopter wait before stoping to move.
## The value is randomized between this range.
@export var range_delay_stop_move: Array[float] = [2.0, 5.0]
## Horizontal speed of the helicopter.
@export var speed: float = 200
## Starting direction to move.
@export var start_direction: Direction = Direction.RIGHT

# Private
## Direction can be -1 (left), 0 (stop), 1 (right)
var _move: bool
var _direction: int
var _delay_start_move: float
var _delay_stop_move: float


func _ready():
	_delay_start_move = randf_range(range_delay_start_move[0], range_delay_start_move[1])
	_delay_stop_move = randf_range(range_delay_stop_move[0], range_delay_stop_move[1])
	
	_direction = start_direction
	
	_move = false
	var timer = get_tree().create_timer(_delay_start_move)
	timer.timeout.connect(_on_timer_start_move_timeout)


func _process(delta):
	if _move:
		move_and_collide(_direction * Vector2(speed, 0) * delta)


func _on_timer_start_move_timeout():
	_move = true
	var timer = get_tree().create_timer(_delay_stop_move)
	timer.timeout.connect(_on_timer_stop_move_timeout)


func _on_timer_stop_move_timeout():
	_move = false
	if _direction == Direction.RIGHT:
		_direction = Direction.LEFT
	elif _direction == Direction.LEFT:
		_direction = Direction.RIGHT
	var timer = get_tree().create_timer(_delay_start_move)
	timer.timeout.connect(_on_timer_start_move_timeout)

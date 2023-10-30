extends Node2D


# Private
var _current: int = -1
var _max: int


func _ready():
	_max = get_child_count()


func get_next() -> Vector2:
	if _max == 0:
		push_error("No Canon found.")
	
	_current += 1
	if _current >= _max:
		_current = 0
	
	return get_child(_current).position 

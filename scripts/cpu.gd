extends StaticBody2D

var ball_pos : Vector2
var dis : int
var move_by : int
var win_height : int
var racket_height : int
const CPU_SPEED : int = 400 

func _ready():
	win_height = get_viewport_rect().size.y
	racket_height = $ColorRect.get_size().y

func _process(delta: float) -> void:
	# move to ball
	ball_pos = $"../Ball".position
	dis = position.y - ball_pos.y
	
	if abs(dis) > CPU_SPEED * delta:
		move_by = CPU_SPEED * delta * (dis/ abs(dis))
	else:
		move_by = dis
	
	position.y -= move_by
	
	# limit movement
	position.y = clamp(position.y, racket_height / 2, win_height - racket_height / 2)

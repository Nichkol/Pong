extends StaticBody2D

var win_height : int
var racket_height : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	racket_height = $ColorRect.get_size().y



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		position.y -= get_parent().PLAYER_SPEED * delta
	elif Input.is_action_pressed("down"):
		position.y += get_parent().PLAYER_SPEED * delta

	# limit movement
	position.y = clamp(position.y, racket_height / 2, win_height - racket_height / 2)

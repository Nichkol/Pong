extends CharacterBody2D

var win_size : Vector2
var START_SPEED : int = 500 
var ACCEL : int = 100
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6

func _ready():
	win_size = get_viewport_rect().size

# randomize ball spawn
func new_ball():
	position.x = win_size.x / 2
	position.y = randi_range (200, win_size.y - 200)
	speed = START_SPEED
	dir = random_direction()

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		# if collision w paddle
		if collider == $"../Player" or collider == $"../Cpu":
			speed += ACCEL
			dir = new_direction(collider)
		else:
			dir = dir.bounce(collision.get_normal())

func new_direction(collider):
	var ball_y = position.y
	var racket_y = collider.position.y
	var dis = ball_y - racket_y
	var new_dir := Vector2()
	
	#flip the horizonatal direction
	if dir.x > 0:
		new_dir.x = -1
	else: 
		new_dir.x = 1
	new_dir.y = (dis / (collider.racket_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
	

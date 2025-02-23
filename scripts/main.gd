extends Sprite2D

var score := [0, 0] # 0: player , 1: cpu

const PLAYER_SPEED : int = 800 


func _on_timer_timeout() -> void:
	$Ball.new_ball()
	


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$HUD/CpuScore.text = str(score[1])
	$Timer.start()

func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$Timer.start()

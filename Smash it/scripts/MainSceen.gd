extends Node2D

var score = 0
var count = 0
signal died

func _ready():
	Global.died = false
	Global.move = false

func _input(event):
	if event is InputEventMouseButton:
		Global.move = true
		$Label.hide()
		$ScoreIncreser.start()

func _physics_process(delta):
	$Score.text = str(score)
	if Global.died == false:
		$ParallaxBackground.scroll_base_offset -= Vector2(40,0) * delta
	if Global.died == true && count == 0:
		emit_signal("died")

func _on_MainSceen_died():
	if score > Global.highscore:
		Global.highscore = score
	$ScoreIncreser.stop()
	$Player._die()
	count += 1
	$Died.play()
	$Back.playing = false
	$AnimationPlayer.play("shake")
	yield($AnimationPlayer, "animation_finished")
	$Endscreen.show()
	$Endscreen/Score.text = "Score : " + str(score)
	$Endscreen/HighScore.text = 'Highscore : ' + str(Global.highscore)


func _on_Retry_pressed():
	get_tree().reload_current_scene()


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/First scceen.tscn")


func _on_ScoreIncreser_timeout():
	score += 1

extends Node2D


var enemy1 = preload("res://scenes/Enemy1.tscn")
var enemy2 = preload("res://scenes/Enemy2.tscn")
var enemy3 = preload("res://scenes/Enemy1.tscn")
var enemy4 = preload("res://scenes/Enemy1.tscn")
var enemy5 = preload("res://scenes/Enemy1.tscn")

func _spawn_enemy():
	var enimies = [enemy1 , enemy2, enemy3, enemy4, enemy5]
	var kinds = enimies[randi()%enimies.size()]
	var enemy = kinds.instance()
	enemy.position.x = 1080
	enemy.position.y = rand_range(48,552)
	add_child(enemy)



func _on_Timer_timeout():
	if Global.move == true && Global.died == false:
		_spawn_enemy()
		$Timer.wait_time = rand_range(0.3,0.7)
	if Global.died == true:
		$Timer.stop()

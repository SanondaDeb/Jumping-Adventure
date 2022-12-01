extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$click.emitting = false

func _input(event):
	if event is InputEventMouseButton:
		$click.position = get_global_mouse_position()
		$click.emitting = true


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/MainSceen.tscn")


func _on_Shop_pressed():
	get_tree().change_scene("res://scenes/Shop.tscn")

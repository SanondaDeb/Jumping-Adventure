extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position.x -= 400 * delta
	if position.x <-200:
		queue_free()


func _on_Enemy1_body_entered(body):
	Global.died = true

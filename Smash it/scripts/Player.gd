extends KinematicBody2D

var texture = [
																"res://images/player/player1.png",
																"res://images/player/player2.png",
																"res://images/player/player12.png",
																"res://images/player/player4.png",
																"res://images/player/player5.png",
																"res://images/player/player3.png",
																"res://images/player/player11.png",
																"res://images/player/player10.png",
																"res://images/player/player13.png",
																"res://images/player/player8.png",
																"res://images/player/player6.png",
																"res://images/player/player9.png",
																"res://images/player/player7.png",
																"res://images/player/player1.png",
																"res://images/player/player1.png",
																"res://images/player/player1.png",
]

const UP = Vector2(0,-1)
const flap = 300.0
const MAXFALLSPEED = 300
const gravity = 20

var motion = Vector2()

var velocity: = Vector2.ZERO

func _ready():
	Global.load_store()
	$Sprite.texture = load(texture[Global.store.selected])

func _physics_process(_delta):
	if position.y <= -20:
		get_parent().emit_signal("died")
		queue_free()
	if position.y >= 650:
		get_parent().emit_signal("died")
		queue_free()
	if Global.move == true && Global.died == false:
		motion.y += gravity 
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED
		if Input.get_action_strength("jump"):
			motion.y = -flap
		motion = move_and_slide(motion, UP)

func _die():
	$Sprite.hide()
	$Particles2D.emitting = true

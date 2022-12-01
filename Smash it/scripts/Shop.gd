extends Node2D


onready var panals = $Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.load_store()
	for item in range (panals.get_child_count()):
		if Global.store.bought[item] == true:
			panals.get_node('Panel'+str(item+1)).get_node('Button').text = 'Select'
		panals.get_node('Panel'+str(Global.store.selected+1)).get_node('Button').text = 'Selected'
		panals.get_node('Panel'+str(Global.store.selected+1)).get_node('Button').add_to_group('Selected')

func _process(delta):
	$Control.position.y = -$HScrollBar.value

func _selected(node, no):
	Global.load_store()
	for buttons in get_tree().get_nodes_in_group('Selected'):
		buttons.text = 'Select'
		buttons.remove_from_group('Selected')
	node.text = 'Selected'
	node.add_to_group('Selected')
	Global.store.selected = no
	Global.save_store()

func _buy(ad_no, item_no):
	Global.load_store()
	if Global.store.bought[item_no] == false:
		if ad_no <= 0:
			Global.store.bought[item_no] = true
			panals.get_node('Panel'+str(item_no+1)).get_node('Button').text = 'Select'
			Global.save_store()
	else:
		_selected(panals.get_node('Panel'+str(item_no+1)).get_node('Button'), item_no)
		Global.save_store()
	Global.save_store()




func _on_Button1_pressed():
	_buy(0,0)


func _on_Button2_pressed():
	_buy(0,1)


func _on_Button3_pressed():
	_buy(0,2)


func _on_Button4_pressed():
	_buy(0,3)


func _on_Button5_pressed():
	_buy(0,4)


func _on_Button6_pressed():
	_buy(0,5)


func _on_Button7_pressed():
	_buy(0,6)


func _on_Butto8n_pressed():
	_buy(0,7)


func _on_Button9_pressed():
	_buy(0,8)


func _on_Button10_pressed():
	_buy(0,9)


func _on_Button11_pressed():
	_buy(0,10)


func _on_Button12_pressed():
	_buy(0,11)


func _on_Button13_pressed():
	_buy(0,12)


func _on_Button14_pressed():
	_buy(0,13)

func _on_Button16_pressed():
	_buy(0,14)


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/First scceen.tscn")

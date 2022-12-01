extends Node

var move = false
var highscore = 0

var died = false

var store = {
																'bought' : [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
																'selected' : 0, 
}
var save_store_path = 'user://save_store_jump_adven'

func _selected(node):
	node.text = 'Selected'


func save_store():
	var file = File.new()
	file.open(save_store_path, file.WRITE_READ)
	file.store_var(store)
	file.close()

func load_store():
	var file = File.new()
	if not file.file_exists(save_store_path):
		return false
	file.open(save_store_path, file.READ)
	store = file.get_var()
	file.close()
	return true


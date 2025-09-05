extends VBoxContainer

func _ready():
	Global.move.connect(noww)

func noww():
	for button in get_tree().get_nodes_in_group("move_mod"):
		button.visible = true

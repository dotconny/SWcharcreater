extends VBoxContainer

func _ready():
	for button in get_tree().get_nodes_in_group("resistance"):
		button.pressed.connect(resist)
	for button in get_tree().get_nodes_in_group("weaknesss"):
		button.pressed.connect(weak)
	for button in get_tree().get_nodes_in_group("immunity"):
		button.pressed.connect(imm)

func resist():
	Global.res -= 1
	if Global.res < 1:
		for button in get_tree().get_nodes_in_group("resistance"):
			button.visible = false

func weak():
	Global.weak -= 1
	if Global.weak < 1:
		for button in get_tree().get_nodes_in_group("weaknesss"):
			button.visible = false

func imm():
	Global.imm -= 1
	if Global.imm < 1:
		for button in get_tree().get_nodes_in_group("immunity"):
			button.visible = false

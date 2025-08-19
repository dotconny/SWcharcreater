extends VBoxContainer

func _ready():
	for button in get_tree().get_nodes_in_group("resistance"):
		button.pressed.connect(resist)
	for button in get_tree().get_nodes_in_group("weaknesss"):
		button.pressed.connect(weak)
	for button in get_tree().get_nodes_in_group("immunity"):
		button.pressed.connect(imm)
	Global.resistance.connect(update)

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

func update():
	if Global.imm >= 1:
		for button in get_tree().get_nodes_in_group("immunity"):
			button.visible = true
	if Global.res >= 1:
		for button in get_tree().get_nodes_in_group("resistance"):
			button.visible = true
	if Global.weak >= 1:
		for button in get_tree().get_nodes_in_group("weaknesss"):
			button.visible = true

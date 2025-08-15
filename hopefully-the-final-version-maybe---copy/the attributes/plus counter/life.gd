extends Button

func _ready():
	pressed.connect(_on_pressed)
	for button in get_tree().get_nodes_in_group("IncreaseSoul"):
		button.pressed.connect(_on_plus_soul)
	for button in get_tree().get_nodes_in_group("DecreaseSoul"):
		button.pressed.connect(_on_minus_soul)

func _update_label():
	$"../../HBoxContainer/Soul".text = str(Global.Soul)

func _on_plus_soul():
	Global.Soul = (Global.efffth + Global.effmgc + Global.efflife + Global.Soul_b)
	Global.Soul /= 2
	_update_label()

func _on_minus_soul():
	Global.Soul = (Global.efffth + Global.effmgc + Global.efflife + Global.Soul_b)
	Global.Soul /= 2
	_update_label()


func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.life += 1
	Global.efflife += 1
	update(Global.efflife)

extends Button

func _update_label():
	$"../../HBoxContainer/Body".text = str(Global.Body)

func _ready():
	pressed.connect(_on_pressed)
	for button in get_tree().get_nodes_in_group("IncreaseBody"):
		button.pressed.connect(_on_any_Bplus_button_pressed)
	for button in get_tree().get_nodes_in_group("DecreaseBody"):
		button.pressed.connect(_on_any_Bminus_button_pressed)

func _on_any_Bplus_button_pressed():
	Global.Body = (Global.effstr + Global.effath + Global.effhlth + Global.Body_b)
	Global.Body /= 2
	_update_label()

func _on_any_Bminus_button_pressed():
	Global.Body = (Global.effstr + Global.effath + Global.effhlth + Global.Body_b)
	Global.Body /= 2
	_update_label()
	
func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.ath += 1
	Global.effath += 1
	update(Global.effath)

extends VBoxContainer



func _ready():
	call_deferred("update_label")
	for button in get_tree().get_nodes_in_group("IncreaseBody"):
		button.pressed.connect(_on_any_Bplus_button_pressed)
	for button in get_tree().get_nodes_in_group("DecreaseBody"):
		button.pressed.connect(_on_any_Bminus_button_pressed)
func update_label():
	$NinePatchRect/VBoxContainer/stats/Body/HBoxContainer/Body.text = str(Global.Body)
func _on_any_Bplus_button_pressed():
	Global.Body = (Global.effstr + Global.effath + Global.effhlth)/2
	update_label()

func _on_any_Bminus_button_pressed():
	Global.Body = (Global.effstr + Global.effath + Global.effhlth)
	Global.Body /= 2
	update_label()

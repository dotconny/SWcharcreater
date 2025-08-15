extends Label

func _ready():
	for button in get_tree().get_nodes_in_group("IncreaseMind"):
		button.pressed.connect(_on_any_plus_button_pressed)
	for button in get_tree().get_nodes_in_group("DecreaseMind"):
		button.pressed.connect(_on_any_minus_button_pressed)



func _update_label():
	$".".text = str(Global.Mind)

func _on_any_minus_button_pressed():
	Global.Mind = (Global.effint + Global.effwis + Global.effprc + Global.effstl + Global.effprs + Global.effcha + Global.Mind_b)/2
	_update_label()



func _on_any_plus_button_pressed():
	Global.Mind = (Global.effint + Global.effwis + Global.effprc + Global.effstl + Global.effprs + Global.effcha + Global.Mind_b)/2
	_update_label()

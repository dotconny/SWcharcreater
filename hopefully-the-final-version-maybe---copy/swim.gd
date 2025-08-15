extends HBoxContainer




func _on_plus_pressed():
	Global.swim += 1
	$num.text = str(Global.swim)
	Global.move_i -= 1
	if Global.move_i == 0:
		for button in get_tree().get_nodes_in_group("move_mod"):
			button.visible = false

func _on_minus_pressed():
	Global.swim -= 1
	$num.text = str(Global.swim)
	Global.move_i += 1
	if Global.move_i >= 0:
		for button in get_tree().get_nodes_in_group("move_minus"):
			button.visible = false
	if Global.swim < 1:
		$minus.visible = false

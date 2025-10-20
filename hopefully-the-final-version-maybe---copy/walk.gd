extends HBoxContainer

func _on_plus_pressed():
	Global.walk += 1
	$num.text = str(Global.walk)
	Global.move_i -= 1
	print(Global.move_i)
	if Global.move_i == 0:
		for button in get_tree().get_nodes_in_group("move_mod"):
			button.visible = false

func _on_minus_pressed():
	Global.walk -= 1
	$num.text = str(Global.walk*(Global.military+1))
	Global.move_i += 1
	print(Global.move_i)
	if Global.move_i >= 0:
		for button in get_tree().get_nodes_in_group("move_minus"):
			button.visible = false
	if Global.walk < 1:
		$minus.visible = false

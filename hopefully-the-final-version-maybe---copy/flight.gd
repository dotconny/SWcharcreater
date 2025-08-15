extends HBoxContainer



func _on_plus_pressed():
	Global.fly += 1
	$num.text = str(Global.fly)
	Global.move_i -= 1
	if Global.move_i == 0:
		for button in get_tree().get_nodes_in_group("move_mod"):
			button.visible = false
		$plus.visible = false


func _on_minus_pressed():
	Global.fly -= 1
	$num.text = str(Global.fly)
	Global.move_i += 1
	if Global.move_i >= 0:
		for button in get_tree().get_nodes_in_group("move_minus"):
			button.visible = false
	if Global.fly < 1:
		$minus.visible = false

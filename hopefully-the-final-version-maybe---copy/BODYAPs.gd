extends HBoxContainer


func _on_increase_pressed():
	if Global.bAP > 0:
		Global.bAP -= 1
		if Global.bAP == 0:
			if Global.AP < 1:
				for button in get_tree().get_nodes_in_group("IncreaseBody"):
					button.disabled = true
	else:
		Global.AP -= 1

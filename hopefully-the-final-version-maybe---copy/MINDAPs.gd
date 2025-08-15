extends HBoxContainer


func _on_increase_pressed():
	if Global.mAP > 0:
		Global.mAP -= 1
		if Global.mAP == 0:
			if Global.APs < 1:
				for button in get_tree().get_nodes_in_group("IncreaseMind"):
					button.disabled = true
	else:
		Global.AP -= 1

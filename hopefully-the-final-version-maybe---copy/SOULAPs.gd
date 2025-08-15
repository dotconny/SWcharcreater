extends HBoxContainer

#var number := 0

#func ready():
#	$Num.text = str(number)


#func update_label():
#	$Num.text = str(number)



func _on_increase_pressed():
	if Global.sAP > 0:
		Global.sAP -= 1
		if Global.sAP == 0:
			if Global.AP < 1:
				for button in get_tree().get_nodes_in_group("IncreaseSoul"):
					button.disabled = true
	else:
		Global.AP -= 1
#	number += 1
#	update_label()



#func _on_decrease_pressed():
#	number -= 1
#	Global.AP += 1
#	update_label()

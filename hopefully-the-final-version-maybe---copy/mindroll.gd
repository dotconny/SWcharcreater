extends HBoxContainer



func _on_mind_d_20_pressed():
	var roll = randi() % 20 + 1 + Global.Mind
	$"Mind Roll".text = str(roll)
	$"atk num".text = str(roll + Global.ATK) 

func _on_plus_pressed():
	Global.Mind_b += 2

func _on_minus_pressed():
	Global.Mind_b -= 2

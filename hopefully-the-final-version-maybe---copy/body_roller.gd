extends HBoxContainer



func _on_body_d_20_pressed():
	var roll = randi() % 20 + 1 + Global.Body
	$"roll result".text = str(roll)
	$Label3.text = str(roll+Global.ATK)



func _on_plus_pressed():
	Global.Body_b += 2


func _on_minus_pressed():
	Global.Body_b -= 2

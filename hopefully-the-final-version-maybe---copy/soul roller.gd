extends HBoxContainer



func _on_button_pressed():
	var roll = randi() % 20 + 1 + Global.Soul
	$Label.text = str(roll)


func _on_plus_pressed():
	Global.Soul_b += 2

func _on_minus_pressed():
	Global.Soul_b -= 2

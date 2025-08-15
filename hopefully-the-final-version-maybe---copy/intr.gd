extends Button

func _on_pressed() :
	var roll = randi() % 20 + 1 + Global.effint
	$"../d20".text = str(roll)
	$"../atk_roll".text = str(roll + Global.ATK)

extends HBoxContainer

func _ready():
	for button in get_tree().get_nodes_in_group("HPmod"):
		button.pressed.connect(hp)

func hp():
	print(Global.empty)
	if Global.empty == true:
		$Label2.text = str(Global.LVHP/2 + Global.HP + Global.effhlth * 10)
	else:
		if Global.Constructs == 1:
			$Label2.text = str(Global.LVHP + Global.HP + Global.effhlth * 10 + Global.efflife*10)
		else:
			if Global.moss:
				$Label2.text = str(40+ Global.LVHP + Global.HP + Global.effhtlh * 10 + Global.effhlth/3*10)
			else:
				$Label2.text = str(Global.LVHP + Global.HP + Global.effhlth * 10 + Global.effhlth/3*10)

extends OptionButton

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			Global.BD += 1
			Global.AP += 2
			Global.walk += 10
		1:
			Global.CC += 2
			Global.cs += 2
			Global.HP += 20
		2:
			Global.swim += 20
			Global.force_res += 1
			Global.Body += 2
			$"../../../../stats/Body/HBoxContainer/Body".text = str(Global.Body)
		3:
			Global.fly += 10
			Global.flight = true
			Global.dark_vis += 50
		4:
			Global.CC += 2
			Global.BD += 2
			Global.fire_res += 1
		5:
			Global.heal_buff += 30
			Global.cs += 3
			Global.jump += 20
		6:
			Global.LP += 50
			Global.HP -= 20
			Global.extremophile = true
		7:
			Global.BD += 1
			Global.effstl += 3
	$"../SpeciesOption".update()

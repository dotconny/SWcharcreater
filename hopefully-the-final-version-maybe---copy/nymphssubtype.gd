extends OptionButton

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			Global.BD += 2
			Global.fire_res += 1
		1:
			Global.force_res += 1
		2:
			Global.HP += 30
			Global.CC += 1
		3:
			pass # jus abilities </3 
		4:
			Global.dark_vis += 100
		5:
			Global.HP += 20
			Global.LP += 20
			Global.light_res += 1
		6:
			Global.BD += 2
			Global.shield_health += 10
			Global.AP += 2
		7:
			Global.SP += 2
			Global.CC += 2
	$"../SpeciesOption".update()

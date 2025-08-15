extends OptionButton

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			pass
		1:
			Global.CC -= 3
			Global.jump += 10
			Global.walk += 10
			Global.climb += 10
			Global.swim += 10
		2:
			Global.HP += 20
			Global.CC += 1
			Global.durable = true
		3:
			Global.melee += 5
			Global.CC -= 4
			Global.dodge += 1
	$"../SpeciesOption".update()

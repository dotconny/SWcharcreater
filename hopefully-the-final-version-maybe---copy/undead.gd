extends OptionButton



func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	match index:
		0:
			Global.bleed_res += 2
		1:
			Global.poison_res += 2
		2:
			Global.CC += 3
			Global.efflife -= 2
			Global.Soul += 2
		3:
			Global.BD += 3
			Global.AP += 2
			Global.fire_res -= 1
			Global.poison_res -= 1
			Global.faith_res -= 1
			$"../../BD/typing".text = "(Bleeding (1))"
	$"../SpeciesOption".update()

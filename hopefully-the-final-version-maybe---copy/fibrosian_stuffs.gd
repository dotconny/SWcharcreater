extends OptionButton



func _ready():
	connect("item_selected", self._on_item_selected)
	var options = ["","Tree","Shrubbery","Thistle","Cactus","Flower","Fungi","Aquatic","Moss"]
	for item in options:
		$".".add_item(item)


func _on_item_selected(index):
	match index:
		0:
			visible = false
		1:
			Global.CC += 2
			Global.SP += 1
			var old = "+10"
			var new = "+20"
			$"../../../VBoxContainer2/ScrollContainer".new_splice(old, new)
		2:
			Global.effstl += 4
			var old = "Spend 3 IP"
			var new = "Spend 2 IP"
			$"../../../VBoxContainer2/ScrollContainer".new_splice(old, new)
		3:
			$"../../../VBoxContainer2/ScrollContainer".ability("Deal BD when grappling or being grappled in piercing")
			$"../../BD/typing".text = "(Poison (1) )"
			#skill
		4:
			Global.CC += 1
			Global.BD += 3
			Global.cactus = true
			Global.DP += 1
		5:
			Global.effprs += 4
			Global.HP += 10
			#skill
		6:
			var old = "direct sunlight"
			var new = "complete darkness"
			$"../../../VBoxContainer2/ScrollContainer".new_splice(old, new)
			Global.dark_vis = 9223372036854775807
			Global.poison_res += 2
			Global.bleed_res += 2
		7:
			Global.swim += 10
			var old = "direct sunlight"
			var new = "in water"
			$"../../../VBoxContainer2/ScrollContainer".new_splice(old, new)
			$"../../HP/HP buff".text = "receive double healing"
		8:
			var ability = "Moss - Grapples always succeed"
			$"../../../VBoxContainer2/ScrollContainer".ability(ability)
			Global.moss = true
	$".".disabled = true

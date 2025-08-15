extends OptionButton

func _ready():
	for button in get_tree().get_nodes_in_group("prime plusplus"):
		button.pressed.connect(_remove_p)
	for button in get_tree().get_nodes_in_group("prime minus"):
		button.pressed.connect(_remove_m)


func _remove_p():
	for button in get_tree().get_nodes_in_group("prime plusplus"):
		button.disabled = true
		button.visible = false

func _remove_m():
	for button in get_tree().get_nodes_in_group("prime minus"):
		button.disabled = true
		button.visible = false

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			pass
		1:
			Global.effprs += 2
			Global.fly += 5
			Global.flight = true
		2:
			Global.empty = true
		3:
			Global.fire_res -= 1
		4:
			Global.BD += 3
			$"../../BD/typing".text = "(Fire (optional, burn on great)"
		5:
			$"../../BD/typing".text = "(Bleed (1))"
		6:
			pass
		7:
			Global.Prime += 1
			Global.anti_p += 1
			for button in get_tree().get_nodes_in_group("prime plus"):
				button.disabled = false
				button.visible = true
		8:
			Global.mSP += 1
			Global.ghost_witch += 1
		9: 
			$"../../BD/typing".text = "Poison (3)"
		10:
			Global.spring += 1
		11:
			pass
		12:
			Global.IPs += 1
			$"../../IPs/Label3".text += "   (+5 EXHAUSTION PER COMBAT)"
		13:
			Global.shield_health += 10
	$"../SpeciesOption".update()

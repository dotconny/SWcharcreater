extends HBoxContainer



func _ready():
	for button in get_tree().get_nodes_in_group("LPmod"):
		button.pressed.connect(lp)

func lp():
	$Label2.text = str(Global.LP + Global.LVLP + Global.efflife*10)
	if Global.Undead == 1:
		$Label2.text = "1"
	if Global.old_h == 1:
		$Label2.text = "5"
	if Global.moss:
		$Label2.text = "N/A!"

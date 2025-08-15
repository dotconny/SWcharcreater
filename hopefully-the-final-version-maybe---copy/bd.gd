extends HBoxContainer

func _ready():
	for button in get_tree().get_nodes_in_group("BDmod"):
		button.pressed.connect(bd)

func bd():
	$Label2.text = str(Global.BD)

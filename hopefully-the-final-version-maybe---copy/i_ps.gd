extends HBoxContainer

func _ready():
	for button in get_tree().get_nodes_in_group("IPmod"):
		button.pressed.connect(ip)

func ip():
	$Label2.text = str(Global.IPs)

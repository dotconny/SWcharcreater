extends VBoxContainer

func _on_option_button_item_selected(index):
	var string
	for VBoxContainer in get_tree().get_nodes_in_group("skill"):
		VBoxContainer.visible = false
	match index:
		0:
			for HBoxContainer in get_tree().get_nodes_in_group("skill"):
				HBoxContainer.visible = true
			string = "all skills"
		1:
			string = "Combat"
			for HBoxContainer in get_tree().get_nodes_in_group("cskill"):
				HBoxContainer.visible = true
		2:
			string = "Movement"
			for VBoxContainer in get_tree().get_nodes_in_group("mvskill"):
				VBoxContainer.visible = true
		3:
			string = "Defence"
			for VBoxContainer in get_tree().get_nodes_in_group("dskill"):
				VBoxContainer.visible = true
		4:
			string = "Healing"
			for VBoxContainer in get_tree().get_nodes_in_group("hskill"):
				VBoxContainer.visible = true
		5:
			string = "Mind"
			for VBoxContainer in get_tree().get_nodes_in_group("mskill"):
				VBoxContainer.visible = true
		6:
			string = "Body"
			for VBoxContainer in get_tree().get_nodes_in_group("bskill"):
				VBoxContainer.visible = true
		7:
			string = "Soul"
			for VBoxContainer in get_tree().get_nodes_in_group("sskill"):
				VBoxContainer.visible = true
		8:
			string = "Magic"
			for VBoxContainer in get_tree().get_nodes_in_group("mgcskill"):
				VBoxContainer.visible = true
		9:
			string = "General"
			for VBoxContainer in get_tree().get_nodes_in_group("gskill"):
				VBoxContainer.visible = true
		10:
			string = "Arts and Styles"
	$"Category name".text = string

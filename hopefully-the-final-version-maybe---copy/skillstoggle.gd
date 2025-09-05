extends Button

signal changeskills

func _pressed():
	$"../../../../..".visible = false
	$"../../../../../../fams_skills".visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("bskill"):
		if Global.BodySP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("cskill"):
		if Global.cSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("gskill"):
		if Global.gSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("dskill"):
		if Global.dSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("hskill"):
		if Global.hSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("mgcskill"):
		if Global.mSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("mskill"):
		if Global.MindSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("mvskill"):
		if Global.mvSP > 0:
			HBoxContainer.visible = true
	for HBoxContainer in get_tree().get_nodes_in_group("sskill"):
		if Global.SoulSP > 0:
			HBoxContainer.visible = true
	if Global.SP > 0:
		for button in get_tree().get_nodes_in_group("skilladd"):
			button.visible = true
	changeskills.emit()

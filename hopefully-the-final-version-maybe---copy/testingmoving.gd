extends HBoxContainer

@onready var other = $"Attained Skills/ScrollContainer/VBoxContainer"

func _deduct(skill):
	if skill.is_in_group("bskill") && Global.BodySP > 0:
		Global.BodySP -= 1
	elif skill.is_in_group("cskill") && Global.cSP > 0:
		Global.cSP -= 1
	elif skill.is_in_group("dskill") && Global.dSP > 0:
		Global.dSP -= 1
	elif skill.is_in_group("gskill") && Global.gSP >0:
		Global.gSP -=1
	elif skill.is_in_group("hskill") && Global.hSP >0:
		Global.hSP -= 1
	elif skill.is_in_group("mgcskill") && Global.mSP >0:
		Global.mSP -= 1
	elif skill.is_in_group("mskill") && Global.MindSP >0:
		Global.MindSP -= 1
	elif skill.is_in_group("mvskill") && Global.mvSP >0:
		Global.mvSP -= 1
	elif skill.is_in_group("sskill") && Global.SoulSP > 0:
		Global.SoulSP -= 1
	else:
		Global.SP -= 1
	if Global.SP < 1:
		for button in get_tree().get_nodes_in_group("skilladd"):
			button.visible = false

func _ready():
	for button in get_tree().get_nodes_in_group("skilladd"):
		button.pressed.connect(_on_apply_pressed.bind(button))
	$"../../NinePatchRect/VBoxContainer/HBoxContainer/VBoxContainer/savenload".connect("load_skills", Callable(self, "_on_load"))

var idforarray = []
var counter = 0

func _on_apply_pressed(button: Button):
	if counter == 0:
		idforarray.resize($skills/ScrollContainer/skills/VBoxContainer.get_children().size())
	counter += 1
	var parent = button.get_parent().get_parent()
	var whole = button.get_parent()
	var indexity = button.get_parent().get_parent().get_children().find(button.get_parent())
	idforarray[indexity] = 1
	print(parent)
	parent.remove_child(whole)
	other.add_child(whole)
	button.queue_free()
	_deduct(whole)

func _on_load(crazyid):
	for i in $skills/ScrollContainer/skills/VBoxContainer.get_children().size():
		if i == crazyid[i]:
			$skills/ScrollContainer/skills/VBoxContainer.remove_child($skills/ScrollContainer/skills/VBoxContainer.get_child(i))
			other.add_child($skills/ScrollContainer/skills/VBoxContainer.get_child(i))

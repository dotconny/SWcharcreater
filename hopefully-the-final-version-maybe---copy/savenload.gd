extends VBoxContainer
func _ready():
	$"../LV".savelv1.connect(savelv11)
	$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer".reset.connect(lv1load)

var savelv1 = "user://savelv1.save"
var packedsavelv1 = "user://save_scenelv1.tscn"
var skillsavelv1 = "user://saveskilllv1.json"
var save1 = "user://save.save"
var save2 = "user://save2.save"
var save3 = "user://save3.save"
var packedsave1 = "user://save_scene.tscn"
var packedsave2 = "user://save_scene2.tscn"
var packedsave3 = "user://save_scene2.tscn"
var skillsave1 = "user://saveskill.json"
var skillsave2 = "user://saveskill2.json"
var skillsave3 = "user://saveskill3.json"

var arr = ["HP","LVHP","LP","LVLP","BD","IPs","LV","Mind","Body","Soul","Hunteses_BD","ATK","ATK_b","Constructs","Undead","Fibrosian","extremophile","durable","empty","ghost_witch","Roughian","spring","cactus","moss","CC","mAP","bAP","sAP","SP","mSP","cSP","gSP","mvSP","dSP","hSP","MindSP","BodySP","SoulSP","DP","fam","exper","mas","Prime","anti_p","Mind_b","Body_b","Soul_b","old_h","copper","sub_ID","sub","lift","flight","intel","wis","prc","stl","prs","cha","str","ath","hlth","fth","mgc","life","effint","effwis","effprc","effstl","effprs","effcha","effstr","effath","effhlth","efffth","effmgc","efflife","atk_buff","move_i","range","reroll","fl_mana","temp_ip","res","weak","imm","fire_res","force_res","light_res","bleed_res","poison_res","faith_res","falling_res","drowning_res","burning_res","acid_res","ice_res","slash_res","leech_res","electric_res","necrotic_res","psychic_res","radiation_res","magic_res","dark_vis","heal_buff","shield_health","walk","swim","fly","jump","climb","melee","dodge","cs","wpn_buff","unarmoured_cc_b","light_cc_b","heavy_cc_b","atk_ex_buff","fist_atk_buff"]
var Ability: String

func _save(savenum, packedsave):
	var savearr: Array = []
	Ability = $"../../VBoxContainer2/ScrollContainer/Label".text
	for i in arr.size():
		savearr.append(Global.get(arr[i]))
		print(str(arr[i]))
		print(str(savearr[i]))
	var file = FileAccess.open(savenum,FileAccess.WRITE)
	file.store_var(savearr)
	file.store_var(Ability)
	var packed_scene := PackedScene.new()
	packed_scene.pack(get_tree().current_scene)
	ResourceSaver.save(packed_scene, packedsave)
	file.close()



func _load(savenum, packedsave):
	var savearr: Array = []
	if FileAccess.file_exists(savenum):
		var file = FileAccess.open(savenum, FileAccess.READ)
		savearr = file.get_var()
		$"../../VBoxContainer2/ScrollContainer/Label".text = file.get_var()
		for i in savearr.size():
			Global.set(arr[i],savearr[i])
	$"../Species/SpeciesOption".update()
	var new_scene = ResourceLoader.load(packedsave).instantiate()
	$"../../../../..".queue_free()
	get_tree().root.add_child(new_scene)
	


func save_tree(node: Node) -> Dictionary:
	var data: Dictionary = {
		"type": node.get_class(),
		"name": node.name,
		"properties": {},
		"children": [],
		"parent_path": "" 
	}
	if node.get_parent() != null:
		data["parent_path"] = node.get_parent().get_path() 
	for prop in node.get_property_list():
		if prop.usage & PROPERTY_USAGE_STORAGE:
			var value = node.get(prop.name)
			if value is Object and not (value is Resource):
				continue
			data["properties"][prop.name] = value
		for child in node.get_children():
			data["children"].append(save_tree(child))
	return data

func load_nodes(data: Dictionary, parent: Node = null) -> Node:
	var node = ClassDB.instantiate(data["type"])
	node.name = data["name"]
	for key in data["properties"]:
		node.set(key, data["properties"][key])
	for child_data in data["children"]:
		node.add_child(load_nodes(child_data))
	if parent != null:
		parent.add_child(node)
	return node

func load_attained_skills(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	if typeof(data) == TYPE_DICTIONARY:
		var parent = get_node("../../../../../fams_skills/HBoxContainer/Attained Skills")
		load_nodes(data, $"../../../../../fams_skills/HBoxContainer/Attained Skills")

func save_attained_skills(path):
	var file = FileAccess.open(path, FileAccess.WRITE)
	for HBoxContainer in $"../../../../../fams_skills/HBoxContainer/Attained Skills".get_children():
		file.store_string(JSON.stringify(save_tree(HBoxContainer)))

signal postsavelv1

#func load_attained_skills(path):
#	var file = FileAccess.open(path, FileAccess.READ)
#	if typeof(JSON.parse_string(file.get_as_text())) == TYPE_DICTIONARY:
#		var new_scene = load_tree(JSON.parse_string(file.get_as_text()))
#		get_tree().root.add_child(new_scene)
#		get_tree().current_scene.free()
#		get_tree().current_scene = new_scene

func _on_save_1_pressed() -> void:
	_save(save1, packedsave1)
	save_attained_skills("user://saveskilllv1.json")
	postsavelv1.emit()
	#Ability = $"../../VBoxContainer2/ScrollContainer/Label".text
	#for i in arr.size():
		#savearr.append(Global.get(arr[i]))
		#print(str(arr[i]))
		#print(str(savearr[i]))
	#var file = FileAccess.open(save1,FileAccess.WRITE)
	#file.store_var(savearr)
	#file.store_var(Ability)

func savelv11():
	_save(savelv1, packedsavelv1)
	save_attained_skills("user://saveskilllv1.json")

func lv1load():
	_load(savelv1, packedsavelv1)
	load_attained_skills("user://saveskilllv1.json")

func _on_save_2_pressed() -> void:
	_save(save2, packedsave2)


func _on_save_3_pressed() -> void:
	_save(save3, packedsave3)


func _on_load_1_pressed() -> void:
	_load(save1, packedsave1)
	load_attained_skills("user://saveskill.json")


func _on_load_2_pressed() -> void:
	_load(save2, packedsave2)


func _on_load_3_pressed() -> void:
	_load(save3, packedsave3)

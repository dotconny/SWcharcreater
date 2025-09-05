extends VBoxContainer

var save1 = "user://save.save"
var save2 = "user://save2.save"
var save3 = "user://save3.save"

var arr = ["HP","LVHP","LP","LVLP","BD","IPs","LV","Mind","Body","Soul","Hunteses_BD","ATK","ATK_b","Constructs","Undead","Fibrosian","extremophile","durable","empty","ghost_witch","Roughian","spring","cactus","moss","CC","mAP","bAP","sAP","SP","mSP","cSP","gSP","mvSP","dSP","hSP","MindSP","BodySP","SoulSP","DP","fam","exper","mas","Prime","anti_p","Mind_b","Body_b","Soul_b","old_h","copper","sub_ID","sub","lift","flight","intel","wis","prc","stl","prs","cha","str","ath","hlth","fth","mgc","life","effint","effwis","effprc","effstl","effprs","effcha","effstr","effath","effhlth","efffth","effmgc","efflife","atk_buff","move_i","range","reroll","fl_mana","temp_ip","res","weak","imm","fire_res","force_res","light_res","bleed_res","poison_res","faith_res","falling_res","drowning_res","burning_res","acid_res","ice_res","slash_res","leech_res","electric_res","necrotic_res","psychic_res","radiation_res","magic_res","dark_vis","heal_buff","shield_health","walk","swim","fly","jump","climb","melee","dodge","cs","wpn_buff","unarmoured_cc_b","light_cc_b","heavy_cc_b","atk_ex_buff","fist_atk_buff"]
var Ability: String

signal load_skills(idforstuff)
var crazyid = []

func _save(savenum):
	var savearr: Array = []
	Ability = $"../../ScrollContainer/Label".text
	for i in arr.size():
		savearr.append(Global.get(arr[i]))
		print(str(arr[i]))
		print(str(savearr[i]))
	var file = FileAccess.open(savenum,FileAccess.WRITE)
	file.store_var($"../../../../../fams_skills/HBoxContainer".idforarray)
	file.store_var(savearr)
	file.store_var(Ability)
	file.close()



func _load(savenum):
	var savearr: Array = []
	if FileAccess.file_exists(savenum):
		var file = FileAccess.open(savenum, FileAccess.READ)
		crazyid = file.get_var()
		savearr = file.get_var()
		$"../../ScrollContainer/Label".text = file.get_var()
		for i in savearr.size():
			Global.set(arr[i],savearr[i])
	$"../Species/SpeciesOption".update()
	emit_signal("load_skills", crazyid)

func _on_save_1_pressed() -> void:
	_save(save1)
	#Ability = $"../../ScrollContainer/Label".text
	#for i in arr.size():
		#savearr.append(Global.get(arr[i]))
		#print(str(arr[i]))
		#print(str(savearr[i]))
	#var file = FileAccess.open(save1,FileAccess.WRITE)
	#file.store_var(savearr)
	#file.store_var(Ability)

func _on_save_2_pressed() -> void:
	_save(save2)


func _on_save_3_pressed() -> void:
	_save(save3)


func _on_load_1_pressed() -> void:
	_load(save1)


func _on_load_2_pressed() -> void:
	_load(save2)


func _on_load_3_pressed() -> void:
	_load(save3)

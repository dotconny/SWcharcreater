extends Node


var HP = 10
var LVHP = 0
var LP = 5
var LVLP = 0
var BD = 3
var IPs = 3
var LV = 1
var Mind = 0
var Body = 0
var Soul = 0
var Hunteses_BD = 0
var ATK = 0
var ATK_b = 0
var Constructs = 0
var Undead = 0
var Fibrosian = 0
var extremophile = false
var durable = false
var empty = false
var ghost_witch = 0
var Roughian = false
var spring = 0
var cactus = false
var moss = false
var CC = 11
var mAP = 0
var bAP = 0
var sAP = 0
var SP = 0 #skill point
var mSP = 0 #magic skill point
var cSP = 0 #combat skill point
var gSP = 0 #general skill point
var mvSP = 0 #movement skill point
var dSP = 0 #defense skill point
var hSP = 0 #healing skill point
var MindSP = 0 #mind skill point
var BodySP = 0 #body skill point
var SoulSP = 0 #soul skill point
var DP = 0 #NOT double penetration, Detriment Points
var fam = 0
var exper = 0
var mas = 0
var Prime = 0
var anti_p = 0
var Mind_b = 0
var Body_b = 0
var Soul_b = 0
var old_h = 0
var copper = 200
var sub_ID
var sub = false
var lift = 0
var flight = false

var intel = 0
var wis = 0
var prc = 0
var stl = 0
var prs = 0
var cha = 0
var str = 0
var ath = 0
var hlth = 0
var fth = 0
var mgc = 0
var life = 0

var effint = 0
var effwis = 0
var effprc = 0
var effstl = 0
var effprs = 0
var effcha = 0
var effstr = 0
var effath = 0
var effhlth = 0
var efffth = 0
var effmgc = 0
var efflife = 0
var atk_buff
var move_i = 0
var range = 0
var reroll = 0
var fl_mana = 0
var temp_ip = 0

var res = 0
var weak = 0
var imm = 0

var fire_res = 0
var force_res = 0
var light_res = 0
var bleed_res = 0
var poison_res = 0
var faith_res = 0
var falling_res = 0
var drowning_res = 0
var burning_res = 0
var acid_res = 0
var ice_res = 0
var slash_res = 0
var leech_res = 0
var electric_res = 0
var necrotic_res = 0
var psychic_res = 0
var radiation_res = 0
var magic_res = 0

var dark_vis = 0

var heal_buff = 0
var shield_health = 0
var walk = 10
var swim = 5
var fly = 0
var jump = 5
var climb = 5
var melee = 1
var dodge = 0
var cs = 0
var wpn_buff = 0
var unarmoured_cc_b = 0
var light_cc_b = 0
var heavy_cc_b = 0
# implement these l8er

var atk_ex_buff = 0
var fist_atk_buff = 0

func the_variable():
	var ALL_OF_THEM = [Global.intel, Global.wis, Global.prc, Global.stl, Global.prs, Global.cha, Global.str, Global.ath, Global.hlth, Global.fth, Global.mgc, Global.life]
	ALL_OF_THEM.sort()
	ALL_OF_THEM.reverse()
	atk_buff = 0
	for i in range(1, ALL_OF_THEM.size(), 2):
		atk_buff += ALL_OF_THEM[i]/2
	ATK = atk_buff + atk_ex_buff


@warning_ignore("unused_signal")
signal score_changed(AP)
signal resistance()
signal complete_update()
signal unarmour()
signal light_ar()
signal heavy_ar()

var AP := 0:
	set(value):
		AP = value
		emit_signal("score_changed", value)


#func _update_APs():
	#$NinePatchRect/VBoxContainer/stats/Mind/int/Num.text = str(Global.effint)
	#$NinePatchRect/VBoxContainer/stats/Mind/wis/Num.text = str(Global.effwis)
	#$NinePatchRect/VBoxContainer/stats/Mind/prc/Num.text = str(Global.effprc)
	#$NinePatchRect/VBoxContainer/stats/Mind/stl/Num.text = str(Global.effstl)
	#$NinePatchRect/VBoxContainer/stats/Mind/prs/Num.text = str(Global.effprs)
	#$NinePatchRect/VBoxContainer/stats/Mind/cha/Num.text = str(Global.effcha)
	#$NinePatchRect/VBoxContainer/stats/Body/str/Num.text = str(Global.effstr)
	#$NinePatchRect/VBoxContainer/stats/Body/ath/Num.text = str(Global.effath)
	#$NinePatchRect/VBoxContainer/stats/Body/hlth/Num.text = str(Global.effhlth)
	#$NinePatchRect/VBoxContainer/stats/Soul/fth/Num.text = str(Global.efffth)
	#$NinePatchRect/VBoxContainer/stats/Soul/mgc/Num.text = str(Global.effmgc)
	#$NinePatchRect/VBoxContainer/stats/Soul/life/Num.text = str(Global.efflife)

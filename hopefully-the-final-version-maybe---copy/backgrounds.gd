extends HBoxContainer

var num = 1

func _ready():
	var options = ["","Peaceful Living", "Drifter", "Broken", "Pampered","Roughian","Faithful","Betrayed","Studious","Specialist","Animal Friendly","Trained Fighter","Streetliving","Criminal","Law Keeper", "Revolutionary","Sportsman","Artiste","Royalty","Military Man","The Charmer","Hermit","Healer","Woodswalker","Vengeful","Scaredy Cat","Descendant","Innocent"]
	for items in options:
		$Backgrounds.add_item(items)

func _on_backrgounds_item_selected(index):
	num -= 1
	if num == 0:
		$Backgrounds.disabled = true
	match index:
		0:
			pass
		1:
			Global.gSP += 1
			Global.effhlth += 2
			Global.efffth += 1
			Global.copper += 800
		2:
			Global.SP += 2
			Global.Body += 1
			Global.AP += 1
		3:
			Global.SP += 2
			Global.efflife += 2
			Global.effstr += 1
			var string = "Sleep with one eye open: You are immune to magical sleep."
			$"../../ScrollContainer".ability(string)
		4:
			Global.copper += 6800
			Global.effint += 2
			Global.effwis += 1
		5:
			Global.atk_ex_buff += 1
			Global.Roughian = true
			#add I'm still standing l8r
			Global.effprc += 2
			Global.effprs += 1
		6:
			Global.efffth += 2
			Global.effmgc += 1
			#add skills
		7:
			Global.effprc += 3
			Global.SP += 2
		8:
			Global.effint += 2
			Global.effwis += 1
			Global.MindSP += 2
			Global.SP += 1
		9:
			#add expertise
			Global.Mind += 1
			Global.effath += 1
			Global.CC += 1
		10:
			Global.hSP += 1
			Global.effstr += 1
			Global.effhlth += 1
			Global.effwis += 1
		11:
			Global.effstr += 2
			Global.efflife +=1
			#some ability? check availability with dev
		12:
			Global.SP += 2
			Global.effhlth += 1
			Global.effprs += 2
		13:
			Global.cSP += 1
			Global.MindSP += 1
			$criminal.visible = true
			Global.fam += 1
			Global.effstl += 2
			Global.effprs += 1
			var str = "I Know A Guy: You seem to know a guy in every town and city you visit, a wealth of connections seems to follow you as you go."
			$"../../ScrollContainer".ability(str)
		14:
			Global.effprs += 3
			var string = "Law Speak: Law Speak allows you to overwhelm commoners with your knowledge of local or non local law. And most people wouldn't even be smart enough to know if you’re making stuff up. You could use this to argue your way into a building or get people out of a crime scene quickly or maybe even threaten a barkeep to give you free drinks."
			$"../../ScrollContainer".ability(string)
		15:
			Global.cSP += 1
			Global.mvSP += 1
			Global.gSP += 1
			Global.effcha += 2
			Global.efffth += 1
		16:
			Global.CC += 2
			Global.effstr += 1
			Global.effath += 1
			Global.effhlth += 1
		17:
			Global.effcha += 1
			Global.efflife += 1
			Global.efffth += 1
			Global.MindSP += 1
			Global.SoulSP += 1
		18:
			Global.copper += 9800
			Global.SP += 1
			Global.effwis -= 2
			Global.effint += 1
			Global.effprs += 2
			Global.effcha += 1
		19:
			Global.cSP += 2
			Global.effath += 2
			Global.effstr += 1
		20:
			Global.effcha += 3
			Global.CC += 1
			var string = "You Owe Me: You’re a charmer and it shows but your trouble seems to follow you, turns out you owe a lot more people than you thought and they don’t take kindly to I.O.U’s.. for the fourth time."
			$"../../ScrollContainer".ability(string)
		21:
			Global.hSP += 1
			Global.effhlth += 2
			Global.effwis += 4
			#-4 conv rolls, implement l8r
		22:
			Global.hSP += 3
			Global.effhlth += 2
			Global.effwis += 1
		23:
			Global.HP += 20
			Global.LP += 10
			Global.effmgc += 4
			Global.poison_res += 1
			Global.effcha -= 2
		24:
			Global.atk_ex_buff += 2
			Global.BD += 1
			Global.effprs += 2
			Global.effprc += 1
		25:
			Global.effprc += 1
			#fam with positioning
			Global.effstl += 1
			Global.effath += 1
			Global.cs += 2
		26:
			Global.efffth += 3
			Global.BD += 2
			Global.mSP += 1
		27:
			Global.effcha += 1
			Global.effprs += 1
			Global.effath += 1
			Global.cs -= 2
			Global.gSP += 2
	$"../Species/SpeciesOption"._update_APs()
	Global.the_variable()
	$"../ATK/Label2".text = str(Global.ATK)


func _on_criminal_item_selected(index):
	match index:
		0:
			pass
		1:
			Global.copper += 1500
	$criminal.disabled = true
	Global.complete_update.emit()

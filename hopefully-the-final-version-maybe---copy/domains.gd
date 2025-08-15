extends HBoxContainer

var ID 
var sub_ID
var string
var num = 2
var press = 0
var potplv5

func _ready():
	var warrior = ["","Lightfoot","Sweeping Foes","Retreat & Safety","Longshot","Helper","Brutal Close Quarters","Clash","Shield Charger","Tactician","Warlord","General"]
	for item in warrior:
		$Talents.add_item(item)
	for optionbutton in get_tree().get_nodes_in_group("lvoption"):
		optionbutton.item_selected.connect(on)

func on(_index):
	$"../LV/Increase".disabled = false


func opt():
	$"../LV/Increase".disabled = true

var sub = []

func _on_domain_option_item_selected(index):
	$DomainOption.disabled = true
	ID = index
	match index:
		0:
			Global.cSP += 2
			Global.fam += 1
			string = "Ability: Warriors Spirit - Roll against a 15 Charisma check, if you succeed you may spend 1 IP to heal equal to your Base Damage once per turn.

Ability: Parry - If you have a reaction and an enemy attacks you with a melee attack you can make a base roll with a check of 15, if you succeed you take 0 damage and get 1 free attack to the enemy."
			$"../../ScrollContainer".ability(string)
		1:
			Global.effstl += 1
			Global.walk += 10
			Global.fam += 1
			string = "Passive: Silent Footsteps - If you have not attacked an enemy yet on your turn then all your stealth checks and challenges are rolled with Rigged dice.

Upgrade: Sneaky - If you are sneaking you gain a +5 to all stealth rolls instead of +3.

Passive: Surprise Strike - If the target is unaware of your presence your first attack against them does not count towards your normal IP counter, giving you a free IP at the beginning of a round.

Choice: Assassin’s Failure - You messed up once before, you’re not going to mess it up again: "
			$"betrayal assassin".visible = true
	$"../Species/SpeciesOption".update()
	$"../LV/Increase".disabled = false

#ABOVE IS LV1

#BELOW IS MAINTREE

func _on_increase_pressed():
	if !Global.sub:
		match ID:
			0:
				match num:
					2:
						Global.SP +=1
						Global.AP += 1
						$Talents.visible = true
						opt()
					3:
						Global.AP += 1
						$subclass.visible = true
						opt()
						var sub_w = ["path of the killer","path of the protector","path of the undying","path of the commander"]
						for thing in sub_w:
							$subclass.add_item(thing)
					4:
						var strat = ["","Slam","Polearm Master","Ranged Ricochete","Unarmed Combatant"]
						for thing in strat:
							$lv4warrior.add_item(thing)
						$lv4warrior.visible = true
						opt()
					5:
						Global.AP += 1
						Global.fam += 1
						Global.SP += 1
						var old = "Ability: Fury - Fury is a special resource you get as a warrior's spirit, you get 3"
						var new = "Ability: Fury (II) - Fury is a special resource you get as a warrior's spirit, you get 4"
						$"../../ScrollContainer".new_splice(old, new)
						var lv5 = ["","Wild Swing","Deadly Cut","Barbaric Slugger","Distant Snipe","Pure Rage"]
						for thing in lv5:
							$lv5warrior.add_item(thing)
						$v4warrior.visible = true
						opt()
					6:
						$lv61.visible = true
						$lv62.visible = true
						opt()
						string = "Passive: Understanding - You can add your Attack Roll Bonus to any Check where you have less than 2 AP placed into that attribute."
						$"../../ScrollContainer".ability(string)
					7:
						string = "Passive: Punish - If an enemy misses a melee attack, once per round, you get a free reaction and can attack the enemy."
						$"../../ScrollContainer".ability(string)
					8:
						Global.AP += 2
						Global.SP += 1
						Global.walk += 3
						string = "Upgrade: Furious Tactics - You can spend 1 Fury to give an ally a reaction even if they did not save an IP last round."
						$"../../ScrollContainer".ability(string)
					9:
						string = "Passive: Battle Rage - When an ally drops to 0 Health you can add their BD to your attack damage on the next two successful attacks."
					10:
						var old = "Ability: Fury - Fury is a special resource you get as a warrior's spirit, you get 4"
						var new = "Ability: Fury - Fury is a special resource you get as a warrior's spirit, you get 5"
						$"../../ScrollContainer".new_splice(old, new)
						$Talents.visible = true
						$LV10.visible = true
						var lv10 = ["","Cut Through","Multi Shot","Shield Crush"]
						for item in lv10:
							$LV10.add_item(item)
						opt()
						var lv10c = ["","Combat Skill","+1 Expertise"]
						for item in lv10c:
							$LV10CC.add_item(item)
	else:
		match sub_ID:
			1:
				match num:
					4:
						string = "Passive: Deathstalk - You can track a target you personally injured for up to an hour.\n\nPassive: No Escaping - You can no longer be deceived on whether something is living or not. Undead or not you can tell if it is alive yet pretending or perhaps in stasis."
						$"../../ScrollContainer".ability(string)
						Global.atk_ex_buff += 3
						Global.HP -= 5
						Global.cSP += 1
						$"../../..".doit()
					5:
						Global.BD += 10
						Global.CC += 1
						Global.LP -= 10
						var killlv5 = ["","Huntsmen","Feast","Beast Hunter","Brute Force"]
						for item in killlv5:
							$potklv5.add_item(item)
					6:
						Global.HP -= 10
						Global.LP -= 10
						string = "Passive: Victorious Bliss - When ending a combat encounter if you are not on 0 health, heal 15. At 15th level this heals you 50."
						$"../../ScrollContainer".ability(string)
					7:
						Global.LP -= 5
						Global.HP -= 5
						Global.SP += 1
						Global.BD += 20
						Global.fam += 1
					8:
						Global.HP -= 10
						Global.LP -= 5
						Global.cs += 1
						opt()
						$potklv8.visible = true
					9:
						Global.CC += 1
						Global.HP -= 5
						Global.res += 1
						string = "Passive: Swing Back - when you miss an attack roll you can reroll it, if you hit the rerolled attack it only deals half your damage."
						$"../../ScrollContainer".ability(string)
					10:
						Global.BD += 40
			2:
				match num:
					4:
						Global.HP += 50
						string = "Passive: Preservation - By standing still for 30 seconds you begin to heal 40 health a turn. Turns into 80 at level 10, 160 at level 15, 320 at level 20, 640 at level 25, 1280 at level 30."
						$"../../ScrollContainer".ability(string)
					5:
						Global.HP += 25
						potplv5 = ["","Diamond Skin","An Oath Remains","Brick Wall"]
						for item in potplv5:
							$potplv5.add_item(item)
						opt()
					6:
						string = "Ability: Shielding - if an ally is within Level x 3 Metres of you redirect all damage they take towards you."
						$"../../ScrollContainer".ability(string)
					7:
						Global.CC += 5
						Global.HP += 100
						string = "Ability: Selfless Hero’s Duty - Costing 1 IP to cast, makes all beings hostile towards allies make a perception check against your CC. if failed or poor, they will become immediately hostile towards the Guardian and prioritise them over other adversaries. At level 15, this becomes a roll against your CC + your level. At level 20, this becomes Guaranteed."
						$"../../ScrollContainer".ability(string)
					8:
						string = "Passive: Harsh Stomach - Resistant to poison and necrotic damage. At level 20 become immune."
						$"../../ScrollContainer".ability(string)
					9:
						Global.CC += 2
						Global.LP += 100
						Global.IPs += 1
						Global.SP += 2
					10:
						$potplv10.visible = true
						opt()
					11:
						Global.fam += 2
						Global.HP += 75
						string = "Passive: Bastion of Warmth - if your allies are within 3 metres of you they are resistant to cold damage. At level 15 they become immune."
						$"../../ScrollContainer".ability(string)
						match potplv5: #updates ability
							1:
								var old = "Upgrade: Diamond Skin - Resistant to piercing/slashing damage and at 11th level you become immune to bleeding."
								var new = "Upgrade: Diamond Skin (II) - Resistant to piercing/slashing damage and immune to bleeding."
								$"../../ScrollContainer".new_splice(old, new)
							2:
								var old = "Passive: Bastion of Warmth - if your allies are within 3 metres of you they are resistant to cold damage. At level 15 they become immune."
								var new = "Passive: Bastion of Warmth (II) - if your allies are within 3 metres of you they are immune to cold damage."
								$"../../ScrollContainer".new_splice(old, new)
							3:
								pass
					20:
						var old = "Passive: Harsh Stomach - Resistant to poison and necrotic damage. At level 20 become immune."
						var new = "Passive: Harsh Stomach (II) - Immune to poison and necrotic damage"
						string = "Passive: Retribution - the first time your allies are injured a day deal your base damage x5 to the creature that injured them as long as they are within 200 metres. Refreshes at the end of the day. Burning their Soul from the inside out."
						Global.HP += 400
						$"../../ScrollContainer".ability(string)
						$"../../ScrollContainer".new_splice(old, new)
	num += 1
	$"../Species/SpeciesOption".update()

func _on_betrayal_assassin_item_selected(index):
	$"betrayal assassin".visible = false
	match index:
		0:
			Global.poison_res += 1
			string += "Betrayed Once Before: Poison Resistance"
		1:
			Global.Body += 1
			string += "I Had to Rely on Myself: +1 to Body"
		2:
			Global.effint += 2
			string += "They Outsmarted Me: +2 Intelligence"
		3:
			Global.SP += 1
			string += "I Was Outplayed: +1 Skill"
	$"../../ScrollContainer".ability(string)
	$"../Species/SpeciesOption".update()

func _on_talents_item_selected(index):
	match index:
		1:
			string = "Lightfoot: +10m Walking Speed, +2 in Athletics, +2 CC when not wearing armour."
			$"../CC".cc_b += 2
			Global.walk += 10
			Global.effath += 2
		2:
			string = "Sweeping Foes: All weapons can hit 1 + (Your Body Bonus) foes if they are within range, however all hit enemies take half damage instead."
		3:
			string = "Retreat & Safety: when hitting an opponent you can move up to 5m backwards for free."
		4:
			string = "Longshot: +10m range to all projectiles, +1 Combat Speed, Spend 1 extra IP to guarantee a ranged attack."
		5:
			string = "Helper: When landing a Great on an enemy, said enemies CC lowers by 1. This can also stack, just not on the same turn."
		6:
			string = "Brutal Close Quarters: Get a +Body Bonus to all damage when using fist or dagger like weapons."
		7:
			string = "Clash: If an enemy gets a reaction from you attacking them roll Strength, if you succeed they fail to get their reaction off and you get a guaranteed crit."
		8:
			string = "Shield Charger: When sprinting you can spend 1 IP to knock down any creature not 1m taller than you if they are within 2m of you and you are carrying a shield, While holding a shield all non magical projectile attacks deal half damage."
		9:
			string = "Tactician: If you attack an enemy your ally just attacked they take 5 more damage and suffer a status of some kind. If there are 2 or more allies within 4m of you, your CC is +2."
		10:
			string = "Warlord: When full spending to guarantee an attack, the attack becomes a great. +1 CC when wearing armour."
		11:
			string = "General: When an ally gives you a reaction, you can spend 3 IP instead of 2."
			#add functionality of armours cc l8r
	$Talents.visible = false
	$"../../ScrollContainer".ability(string)
	$"../Species/SpeciesOption".update()

func _on_subclass_item_selected(index):
	sub_ID = index
	match index:
		0:
			$subclass.visible = false
			string = "Ability: Fury - Fury is a special resource you get as a warrior's spirit, you get 3 Fury at the start of combat that can be spent to gain a free bonus attack that costs no IP to use, you gain more Fury as you level up"
			Global.SP += 2
		1:
			string = "Path of the Killer - You have given up on mercy, you are focused entirely on killing and being efficient at it. Slaughter until it is done, and leave no one behind.\n\nBecome Unable to Attack More Than Once a Turn.
Become Unable to Heal Others.
Become Entirely Unable to Use Spells.
Become Unable to Grant Reactions.
Become Resistant to Being Healed.
Become Only Capable of Applying BD Once per Round.\n\nPassive: Weak Point - Everytime you hit an enemy you get a +1 to hit the next attack against them, this resets when you hit another enemy or are knocked to 0 Health.\n\nPassive: Tooth and Nail - Gain a +2 to hit enemies when you’re on 0 Health."
			Global.BD += 30
			$"../BD/special".text = "ATK IS ONCE PER TURN"
			Global.sub = true
		2:
			string = "Path of the Protector - Your reason to become a warrior is to protect those around you, to fight is to save, to kill is to protect. You do not relish the war but you know it is needed.
All APs in Health heighten your HP by 2x the original amount\n\nAbility: Protective Measure - When given a reaction you can walk over and protect any ally in a 10 metre radius from damage from the next attack all for 1 IP.\n\nAbility: Shield Bash - When equipped with a shield if an enemy is within 3 metres of you, knock them back 10 metres with a shield bash, it costs 1 IP and deals half your BD."
			Global.HP += 100
			Global.CC += 3
			Global.sub = true
			#fam
		3:
			string = "Path of the Undying - You fight for yourself and yourself alone, you will take down titans and undying beasts of many legends and you will remain standing throughout war and hell.\n\nAbility: Adrenaline - You get 3 uses of Adrenaline per long rest. When using an Adrenaline you gain your level x 10 in Temp Health and remove all current levels of exhaustion.\n\nAbility: Undying Flask - Once per day you can drink from a glowing flask that heals you for your Faith Bonus x 10. Gain one more usage every fifth level."
			Global.HP += 30
			Global.CC += 1
			Global.sub = true
		4:
			Global.HP += 10
			Global.cs += 5
			Global.sub = true
			string = "Ability: War Cry! - You can now shout out war cries, allowing you to give your allies orders which give them buffs if they follow after you:

Attack Cry - If your allies only attack on their turn they gain a +3 to hit.
Defence Cry - If your allies defend on their turn they get a +15 to their shield health.
Retreat Cry - If your allies move on their turn they gain a +10 to their movement.
Recover Cry - If your allies heal on their turn, they heal a bonus +20 health.

You can only use 1 cry a turn.

Passive: Imposing - You gain familiarity with all Persuasion/Intimidation based weapons.

Passive: Commanders Presence - You can now add half your Intimidation Bonus to your BD."
	$"../../ScrollContainer".ability(string)
	$"../Species/SpeciesOption".update()

func _on_lv_4_warrior_item_selected(index):
	match index:
		1:
			string = "Ability: Slam - If you succeed on a strength challenge against an enemy within 1m of you and less than double your size you can throw them prone."
		2:
			string = "Ability: Polearm Master - If using a melee weapon with a range of 2m or more you can use a reaction to attack any enemy that walks in or past your range. If you land a hit, pause the hit enemies movement so they will have to spend 1 IP to start moving again."
		3:
			string = "Ability: Ranged Ricochete - If you roll a great on a ranged attack you can hit up to two extra targets for regular damage."
		4:
			string = "Ability: Unarmed Combatant - While using unarmed attacks you deal bonus damage equal to your level. If all your attacks in one turn are unarmed based, gain a bonus free unarmed attack."
	$"../../ScrollContainer".ability(string)
	$lv4warrior.visible = false

func _on_lv_5_warrior_item_selected(index):
	match index:
		1:
			string = "Ability: Wild Swing - Add your level onto the damage of the next three attacks at the cost of a -2 to hit said attacks. (Level 5 = +5 Damage)"
		2:
			string = "Ability: Deadly Cut - if you land a great roll on an attack check the attack will now apply Bleeding (1) to the target."
		3:
			string = "Ability: Barbaric Slugger - if your weapon of choice is a force weapon gain a +1 to hit."
		4:
			string = "Ability: Distant Snipe - if your weapon of choice is a ranged weapon add 20 metres to its range."
		5:
			string = "Ability: Pure Rage - You can spend 1 Fury to rage through an attack, bringing its damage total down to 0."
	$"../../ScrollContainer".ability(string)
	$lv5warrior.visible = false

func _on_lv_61_item_selected(index):
	match index:
		0:
			Global.CC += 1
		1:
			Global.cs += 1
	$"../Species/SpeciesOption".update()
	$lv61.visible = false

func _on_lv_62_item_selected(index):
	match index:
		0:
			Global.atk_ex_buff += 1
			$"../../..".doit()
		1:
			Global.BD += 1
	$"../Species/SpeciesOption".update()
	$lv62.visible = false

func _on_lv_10_item_selected(index):
	match index:
		0:
			string = "Ability: Cut Through - When landing a Great Hit with a bladed weapon you can also move half your movement speed in the same Interaction."
		2:
			string = "Ability: Multi Shot - You can fire 2 projectiles for 1 IP however you take a -1 to Hit, you can't have multiple targets. At level 15 this becomes 3 projectiles with no debuff. At level 20 this allows you to target 3 individual creatures."
		3:
			string = "Ability: Shield Crush - If using a 2 Handed weapon, Great Hits tear shields away from your foes automatically."
	$LV10.visible = false
	$"../../ScrollContainer".ability(string)

func _on_lv_10cc_item_selected(index):
	match index:
		1:
			Global.cSP +=1
		2:
			Global.exper += 1
	$LV10CC.visible = false

func _on_potklv_5_item_selected(index):
	match index:
		1:
			string = "Ability: Huntsmen - At the start of a combat encounter choose 1 target. You deal double damage to that target and half damage to all others. Once that target is dead you cannot choose a new one. At 14th level you are able to change your target twice per combat encounter."
		2:
			string = "Ability: Feast - When injuring an opponent with a melee attack you can spend 1 IP heal yourself equal to your Health Bonus x 2 three times per long rest. At 15th level this becomes a free Interaction 5 times per long rest and at 25th level this becomes x5 your Health Bonus."
		3:
			string = "Ability: Beast Hunter - Deal double damage to beast or monster type targets and half damage to others. Become able to freely track monsters at 12th level."
		4:
			string = "Ability: Brute Force - Three times per long rest you can change a failed attack roll into a successful attack roll. This becomes once per round at 13th level."
	$potklv5.visible = false
	$"../../ScrollContainer".ability(string)

func _on_potklv_8_item_selected(index):
	match index:
		0:
			string = "Passive: Night Hunter - Gain 30 metres of night vision and have no natural debuffs at night. You gain a +2 to all rolls at night or in very dark areas."
		1:
			string = "Upgrade: Morning Stalker - Short rest becomes an hour, long rest becomes 5 hours. You gain a +1 In Combat Speed."
	$potklv8.visible = false
	$"../../ScrollContainer".ability(string)

func _on_potklv_10_item_selected(index):
	match index:
		0:
			string = "Ability: Stunning Strike - when landing a melee hit you can spend 1 IP to make it stun the opponent."
		1:
			string = "Upgrade: Unseen Force - gain a +8 to stealth while using a ranged weapon."
		2:
			string = "Ability: Deadly Distraction - Spend IP to make any target within sight fail their next check automatically."
	$"../../ScrollContainer".ability(string)
	$potklv10.visible = false

func _on_potplv_5_item_selected(index):
	potplv5 = index
	match index:
		1:
			string = "Upgrade: Diamond Skin - Resistant to piercing/slashing damage and at 11th level you become immune to bleeding."
		2:
			string = "Passive: An Oath Remains - Everytime an ally of yours is knocked to 0 Health gain a +1 to hit. At 11th level it becomes a +2."
		3:
			string = "Ability: Brick Wall - Once per combat encounter add a +2 to your CC for a round, can be used as a reaction."
	$potplv5.visible = false
	$"../../ScrollContainer".ability(string)

func _on_potplv_10_item_selected(index):
	match index:
		1:
			string = "Passive: Protectors Roar - all foes in a 30 metre radius with lower Health become afraid of you. Your allies also gain a +3  to all their rolls next turn."
		2:
			string = "Passive: You Shall Not Pass - Become immune to shoves and pushes unless they roll 15 higher than your CC."
	$potplv10.visible = false
	$"../../ScrollContainer".ability(string)

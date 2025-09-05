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
			$"../../VBoxContainer2/ScrollContainer".ability(string)
		1:
			Global.effstl += 1
			Global.walk += 10
			Global.fam += 1
			string = "Passive: Silent Footsteps - If you have not attacked an enemy yet on your turn then all your stealth checks and challenges are rolled with Rigged dice.

Upgrade: Sneaky - If you are sneaking you gain a +5 to all stealth rolls instead of +3.

Passive: Surprise Strike - If the target is unaware of your presence your first attack against them does not count towards your normal IP counter, giving you a free IP at the beginning of a round.

Choice: Assassin’s Failure - You messed up once before, you’re not going to mess it up again: "
			$"betrayal assassin".visible = true
			$"../../VBoxContainer2/ScrollContainer".ability(string)
		2:
			Global.AP += 1
			string = "Ability: Corrupt - when touching an item or object smaller than half your size you can “Corrupt” said object, granting them a magical effect based on a roll of a d8. The results can be seen on the graph inside the other page, click on 'IT'S GAMBLING TIME' in order to access it."
			$"../../VBoxContainer2/ScrollContainer".ability(string)
			string = "Ability: Burning Touch - Deal your BD + 5 damage in Necrotic damage if you are able to physically touch your opponents skin."
			$"../../VBoxContainer2/ScrollContainer".ability(string)
			$"../../VBoxContainer2/Button".visible = true
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
						$subclasswarrior.visible = true
						opt()
						var sub_w = ["path of the killer","path of the protector","path of the undying","path of the commander"]
						for thing in sub_w:
							$subclasswarrior.add_item(thing)
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
						$"../../VBoxContainer2/ScrollContainer".new_splice(old, new)
						var lv5 = ["","Wild Swing","Deadly Cut","Barbaric Slugger","Distant Snipe","Pure Rage"]
						for thing in lv5:
							$lv5warrior.add_item(thing)
						$lv4warrior.visible = true
						opt()
					6:
						$lv61.visible = true
						$lv62.visible = true
						opt()
						string = "Passive: Understanding - You can add your Attack Roll Bonus to any Check where you have less than 2 AP placed into that attribute."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						string = "Passive: Punish - If an enemy misses a melee attack, once per round, you get a free reaction and can attack the enemy."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						Global.AP += 2
						Global.SP += 1
						Global.walk += 3
						string = "Upgrade: Furious Tactics - You can spend 1 Fury to give an ally a reaction even if they did not save an IP last round."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						string = "Passive: Battle Rage - When an ally drops to 0 Health you can add their BD to your attack damage on the next two successful attacks."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						var old = "Ability: Fury - Fury is a special resource you get as a warrior's spirit, you get 4"
						var new = "Ability: Fury - Fury is a special resource you get as a warrior's spirit, you get 5"
						$"../../VBoxContainer2/ScrollContainer".new_splice(old, new)
						$Talents.visible = true
						$LV10.visible = true
						var lv10 = ["","Cut Through","Multi Shot","Shield Crush"]
						for item in lv10:
							$LV10.add_item(item)
						opt()
						var lv10c = ["","Combat Skill","+1 Expertise"]
						for item in lv10c:
							$LV10CC.add_item(item)
			1:
				match num:
					2:
						Global.SP += 1
						Global.sneak_buff += 5
						string = "Passive: Replacement - When wearing the clothes of your victims gain a +3 to all Deception and Charming rolls.

Ability: Imbue with Killing Intent - When attacking an enemy you can spend 1 extra IP to imbue it with a condition of your choosing:

Sharpened: Apply Bleed (1) on hit.
Poisoned: Apply 3 Poison (1) Damage on hit, damage stacks with each activation of poisoned on the same enemy, level stays at one.
Toxic: Apply the Stunned status to a creature you hit, if you hit that creature a second time with the toxic condition on your weapon they become Paralysed as well.
Hacking: Makes enemies have a Bleed (3) on Greats.
Psychedelic: Apply Dizzy on hit until the end of their next turn.

Imbuements vanish after hitting an enemy, needing to be reapplied with 1 IP afterwards.

Passive: Open Target - If the target does not currently know your location their CC is lowered by 2 when you roll to hit."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					3:
						$subclassassassin.visible = true
						opt()
					4:
						Global.SP += 1
						Global.AP += 1
						Global.CC +=1
						string = "Upgrade: All in the Wrist - You can use your Athletics Bonus instead of your Int Bonus when using long ranged and projectile attacks.

Ability: Grapple (Hook) - You gain a small grapple, this allows you to scale up walls or descend safely from buildings. Its range is 5 metres and it's an intelligence check of 14 to use, moving you equal to the grapples range in 1 IP. 
You can also use 2 IP to try and pull in enemies, although you have to pass 2 checks: An Intelligence Check to hit and a Strength Check to pull them in.

Ability: Smokescreen - You can spend 2 IP to form a smoke bomb in combat and can make up to 3 outside of combat. Smoke Bombs are a free interaction to use and automatically make you hidden from all entities with non magical sight.

Upgrade: Disappear Without A Trace - If you beat an enemy in a Stealth vs Perception Challenge, roll Sabotage Dice if you have attacked them or with regular die if you have attacked them but are currently out of their line of sight, you become stealthed once more."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						Global.BD += 2
						Global.fam += 1
						string = "Choice: Assassin's Toolkit - In your line of assassinry you’ve grown and learned a lot about your abilities and skills and have developed even more tools and skills, choose 2 from the following list:"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$lv5assassin.visible = true
						opt()
					6:
						Global.AP += 2
						string = "Upgrade: Deadly Take Down - If you attack an enemy while stealthed you automatically deal double the damage and if you roll a success or higher that first attack still becomes a free interaction.

Upgrade: Longer Grapple (Hooks) - Your grapple now has a range of 10m."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						Global.sneak_buff += 5
						Global.climb += 5
						string = "Ability: Don’t Even Try - If an enemy within 5m of you is trying to stand up this triggers your reaction and as a reaction you can completely prevent them from doing so and deal your BD in Force."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						opt()
						string = "Choice: Assassins Alignment - Your assassin has been around the block long enough to know which jobs to take and which to spit on. What does this really say about you? How has it shaped you?"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						Global.CC += 1
						Global.SP += 1
						Global.exper += 1
						string = "Upgrade: Grapple (Hook) Advancement - Your grapples range is now 15m.

Upgrade: Violent Combo - If you pull an enemy towards you with a grapple you can attack on the same IP, rolling Rigged to hit."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						string = "Passive: I See You - You can now detect and see invisible or stealthed creatures if they are within 2m of you.

Passive: Not Falling For My Own Tricks - You now cannot be hit on an enemy's surprise round.

Ability: Assassins Disengage - If an enemy is within 2m of you, you can disengage, by spending 1 IP you knock them back 3 more metres and you can move equal to your walking speed + 5m."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						Global.IPs += 1
						Global.SP += 1
						Global.AP += 2
						string = "Upgrade: Undetectable - Once stealthed, opponents both in and out of combat have to roll a Perception Check of 10 + Your Stealth Bonus to see you. You no longer need to roll stealth unless you’ve been spotted or have attacked an enemy and want to hide again.

Upgrade: Silent Killer - If you attack an enemy while stealthed, roll Rigged."
				$"../../VBoxContainer2/ScrollContainer".ability(string)
			2:
				match num:
					2:
						Global.SP += 1
						string = "Ability: Destabilise - 3 times per short rest you can take a spell that is targeting you and destabilise it, corrupting it beyond recognition and nullifying its effects on you."
						Global.AP += 2
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					3:
						string = "Ability: Decaying Blast - You strike the air with your fist and the very air around you begins to shake violently. Roll 3d6 and take its effects as follows in the gambling page"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 2/Button".disabled = false
					4:
						Global.HP += 10
						Global.CC += 1
						string = "Ability: Corrupt Body - You become resistant to one type of damage which you can swap everytime you cast a spell. However you also have one damage type you are weak to which the DM can swap at the same time. If the DM and Player choose the same damage type no benefit or debuff is applied and it's cancelled out."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						string = "Ability: Deconstructive Healing - Your body seems to crack and break as you activate this ability, roll 2d4 and take the following results in the gambling page"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 3/Button".disabled = false
						string = "Ability: Luck of the Draw - The echoing crackling static behind the universe calls to you.. You draw yourself 1-3 cards at any time. Roll 1d12 (per card) and check the gambling page for results"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 4/Button".disabled = false
					6:
						Global.BD += 2
						string = "Passive: Corrupted Mind - Become immune to mind reading, everything is far too chaotic up there. People start to get really worried about you, are you like.. Mentally okay?"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						Global.BD += 1
						Global.AP -= 1
						string = "Ability: Static Pulse - You pull back your hands and form static that crackles through the air. Roll 4d4 and take the result on the gambling page"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 5/Button".disabled = false
					8:
						string = "Ability: Granted from the Corruption - Once per long rest you can call upon the static behind the universe to break through and give you strength, roll 2d12 and take the result on the gambling page"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 6/Button".disabled = false
					9:
						string = "Passive: Lucky Prayer - Roll a d100 once per day, if you land on 1, lose a level. If you land on 100, gain a level."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 7/Button".disabled = false
					10:
						string = "Ability: Chaos Storm: Part 1 - You have unlocked a third of the power of the great corruption, roll on a random number generator of 1-30 on the gambling page when activating this power, the DM chooses the specifics of how long these effects last or if they have any drawbacks"
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button".disabled = true
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					11:
						string = "Ability: The Second Hand of Corruption - Touch a target object, it must be smaller than you, roll a d10 and take the result on the gambling page"
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 9/Button3".disabled = false
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					12:
						string = "Ability: Corrupted Skin - When touching a biological material such as skin, wood, paper, etc. They take 13 + 1d20 of necrotic damage and slowly begin to rot away. (available on gambling page)"
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 10/Button3".disabled = false
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					13:
						string = "Ability: GOOD LUCK ROLL! - A spinning roulette wheel appears above your head as a ball begins to spin around it. Spending 2 IP, roll 3d8 and take the bonus or debuff from the table within the gambling page"
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 11/Button3".disabled = false
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					14:
						Global.SP -= 1
						Global.AP -= 1
					15:
						string = "Ability: Chaos Storm: Part 2 - You have proven yourself worthy for the next part of the statics power. A true corruption spreads across your skin. check gambling page for upgrade"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button2".disabled = false
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button2".visible = true
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button".visible = false
					20:
						string = "Ability: Chaos Storm: Part 3 - You have been granted the third third of the great static power.. Use it wisely"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button3".disabled = false
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button3".visible = true
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button2".visible = false
					30:
						string = "Ability: The Final Storm - You have broken through the barrier of the universe, the static fills your mind and body as you unlock its true power of corruption"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button4".visible = true
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button4".disabled = false
						$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer/corrupt 8/Button3".visible = false
	else:
		match sub_ID:
			1:
				match num:
					4:
						string = "Passive: Deathstalk - You can track a target you personally injured for up to an hour.\n\nPassive: No Escaping - You can no longer be deceived on whether something is living or not. Undead or not you can tell if it is alive yet pretending or perhaps in stasis."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
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
						$"../../VBoxContainer2/ScrollContainer".ability(string)
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
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						Global.BD += 40
			2:
				match num:
					4:
						Global.HP += 50
						string = "Passive: Preservation - By standing still for 30 seconds you begin to heal 40 health a turn. Turns into 80 at level 10, 160 at level 15, 320 at level 20, 640 at level 25, 1280 at level 30."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						Global.HP += 25
						potplv5 = ["","Diamond Skin","An Oath Remains","Brick Wall"]
						for item in potplv5:
							$potplv5.add_item(item)
						opt()
					6:
						string = "Ability: Shielding - if an ally is within Level x 3 Metres of you redirect all damage they take towards you."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						Global.CC += 5
						Global.HP += 100
						string = "Ability: Selfless Hero’s Duty - Costing 1 IP to cast, makes all beings hostile towards allies make a perception check against your CC. if failed or poor, they will become immediately hostile towards the Guardian and prioritise them over other adversaries. At level 15, this becomes a roll against your CC + your level. At level 20, this becomes Guaranteed."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						string = "Passive: Harsh Stomach - Resistant to poison and necrotic damage. At level 20 become immune."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
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
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						match potplv5: #updates ability
							1:
								var old = "Upgrade: Diamond Skin - Resistant to piercing/slashing damage and at 11th level you become immune to bleeding."
								var new = "Upgrade: Diamond Skin (II) - Resistant to piercing/slashing damage and immune to bleeding."
								$"../../VBoxContainer2/ScrollContainer".new_splice(old, new)
							2:
								var old = "Passive: Bastion of Warmth - if your allies are within 3 metres of you they are resistant to cold damage. At level 15 they become immune."
								var new = "Passive: Bastion of Warmth (II) - if your allies are within 3 metres of you they are immune to cold damage."
								$"../../VBoxContainer2/ScrollContainer".new_splice(old, new)
							3:
								pass
					20:
						var old = "Passive: Harsh Stomach - Resistant to poison and necrotic damage. At level 20 become immune."
						var new = "Passive: Harsh Stomach (II) - Immune to poison and necrotic damage"
						string = "Passive: Retribution - the first time your allies are injured a day deal your base damage x5 to the creature that injured them as long as they are within 200 metres. Refreshes at the end of the day. Burning their Soul from the inside out."
						Global.HP += 400
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$"../../VBoxContainer2/ScrollContainer".new_splice(old, new)
			3:
				match num:
					4:
						string = "Passive: Burning Determination - Getting up from being knocked over or breaking out of a grapple is now a free interaction."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						Global.CC+= 1
						Global.HP += 20
						Global.LP += 20
						string = "Ability: Embers of Embrace - If your ally goes down to 0 life points, once a day you can bring them back to full LP and 1 HP.

Passive: Lack of Stakes - Become immune to Intimidation and Fear."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					6:
						Global.SP += 1
						Global.LP += 20
						Global.HP += 20
						string = "Passive: Red Rum - Become immune to drugs and alcohol."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						string = "Upgrade: Tis But a Scratch! - You can now spend a use of Adrenaline to completely avoid the damage and any status or injury from any one attack that is about to or just hit you."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						Global.AP +=2
						Global.CC += 1
						Global.fam += 1
					9:
						string = "Passive: The Dying Rarely Cry - When falling to Life Points remove all negative status effects.

Upgrade: Numb - When falling to 0 LP you can spend 1 use of Adrenaline to give yourself another 10 seconds of life, in this state you have access to all your IP and you become immune to all damage and negative status effects during this 10 second period."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						Global.CC += 1
						Global.HP += 30
						Global.LP += 30
						Global.fam += 2
						string = "Upgrade: Never Back Down - You now have 5 uses of Adrenaline per long rest.

Passive: Immortal - If you fall to 0 LP and are not healed back to full and die.. You come back the next day, no explanation. You simply stand back up."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
			4:
				match num:
					4:
						Global.BD += 3
						Global.cs += 1
						string = "Passive: Rapid Reactions - If all of your Combat Speed Checks are higher than an opponent, during a reaction you can automatically dodge their attack.

Passive: Lead by Example - If you go first in turn order, gain +5 BD"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						Global.AP += 2
						string = "Upgrade: Commanding Aura - When an ally is within 5m of you, you can grant them a bonus depending on the cry you choose to shout out:
Attack Cry: +5 Damage
Defence Cry: +10 Temp Health
Retreat Cry: +Free Reaction
Recovery Cry: Heal for 10 + Charisma Bonus

Upgrade: Teamwork - For every player that follows your Cry or is inside your Commanding Aura gives you a +1 to Hit on your next turn.

Choice: Commanders Flaw - Every commander has a blind spot, you are no exception, you must choose one flaw:"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						$potclv5.visible = false
					6:
						string = "Ability: Formations - Costing 2 IP to use, By granting every ally player 1 IP on your turn if they fall in line with the correct formation that you called out, your entire team will get buffed:
-    Balanced: Ranged users 20m behind the Melee users, doing this gives your ranged players +20 damage per projectile and gives melee users +1 free reaction.
-    Pincer: Players must be split evenly and on opposite sides of enemy forces, pushing them to the middle. Doing this puts the enemies on the backfoot and gives them -1 Max IP. Only works when there’s more than 3 enemies.
-    Wall: All players side by side ending their turn with the shield action, doing so gives you all +20 Base Shield Health until one attacks again.
-    Chargedown: All players in a straight line no further than 3m from each other moving in unison. If they each move the same distance and attack the same amount of times on their turns, all attack levels increase by +1. (Poor -> Success, etc)"
						Global.HP += 20
						Global.LP += 10
						Global.AP += 2
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						Global.BD += 1
						Global.SP += 1
						string = "Passive: Backup - If an enemy misses a melee attack against you, you can give all allies within 3m of you a free reaction.

Upgrade: Commanders Experience - Upgrades your bonuses when using a cry:
Attack Cry: +5 Damage (Total of +10)
Defense Cry: +1 CC to all allies
Retreat Cry: +5 to any roll when using a Reaction
Recovery Cry: +5 to all Health Checks"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						Global.CC += 1
						Global.HP += 40
						string = "Ability: I am a Sacrifice - if an ally within 3m of you is attacked you can spend a reaction to take half that damage for yourself.

Upgrade: In Formation - Increase the amount of formations you can choose from:
-    Distraction: One player taking all enemies' attention, all other players behind them. Doing this guarantees the first hit from all players from behind are Greats.
-    Reverse Psychology: If all players sit down and spend their IP doing nothing, all enemies gain the Intimidated Status.
-    Cavalry: If all players are on mounts they gain +5 to hit.
-    Barrage of Arrows: If all players use ranged attacks and are standing at least 20m from the enemy, you all gain +2 to hit."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						Global.LP += 40
						string = "Passive: Fallen Comrades - When an ally of yours falls to 0 LP, you and the rest of your allies get a +3 to all rolls. Only activates once a long rest per person.

Ability: Warriors Aura - Your aura has reached 15m and now is independent of the cry you are choosing, instead you can swap between the types as an interaction:

Hopeful Words - Every ally heals 20 health a turn inside your aura.
Charged Words - Every ally deals 10 more damage and gets a +1 to hit inside your aura.
Helpful Words - Every ally has 1 free reaction a turn inside your aura.
Defensive Words - Every ally gains 25 temporary health a turn inside your aura."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						string = "Ability: Steady, Aim, Fire! - By sacrificing doing any attacks this turn, you can grant all allies a +4 to hit next turn.

Ability: Rally - By spending 2 IP you can give your allies +1 Motivation until the beginning of your next turn.

Passive: Flanking - If there are 2 or more players attacking the same enemy, the enemy can not react to either attack and gets a -2 on all rolls when surrounded by 3 or more players.

Passive: Leaders Bravery - If you have 2 or more allies within your 15m aura, you get a +2 to hit."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
						Global.dSP += 1
						Global.hSP += 1
			5: #assassin subclasses 5~8
				match num:
					4:
						Global.AP += 2
						Global.Mind_b += 1
					5:
						string = "Ability: False Orders - If your targets are unaware of you or do not see you as a threat you can try to shout false orders to them, either distracting them or making them make clear mistakes against the rest of your party.
Roll a Mind Check against all creatures you are attempting to give false orders to. If any of them beat your check by +5 then they are immune, if they beat your check below that then they just become distracted with a -4 to their next attack and if they fail they will follow your order as long as it's not anything unreasonable."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					6:
						Global.effint += 1
						Global.SP += 1
					7:
						string = "Ability: Copycat - Roll an Intelligence Check of 16, if you succeed you can replicate one non magical ability you have physically seen in the last hour. (i.e. Warrior Spirits parry, Trickster Assassin's Acrobatic Disengage, etc.)"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						string = "Ability: Friendly - Choose up to 3 targets that can see or hear you and roll an Intelligence Check against them, if you succeed they consider you friendly. If it's a Great roll then they consider you an ally.

Passive: Betray - If an enemy perceives you as friendly you can attack it with a +3 to hit and deal 3x the damage towards them. If they consider you an ally it is 4x."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						Global.effint += 1
						Global.CC += 1
						$lv9cham.visible = true
						opt()
					10:
						Global.IPs += 1
						Global.Mind_b += 1
						string = "Ability: Calm - If a creature is hostile to you, roll an Intelligence Check and Charisma Check against the creature. If only one succeeds then that entity will not attack you but still considers you hostile, if both succeed then it will return to neutral with you and if you roll Great on both they view you as an ally."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
			6:
				match num:
					4:
						Global.mvSP += 1
						Global.move_i += 2
						Global.move.emit()
						string = "Trick: The Hand in Sleeve trick - Once per round you can turn a poor attack against you into a failure.

Trick: Bubbly Balloon Animals - Once a day you can blow up a balloon and shape it into any shape you desire and it simply.. Works. Need a key? Take out your balloon and form it into a key shape! Need a shield? Take out your balloon and form it into a +15 Shield Health shield! Need a weapon? How about a +5 Slicing Sword? Made out of Balloons?"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						Global.effprs += 1
						string = "Trick: Flourish - a quick and fascinating distraction with flips and flowing cloth. If you succeed in a Persuasion Challenge you can use a reaction to make an enemy miss and then throw out a free attack of your own.

Trick: Showoff - Spend 1 IP to show the world one of your amazing skills, whether it is acrobatics, miming, comedy, ventriloquism, etc. Roll a Charisma or Persuasion Check of 18. On a success even the enemies are greatly amused, gain +2 Motivation next turn. Does not stack on the same turn.

Passive: Entertainer - If you successfully use “Showoff” you can give your team +1 Motivation next turn instead of giving yourself +2 Motivation next turn, it also does not stack on the same turn."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					6:
						Global.walk += 10
						Global.climb += 5
						Global.swim += 2
						Global.jump += 2
						Global.AP += 2
						string = "Trick: Bare Handed Brawler - Take half damage from all fist attacks.

Trick: Peekaboo - When someone first spots you roll Combat Speed. If your CS is higher than theirs, you can become stealthed again and leave the encounter."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						Global.jump += 1
						string = "Trick: Roundabout - As a reaction if you succeed on an athletics check against the enemy you can deflect any melee strike so they hit themselves for full damage.

Trick: Knocked on your Ass - The first time you are knocked over in a round, get back up instantly for free.

Trick: Safety Protocol - Mind Bonus times per day you can form a bouncy pad at the bottom of a long fall, nullifying you and any of your parties fall damage."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						Global.SP += 2
						Global.effprs += 1
						Global.effprc += 1
						string = "Trick: Fools Folly - You can automatically get away with any lie, the issue is that you must make yourself believe it. When you do this you become convinced your lie is actually the truth.

Trick: Juggling Act - Allows you to attack with 3 small weapons like daggers, hammers, etc while only spending 2 IP (Each one counts as a different attack)

Trick: A Single Swing - Allows you to apply conditions to multiple tools for only 1 IP."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						Global.jump += 3
						string = "Trick: Spiralling Dodge - It costs 2 IP to use and sends you pirouetting backwards, the next attack that lands on you forces you to roll an Athletics check of 16. If you succeed you completely dodge the attack and get a free two attacks in return. If you fail you only take half damage."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						string = "Trick: Follow The Ball - if you have a small weapon such as a dagger, work hammer, etc. Roll a Persuasion Check against the nearest enemy, if you succeed then it seems as if your weapon seemingly vanished into thin air. This allows you to surprise attack the enemy with the weapon right after."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
			7:
				match num:
					4:
						Global.AP += 1
						Global.HP += 10
						Global.fam += 1
					5: #do this right when you do pages of abilities
						string = "Hums: Choose 1
Silent Hum - (2IP) Cancel out any excess noise and put those around you at rest, gain a +2 to Stealth for 1 minute.
Joyful Hum - The sound you emit is simply joyful, gain a +1 to all conversation checks.

Whistles: Choose 1
Healing Whistle - (1IP) Heal all allies that can hear you for Charisma Bonus x 5.
Aggressive Whistle - (1IP) All allies get a +1 to their next attack.

Shouts: Choose 1
Dazing Shout - (1IP) Shout towards a target enemy, if they fail an Intimidation Check against you they become dazed and cannot react this round.
Heart Attack Shout - (2IP) Shout towards a target enemy, if they fail an Intimidation Check against you they take 5 + Intimidation Bonus force damage. Doesn’t matter the range as long as they can hear you."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					6:
						Global.effprs += 1
						Global.effcha += 1
						Global.IPs += 1
						Global.BD += 5
					7:
						string = "Ability: Morning Practice - At the start of each day you can change which Hums, Whistles and Shouts you recall. (2 Hum Recalls, 2 Whistle Recalls, 2 Shout Recalls)"
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						string = "Upgrade: Performer Aptitude - Add 1 Recall to your Hums, Whistles and Shouts. Allowing you to cast 3 Hums, Whistles and Shouts as you wish."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						string = "Ability: Sonic Scream - When screaming it casts a cone 3 metres wide and 10 metres long in front of you. Any creatures caught in this cone take BD + 14 + Your Level force damage and become stunned. This ability costs 2 IP to use."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						string = "Hums: Choose 2
Healing Hum - (1IP) heal yourself equal to your Charisma Bonus + 1d8.
Focus Hum - (1IP) gain a +2 to all perception rolls for 5 minutes.
Blood Hum - (1IP) Stop any level 1 Bleeding you may be suffering from.

Whistles: Choose 2
Charging Whistle - (1IP) Give all allies in range a +1 to their next roll.
Deadly Whistle - (1IP) Give all allies in range a +8 Damage to their next attack.
Charge Up Whistle - (1IP) Every time you use this whistle store a +1, whenever you decide, give the total stored bonus to one ally of your choice (cannot be you) for their next roll.

Shouts: Choose 2
Raging Shout - (1IP) Choose 1 target, both you and that target will deal double damage to each other for 20 seconds.
Thunder Shout - (1IP) If a target fails an Athletics Check against you then they are thrown back 15 metres and dealt your BD in Force dmg.
Piercing Shout - (1IP) If a target fails a Mind Check against you they feel pins and needles shoot into their mind as if something broke. Every Time they spend 1 IP they will now take 8 Damage. This lasts for 1 minute."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
			8:
				match num:
					4:
						Global.cs += 1
						Global.atk_ex_buff += 1
						string = "Passive: Tracking your Prey - You can track anyone with your prey mark on them for up to an hour before you lose their tracks."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					5:
						Global.CC += 1
						Global.SP += 1
						string = "Ability: Hunters Presence - When using prey mark you can use this ability once per prey, allowing you to give them some form of debuff to help you and your allies:

Death is Calling - Instantly frighten them.
Wound - Next time you land a hit, lower their CC by 2 for the rest of combat.
Study - Know their HP, Any immunities, resistances and weaknesses.
Trap - Set their movement to 0 for 2 turns.

Passive: Belief in the Wild - After a rest you gain Temporary Health equal to your Faith Bonus x3."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					6:
						Global.fam += 1
						string = "Passive: Survivability - You can take double the time to see the effects of lack of food and water.

Passive: Gift of the Woods - When healed, heal an extra amount equal to double your Faith Bonus."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					7:
						Global.AP += 1
						Global.exper += 1
						string = "Passive: Persistence - 1 level of exhaustion gives you no debuffs."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					8:
						Global.BD += 2
						Global.SP += 2
						string = "Upgrade: Killer Knowledge - Your 1d8 extra damage against prey turns into 3d8."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					9:
						string = "Ability: Ferocity - When attacking an enemy you have marked as your prey you can add double your Faith Bonus onto the final damage.

Passive: Bloodlust - When killing your prey you heal equal to your BD + Faith Bonus."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
					10:
						Global.BD += 2
						Global.atk_ex_buff += 1
						Global.exper += 1
						string = "Upgrade: Upgraded Prey Mark - You can now add new debuffs to enemies with your prey mark:

Sapped - Give them 2 levels of exhaustion.
1000 Cuts - They gain 10 Bleeding Damage (10).
Distracted - They get a -3 to Hit anyone but you.
Beacon - You always know where they are and there is a one time ability where you can teleport directly in front of them no matter how far away they are."
						$"../../VBoxContainer2/ScrollContainer".ability(string)
	num += 1
	Global.complete_update.emit()

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
	$"../../VBoxContainer2/ScrollContainer".ability(string)
	$"../Species/SpeciesOption".update()

func _on_subclass_item_selected(index):
	sub_ID = index
	match index:
		0:
			$subclasswarrior.visible = false
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
	$"../../VBoxContainer2/ScrollContainer".ability(string)
	$"../Species/SpeciesOption".update()

func _on_subclassassassin_item_selected(index: int) -> void:
	if index < 4:
		$subclassassassin.visible = false
		Global.cs += 1
		string = "Passive: Dropdown - Deal double damage when performing an attack as you drop down onto an opponent from behind, the drop must be at least 5 metres for it to count. Take half fall damage when landing a drop down attack, take no fall damage if the roll to hit is a Great.

Passive: You’re Next - If an enemy is brought to 0 life points you can turn to another enemy and automatically intimidate them.

Passive: Ready or Not - Gain a +2 to hit against targets that have a lower combat speed than you."
		$"../../VBoxContainer2/ScrollContainer".ability(string)
	else:
		sub_ID = index
		match index:
			5:
				Global.effstl += 1
				string = "Ability: Blend In - Roll a stealth challenge against all the enemies, not to hide but the opposite. To be in plain sight, if you succeed enemies will assume you are non threatening. Only works if you have not hit any of the enemies yourself. You could use this to get behind enemy lines and attack from behind."
				$"../../VBoxContainer2/ScrollContainer".ability(string)
			6:
				Global.effath += 1
				Global.jump += 8
				string = "Trick: Acrobatic Disengage - When an enemy is attacking you, use your reaction to flurry and flip and disengage from battle automatically, allowing you to move 3m and dodge any melee attacks.

Trick: Feint - You can spend 1 extra IP while attacking to feint, if an enemy fails a Perception Check of 12 + Mind Bonus your attack is a guaranteed great. If they succeed, take your regular attack roll.

Trick: Luck of the Cards - Roll 1d8 as a free interaction once per turn to give you a buff or debuff depending on the result:

1 - The Joker: You cannot perform any tricks for 10 seconds.
2 - 2 of Spades: You get -2 CC for 10 seconds.
3 - 5 of Hearts: Heal for 15 HP
4 - 10 of Diamonds: Deal a bonus +5 damage on your next attack
5 - Jack of Clubs: You can use the Feint trick once for free this turn.
6 - King of Hearts: Heal for 10 HP and gain 1 free movement IP.
7 - Queen of Diamonds: apply two killing intents to your weapon.
8 - Ace: Gain a bonus IP this round."
				$"../../VBoxContainer2/ScrollContainer".ability(string)
			7:
				string = "Ability: Hum, Whistle, Shout - Auditory offence and defence is underused by everyone but you. Learn specific hums, whistles and shouts to help you and your allies in battle.

Hums: Choose 1
Calming Hum - You gain 10 Temporary Health upon short rests.
Motivating Hum - (1IP) Roll a Charisma Check against an enemy you’re afraid of to break said scared status.

Whistles: Choose 1
Alert Whistle - (1IP) A sharp whistle which alerts your allies, you can give 2 allies a reaction at the same time.
Disarming Whistle - (1IP) A deep unsettling whistle which gives one target of your choice a -1 on their next attack roll. Non stackable.

Shouts: Choose 1
Shocking Shout - (2IP) A sudden and violent sound that disorients foes, Roll Intimidation Check against a target, if they fail they become frightened of you.
Distracting Shout - (2IP) A strange guttural sound which takes the attention onto you, all entities gain a -1 to hit on any target that is not you. Including allies."
				$"../../VBoxContainer2/ScrollContainer".ability(string)
			8:
				Global.AP += 2
				Global.fam += 2
				Global.SP += 1
				string = "Passive: Prey Mark - After attacking an enemy you can give them the Prey Mark, you can only have one of these active at once. You gain a +1 to hit and deal 1d8 extra damage to the enemy you have marked as your prey.

Passive: Hunters Senses - You gain Night Vision and the Night Owl skill, you can also smell blood from up to 200m away and get the Danger Sense skill."
				$"../../VBoxContainer2/ScrollContainer".ability(string)

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
	$"../../VBoxContainer2/ScrollContainer".ability(string)
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
	$"../../VBoxContainer2/ScrollContainer".ability(string)
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
	$"../../VBoxContainer2/ScrollContainer".ability(string)

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
	$"../../VBoxContainer2/ScrollContainer".ability(string)

func _on_potklv_8_item_selected(index):
	match index:
		0:
			string = "Passive: Night Hunter - Gain 30 metres of night vision and have no natural debuffs at night. You gain a +2 to all rolls at night or in very dark areas."
		1:
			string = "Upgrade: Morning Stalker - Short rest becomes an hour, long rest becomes 5 hours. You gain a +1 In Combat Speed."
	$potklv8.visible = false
	$"../../VBoxContainer2/ScrollContainer".ability(string)

func _on_potklv_10_item_selected(index):
	match index:
		0:
			string = "Ability: Stunning Strike - when landing a melee hit you can spend 1 IP to make it stun the opponent."
		1:
			string = "Upgrade: Unseen Force - gain a +8 to stealth while using a ranged weapon."
		2:
			string = "Ability: Deadly Distraction - Spend IP to make any target within sight fail their next check automatically."
	$"../../VBoxContainer2/ScrollContainer".ability(string)
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
	$"../../VBoxContainer2/ScrollContainer".ability(string)

func _on_potplv_10_item_selected(index):
	match index:
		1:
			string = "Passive: Protectors Roar - all foes in a 30 metre radius with lower Health become afraid of you. Your allies also gain a +3  to all their rolls next turn."
		2:
			string = "Passive: You Shall Not Pass - Become immune to shoves and pushes unless they roll 15 higher than your CC."
	$potplv10.visible = false
	$"../../VBoxContainer2/ScrollContainer".ability(string)


func _on_potclv_5_item_selected(index):
	$potclv5.visible = false
	match index:
		1:
			string = "Confusing Orders - If you use a cry, all allies get -1 Max IP that round"
		2:
			string = "Overconfident - Enemies can no longer miss attacks on players who follow your cry that round"
		3:
			string = "Lack of Experience - You must now roll a Persuasion Check of 18 to activate your cry, if you fail or roll a poor it still costs 1 IP but nothing happens"
		4:
			string = "Ruthlessness - All allies who do not follow your cry get 2 levels of exhaustion until the beginning of your next turn"
		5:
			string = "Paranoid - For every ally that does not follow your cry, get 1 level of exhaustion for 20 seconds."
	$"../../VBoxContainer2/ScrollContainer".ability(string)

var numberberererere = 0
func _on_lv_5_assassin_item_selected(index):
	if !numberberererere == 2:
		match index:
			0:
				string = "Sabotage: Roll Stealth Challenge against an enemy within 2m of you, on a success you can choose one item or armour they have equipped or have on their person and Sabotage that equipment. The next time they use that item it will fall apart, does not work if the item is non magical or one solid piece."
			1:
				string = "Thievery: When hitting a Superior attack on an enemy you can also steal one item that is not currently equipped or worn by them."
			2:
				string = "Just a Scratch: When rolling a poor on an attack roll with a weapon you can turn your damage into Poison (2)."
			3:
				string = "Quickstep: You can now move 5m after attacking for free if you rolled a Success or higher."
			4:
				string = "Noted: If you beat an enemy in a Wisdom Challenge you can learn one weakness, resistance or immunity for 2 IP."
			5:
				string = "Retaliation: All attacks used during a reaction cannot fail and are bumped up to a minimum of a poor."
			6:
				string = "Pinprick: You have three hair sized needles per long rest, the needles can be applied for free upon a Great Melee Attack or you can use Intelligence to hit them from up to 5m away. Once someone has been struck with the pinprick they begin to take 10 Poison (5) damage."
			7:
				string = "Silence: When attacking an enemy while stealthed, if you roll a success or above no other enemies are alerted by the attack."
			8:
				string = "Versatile Combatant: You’re used to everything, gain a +1 to Attack."
			9:
				string = "Sleep Gas: When using your smoke bombs any enemies within 2m of you must make a Health Check of 13, if they fail they fall unconscious until the start of their next turn."
			10:
				string = "Accuracy is King: If the enemy is within 10m you can no longer fail a ranged attack."
			11:
				string = "Lock Picking: You can spend 2 IP to automatically lock pick anything not locked by magic."
	$"../../VBoxContainer2/ScrollContainer".ability(string)
	numberberererere += 1
	if numberberererere == 2:
		$lv5assassin.visible = false


func _on_lv_7_assassin_item_selected(index):
	match index:
		0:
			Global.atk_ex_buff += 1
			string = "Passive: Everyone Can Be A Target - Gain a +1 to Attack."
		1:
			Global.effcha += 1
			string = "Passive: I Only Kill Those Worth Killing - Gain a +1 to Charisma."
		2:
			string = "Passive: Kill Those Who Hurt Me or My Friends - Gain a free reaction every turn."
		3:
			Global.efflife += 1
			Global.effstl += 1
			string = "Passive: I Don’t Want To Kill - Gain a +1 to Stealth and a +1 to Life"
	$"../../VBoxContainer2/ScrollContainer".ability(string)
	$lv7assassin.visible = false


func _on_lv_9_cham_item_selected(index):
	match index:
		0:
			Global.fam += 1
		1:
			Global.cs += 1
	$lv9cham.visible = false

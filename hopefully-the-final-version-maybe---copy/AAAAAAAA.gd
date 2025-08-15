extends HBoxContainer

var string


func _on_scaveger_mods_item_selected(index):
	match index:
		0:
			var string = "Coiling Arm: Gives you a 10m grapple hook that instantly pulls you anywhere in range or pulls enemies less than twice your size to you. It does however use your tendons as the hook so take 15 Bleeding (2) every use."
		1:
			string = "Dead Angel.. Free Wings: You can put on the wings of a long dead Angelica, the feathers have all wilted off and all that remain is bone though. Gain 5m of flight and +2 points to Intimidation."
		2:
			string = "Empty Organs: You can now store items inside of your torso which is now hollow, doing so will lower your Max Health increase per level to 5 and putting points into Health now only gives you +10 with no increases."
		3:
			string = "Green Thumb: Taking the arm of a Fibrosian allows you to gain +10 Temporary Health for every hour you spend in sunlight but you become weak to fire."
		4:
			string = "Demon Arm: Given by a Demonica, this increases your base damage by 3 and lets you choose to deal Fire Damage as base damage with burning (1) on great. However if you ever roll a nat 1 the arm will attack you instead and guarantee burning (1) damage."
		5:
			string = "Hunter Claws: Gives your BD Bleed (1) when using unarmed strikes but gives you an Incompetence (-2) when using any weapon."
		6:
			string = "Elemental Preference: You gain parts of a Nymph subspecies of your choosing, gaining their ability if you are in their natural environment (Water for Water Nymph, Being in the air for Sky Nymph)"
		7:
			string = "Built to Last: Some of your musculature is formed from an old Husk body, it has aged like fine wine. Gain a +1 to any Prime Attribute of your choosing but you also gain a -1 to a Prime Attribute."
		8:
			string = "Ghost in a Witch: Your body's frame is a Witchling, you gain +1 Magic Skill no matter the requirement but can no longer take any Body or Mind skills ever."
		9:
			string = "Zombie Bite: When grappling an enemy you can now deal your BD as Poison 3 but now you take half healing when on Life Points."
		10:
			string = "Springheeled: Your jumping movement is now all vertical and your horizontal jumping movement is now equal to half your level. You take fall damage from your own jumps."
		11:
			string = "Tendriquill: One of your arms is now a group of tendrils, you can no longer use weapons or shields with this arm and cannot use two handed weapons but this arm automatically succeeds in grappling any target within melee range."
		12:
			string = "Overclocked Gears: Gain +1 Max IP but gain 5 Levels of Exhaustion after every combat encounter."
		13:
			string = "Double Trouble: You now have four arms, giving you +10 Base Shield Health when blocking and allowing you to carry 4 items/weapons at once."
	$ScrollContainer.ability(string)



func _on_option_button_item_selected(index):
	match index:
		0:
			string = "Engulf: You can create fire that spurts from your body, it deals your BD + Body Bonus in fire damage and has a range of 5m with Charisma to hit."
		1:
			string = "Splash: For free once per round you can throw out a splash of water to anyone within 5m, dealing your BD in ice or healing that same amount if it's an enemy or ally."
		2:
			string = "Tangle: Costing 1IP roll an Athletics Challenge against a target, if you succeed they become trapped in vines. Their movement set to 0 until they beat a Strength Check of 13. 1 IP to attempt to escape."
		3:
			string = "+Immune to Falling Damage
+10m of movement except for swimming
+Hitting a Great unarmed strike knocks a target over
Poof: You can throw out a gust of wind below you when jumping allowing you to gain a second jump in the air. Or can be used on the floor to knock an enemy back 10m when hitting them with an unarmed strike for free."
		4:
			string = "Shadowstep: When sprinting you become completely invisible, all enemies must roll with a -5 to hit you while you’re sprinting."
		5:
			string = "Lightstep: As a reaction you can dodge a melee or unarmed attack by teleporting a few metres away, turning to light for a moment."
		6:
			string = "Crush: By spending 1 IP, all enemy movement within 10m of you will be halved until the start of your next turn."
		7:
			string = "Slow: You grant all entities in a 50m radius +1 Max IP until the beginning of your next turn, which can only be used three times per short rest."
	$ScrollContainer.ability(string)

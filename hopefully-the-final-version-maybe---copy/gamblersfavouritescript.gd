extends VBoxContainer

func _ready():
	_reset()

func _reset():
	$Label.text = "\nEFFECT:\n\n"

func roll_d4() -> int:
	return randi_range(1,4)

func roll_d6() -> int:
	return randi_range(1,6)

func roll_d8() -> int:
	return randi_range(1,8)

func roll_d10() -> int:
	return randi_range(1,10)

func roll_d12() -> int:
	return randi_range(1,12)

func roll_d20() -> int:
	return randi_range(1,20)

func roll_d30() -> int:
	return randi_range(1,30)

func roll_d60() -> int:
	return randi_range(1,60)

func roll_d90() -> int:
	return randi_range(1,90)

func roll_d100() -> int:
	return randi_range(1,100)

var string: String
var num
var num2
var num3
var num4

func _on_button_pressed():
	_reset()
	num = roll_d8()
	match num:
		1:
			string = "Item deals your level x2 in Fire Damage to everyone in a 4 metre radius in an explosion"
		2:
			string = "Item becomes stuck in place, unable to move (can still be broken)"
		3:
			string = "Item becomes very easy for you to pick up or move"
		4:
			string = "Item heals anyone who touches it 5 Health"
		5:
			string = "Item grows to double the size"
		6:
			string = "Item becomes indestructible for 1 minute"
		7:
			string = "Item deals 3 + BD in electric damage to anyone you hit with it"
		8:
			string = "Item becomes a weapon of your choice, player has Expert with the weapon for 3 minutes, then the corruption ends and the item is turned to dust"
	$Label.text += string

func _on_button_pressed2():
	_reset()
	num = roll_d6()
	num2 = roll_d6()
	num3 = roll_d6()
	match num:
		1:
			string = "No Damage"
		2:
			string = "Force Damage"
		3:
			string = "Lightning Damage"
		4:
			string = "Slashing Damage"
		5:
			string = "Psychic Damage"
		6:
			string = "Poison Damage"
	$Label.text += string
	$Label.text += "\n"
	match num2:
		1:
			string = "Deals 15 damage to an enemy and back towards you as well."
		2:
			string = "Deals 3 Damage"
		3:
			string = "Deals your BD"
		4:
			string = "Deals 25 Damage"
		5:
			string = "Deals 20 Damage"
		6:
			string = "Deals 10 x Soul Bonus Damage"
	$Label.text += string
	$Label.text += "\n"
	match num3:
		1:
			string = "Spell targets yourself"
		2:
			string = "Spell targets anyone of your choice"
		3:
			string = "Spell hits everything in a 5m radius"
		4:
			string = "Spell shoots directly forward for 10m"
		5:
			string = "Spell is delayed on your location by 30 seconds"
		6:
			string = "Spell has a 10m radius, its location is decided by you"
	$Label.text += string

func _on_button_pressed3():
	_reset()
	num = roll_d4()
	num2 = roll_d4()
	match num:
		1:
			string = "Heal 20 HP"
		2:
			string = "Take 5 Damage"
		3:
			string = "Take 1d4 poison damage for 1d4 turns"
		4:
			string = "Heal 20 LP"
	$Label.text += string
	$Label.text += "\n"
	match num2:
		1:
			string = "Gain a +1 CC until your next spell"
		2:
			string = "Become weak to all forms of damage until your next spell"
		3:
			string = "Gain a bonus IP until your next spell"
		4:
			string = "Reroll both dice"
	$Label.text += string
	$Label.text += "\n"

func _on_button_pressed4():
	_reset()
	for i in 2:
		num = roll_d12()
		match num:
			1:
				string = "Your skin turns green"
			2:
				string = "Two enemies of your choosing become dizzy"
			3:
				string = "All healing becomes useless for 30 seconds"
			4:
				string = "Take 5 poison damage until healed"
			5:
				string = "Everyone swaps location with the nearest entity to their left"
			6:
				string = "All allies gain +1 CC"
			7:
				string = "Roll your next spell twice and pick which one to take"
			8:
				string = "Summon an angelic +4 Faith damage sword (Athletics to hit)"
			9:
				string = "You are teleported 13m into the air"
			10:
				string = "All weapons are turned to mice for 1 minute"
			11:
				string = "Spawn 13 mice all around you (count as 1 entity in total) you can control them"
			12:
				string = "Reroll"
		$Label.text += string
		$Label.text += "\n"

func _on_button_pressed5():
	_reset()
	num = roll_d4()
	num2 = roll_d4()
	num3 = roll_d4()
	num4 = roll_d4()
	match num:
		1:
			string = "Deal 10 Necrotic Damage"
		2:
			string = "Deal 30 Fire Damage"
		3:
			string = "Deal 1 Holy Damage"
		4:
			string = "Deal BDx2 Force Damage"
	$Label.text += string
	$Label.text += "\n"
	match num2:
		1:
			string = "To an enemy within your line of sight"
		2:
			string = "To the closest person"
		3:
			string = "To up to 2 enemies of your choice"
		4:
			string = "All of your allies"
	$Label.text += string
	$Label.text += "\n"
	match num3:
		1:
			string = "Heal yourself 10HP"
		2:
			string = "Damage yourself 15 Slashing damage"
		3:
			string = "Become stunned"
		4:
			string = "Gain 1 Bonus IP next turn"
	$Label.text += string
	$Label.text += "\n"
	match num4:
		1:
			string = "Your next spell happens twice"
		2:
			string = "You cannot cast a spell next turn"
		3:
			string = "Your next spell deals half damage"
		4:
			string = "Your next spell deals double damage"
	$Label.text += string
	$Label.text += "\n"



func _on_button_pressed6() -> void:
	_reset()
	num = roll_d12()
	num2 = roll_d12()
	match num:
		1:
			string = "Heals you for 60 HP"
		2:
			string = "Injure your leg"
		3:
			string = "You become immune to blindness, stun and dizziness"
		4:
			string = "You begin to glow brightly"
		5:
			string = "Loud music begins to play all around you"
		6:
			string = "You are granted 50 Temporary Health"
		7:
			string = "You are healed back to full health"
		8:
			string = "All enemies become aware of your presence"
		9:
			string = "You can copy an ability of another party member"
		10:
			string = "You become a living statue (Half Movement, +3 CC)"
		11:
			string = "You become a slime (copy slime stats)"
		12:
			string = "Double your BD"
	$Label.text += string
	$Label.text += "\n"
	match num2:
		1:
			string = "For 1 second"
		2:
			string = "Until your next spell"
		3:
			string = "It will happen in 30 seconds (reroll for duration)"
		4:
			string = "Until you take a short rest"
		5:
			string = "Until you take a long rest"
		6:
			string = "For 10 seconds"
		7:
			string = "Until you blink"
		8:
			string = "It will happen in 24 hours (reroll for duration)"
		9:
			string = "Until you are hit"
		10:
			string = "It will happen in 1 hour (reroll for duration)"
		11:
			string = "lasts until end of combat"
		12:
			string = "Lasts 24 hours"
	$Label.text += string

signal lvl_up

func _on_button_pressed7() -> void:
	num = roll_d100()
	match num:
		1:
			$Label.text += "lost 1 level!!! (in practice just press lvl up twice)"
			lvl_down.emit()
		100:
			lvl_up.emit()
			$Label.text += "gained 1 level!!!"



func _on_button_pressed8():
	_reset()
	num = roll_d30()
	match num:
		1:
			string = "Slowly become a statue"
		2:
			string = "All food becomes poisonous to you"
		3:
			string = "You slowly become a tree"
		4:
			string = "You automatically lose all Strength Checks"
		5:
			string = "You take 10 damage for every metre you move"
		6:
			string = "All animals become aggressive towards you"
		7:
			string = "You take 3 poison damage a turn until healed"
		8:
			string = "All your money becomes dirt"
		9:
			string = "Everytime you walk roll a Body Check of 15, if you fail you trip and fall"
		10:
			string = "Any weapons or armour you’re wearing fall off you in a comedic fashion"
		11:
			string = "The nearest 2 enemies ge a free attack on you"
		12:
			string = "Everytime you walk through a doorway you become snagged on some part of it"
		13:
			string = "Everytime you sneeze something embarrassing happens to you"
		14:
			string = "You get a clogged nose and throat"
		15:
			string = "Everytime you speak a soft whistling noise is heard"
		16:
			string = "Everything tastes delicious to you now"
		17:
			string = "Gain 10m of walking speed"
		18:
			string = "You magically find d8 + 2 shimmering crystals"
		19:
			string = "The next attack that is aimed at you auto misses"
		20:
			string = "Lower one targets CC by 3"
		21:
			string = "Turn off one magical spell, enchantment or item of your choosing"
		22:
			string = "Become immune to one type of damage"
		23:
			string = "Automatically succeed any Athletics Checks"
		24:
			string = "Apply any one status effect to a target"
		25:
			string = "Become resistant to fall damage "
		26:
			string = "You can react 3 times for 1 IP"
		27:
			string = "Your next 5 hits are guaranteed to hit"
		28:
			string = "Your next 5 hits are guaranteed crits"
		29:
			string = "You gain +4CC for the rest of the encounter, if you are not in an encounter then it vanishes at the end of your next encounter"
		30:
			string = "You can choose one effect and give it to yourself or another target"
	$Label.text += string


func _on_button_2_pressed():
	_reset()
	num = roll_d60()
	match num:
		1:
			string = "Slowly become a statue"
		2:
			string = "All food becomes poisonous to you"
		3:
			string = "You slowly become a tree"
		4:
			string = "You automatically lose all Strength Checks"
		5:
			string = "You take 10 damage for every metre you move"
		6:
			string = "All animals become aggressive towards you"
		7:
			string = "You take 3 poison damage a turn until healed"
		8:
			string = "All your money becomes dirt"
		9:
			string = "Everytime you walk roll a Body Check of 15, if you fail you trip and fall"
		10:
			string = "Any weapons or armour you’re wearing fall off you in a comedic fashion"
		11:
			string = "The nearest 2 enemies ge a free attack on you"
		12:
			string = "Everytime you walk through a doorway you become snagged on some part of it"
		13:
			string = "Everytime you sneeze something embarrassing happens to you"
		14:
			string = "You get a clogged nose and throat"
		15:
			string = "Everytime you speak a soft whistling noise is heard"
		16:
			string = "Everything tastes delicious to you now"
		17:
			string = "Gain 10m of walking speed"
		18:
			string = "You magically find d8 + 2 shimmering crystals"
		19:
			string = "The next attack that is aimed at you auto misses"
		20:
			string = "Lower one targets CC by 3"
		21:
			string = "Turn off one magical spell, enchantment or item of your choosing"
		22:
			string = "Become immune to one type of damage"
		23:
			string = "Automatically succeed any Athletics Checks"
		24:
			string = "Apply any one status effect to a target"
		25:
			string = "Become resistant to fall damage "
		26:
			string = "You can react 3 times for 1 IP"
		27:
			string = "Your next 5 hits are guaranteed to hit"
		28:
			string = "Your next 5 hits are guaranteed crits"
		29:
			string = "You gain +4CC for the rest of the encounter, if you are not in an encounter then it vanishes at the end of your next encounter"
		30:
			string = "You can choose one effect and give it to yourself or another target"
		31:
			string = "Apply levitation to yourself"
		32:
			string = "Explode the nearest two enemies, dealing 40 Fire damage to each"
		33:
			string = "Explode yourself, dealing 40 Fire damage to yourself"
		34:
			string = "Heal equal to your Intelligence Bonus x 2"
		35:
			string = "Heal equal to your Life Bonus x 4"
		36:
			string = "Gain 1 Temporary Health"
		37:
			string = "3 plastic ducks appear"
		38:
			string = "The next thing you touch becomes frozen"
		39:
			string = "1d4 Wolves spawn around you"
		40:
			string = "Change the weather to stormy"
		41:
			string = "Reverse time by 10 seconds"
		42:
			string = "Create a clone of you with 1 LP and 1 HP"
		43:
			string = "Teleport 100m in a direction of your choice"
		44:
			string = "Halve the movement speed of all entities within 50m of you"
		45:
			string = "Reverse the damage types of everything around you (Force → Slashing, Ice → Fire, Psychic → Force, Necrotic → Faith, etc)"
		46:
			string = "Time freezes for everyone but you for 10 seconds"
		47:
			string = "Create a Gravity Well (From The Godhand Book) right by your feet"
		48:
			string = "Throw everyone backwards 15m, take 25 force damage if you hit a wall"
		49:
			string = "Turn into a horse"
		50:
			string = "Turn into a cat"
		51:
			string = "Turn into a bat"
		52:
			string = "Turn into a rat"
		53:
			string = "Become unable to speak Commoner"
		54:
			string = "A house appears around you"
		55:
			string = "An evil Ghost (HP:500 LP:600 BD:12) is spawned besides you and attacks you on sight"
		56:
			string = "Everytime you bleed, floating forest sharks appear to attack you"
		57:
			string = "Now when Frightened, pass out completely for 1 minute"
		58:
			string = "Take 15 Fire damage for every 10 seconds in the sunlight"
		59:
			string = "Become blind"
		60:
			string = "Lose both your arms"
	$Label.text += string

func _on_button_3_pressed():
	_reset()
	num = roll_d90()
	match num:
		1:
			string = "Slowly become a statue"
		2:
			string = "All food becomes poisonous to you"
		3:
			string = "You slowly become a tree"
		4:
			string = "You automatically lose all Strength Checks"
		5:
			string = "You take 10 damage for every metre you move"
		6:
			string = "All animals become aggressive towards you"
		7:
			string = "You take 3 poison damage a turn until healed"
		8:
			string = "All your money becomes dirt"
		9:
			string = "Everytime you walk roll a Body Check of 15, if you fail you trip and fall"
		10:
			string = "Any weapons or armour you’re wearing fall off you in a comedic fashion"
		11:
			string = "The nearest 2 enemies ge a free attack on you"
		12:
			string = "Everytime you walk through a doorway you become snagged on some part of it"
		13:
			string = "Everytime you sneeze something embarrassing happens to you"
		14:
			string = "You get a clogged nose and throat"
		15:
			string = "Everytime you speak a soft whistling noise is heard"
		16:
			string = "Everything tastes delicious to you now"
		17:
			string = "Gain 10m of walking speed"
		18:
			string = "You magically find d8 + 2 shimmering crystals"
		19:
			string = "The next attack that is aimed at you auto misses"
		20:
			string = "Lower one targets CC by 3"
		21:
			string = "Turn off one magical spell, enchantment or item of your choosing"
		22:
			string = "Become immune to one type of damage"
		23:
			string = "Automatically succeed any Athletics Checks"
		24:
			string = "Apply any one status effect to a target"
		25:
			string = "Become resistant to fall damage "
		26:
			string = "You can react 3 times for 1 IP"
		27:
			string = "Your next 5 hits are guaranteed to hit"
		28:
			string = "Your next 5 hits are guaranteed crits"
		29:
			string = "You gain +4CC for the rest of the encounter, if you are not in an encounter then it vanishes at the end of your next encounter"
		30:
			string = "You can choose one effect and give it to yourself or another target"
		31:
			string = "Apply levitation to yourself"
		32:
			string = "Explode the nearest two enemies, dealing 40 Fire damage to each"
		33:
			string = "Explode yourself, dealing 40 Fire damage to yourself"
		34:
			string = "Heal equal to your Intelligence Bonus x 2"
		35:
			string = "Heal equal to your Life Bonus x 4"
		36:
			string = "Gain 1 Temporary Health"
		37:
			string = "3 plastic ducks appear"
		38:
			string = "The next thing you touch becomes frozen"
		39:
			string = "1d4 Wolves spawn around you"
		40:
			string = "Change the weather to stormy"
		41:
			string = "Reverse time by 10 seconds"
		42:
			string = "Create a clone of you with 1 LP and 1 HP"
		43:
			string = "Teleport 100m in a direction of your choice"
		44:
			string = "Halve the movement speed of all entities within 50m of you"
		45:
			string = "Reverse the damage types of everything around you (Force → Slashing, Ice → Fire, Psychic → Force, Necrotic → Faith, etc)"
		46:
			string = "Time freezes for everyone but you for 10 seconds"
		47:
			string = "Create a Gravity Well (From The Godhand Book) right by your feet"
		48:
			string = "Throw everyone backwards 15m, take 25 force damage if you hit a wall"
		49:
			string = "Turn into a horse"
		50:
			string = "Turn into a cat"
		51:
			string = "Turn into a bat"
		52:
			string = "Turn into a rat"
		53:
			string = "Become unable to speak Commoner"
		54:
			string = "A house appears around you"
		55:
			string = "An evil Ghost (HP:500 LP:600 BD:12) is spawned besides you and attacks you on sight"
		56:
			string = "Everytime you bleed, floating forest sharks appear to attack you"
		57:
			string = "Now when Frightened, pass out completely for 1 minute"
		58:
			string = "Take 15 Fire damage for every 10 seconds in the sunlight"
		59:
			string = "Become blind"
		60:
			string = "Lose both your arms"
		61:
			string = "All enemies become half their size (Half BD, +2 CC)"
		62:
			string = "All enemies start to float upwards"
		63:
			$Label.text += "lost 1 level!!! (in practice just press lvl up twice)"
			lvl_down.emit()
		64:
			string = "All enemies lose their memory"
		65:
			string = "All enemies lose their equipment"
		66:
			string = "All enemies level up"
		67:
			string = "All enemies duplicate"
		68:
			string = "All enemies lose their legs"
		69:
			string = "All enemies become magical"
		70:
			string = "All enemies become frogs"
		71:
			string = "Turn all melee weapons to ranged and all ranged to melee"
		72:
			string = "Turn all armour to wooden"
		73:
			string = "Extinguish all fire based spells instantly"
		74:
			string = "Drain all water based spells instantly"
		75:
			string = "Reset all entities to level 1"
		76:
			string = "Limit everything's BD to 3"
		77:
			string = "Gain magical armour"
		78:
			string = "Lose all magical items"
		79:
			string = "Turn all items into snakes"
		80:
			string = "summon 1d4 wolves"
		81:
			string = "The next attack that hits you deals no damage"
		82:
			string = "The next attack that hits you deals its damage back to the attacker"
		83:
			string = "The next attack that hits you deals double damage"
		84:
			string = "The next attack that hits you deals half damage"
		85:
			string = "The next attack that hits you turns you into a frog"
		86:
			string = "The next attack that hits you turns the attacker in a frog"
		87:
			string = "Summon 1 Small Dragon"
		88:
			string = "Create a black hole"
		89:
			string = "Create a white hole"
		90:
			string = "Level up once"
			lvl_up.emit()
	$Label.text += string

signal lvl_down


func _on_button_4_pressed():
	_reset()
	num = roll_d100()
	match num:
		1:
			string = "Slowly become a statue"
		2:
			string = "All food becomes poisonous to you"
		3:
			string = "You slowly become a tree"
		4:
			string = "You automatically lose all Strength Checks"
		5:
			string = "You take 10 damage for every metre you move"
		6:
			string = "All animals become aggressive towards you"
		7:
			string = "You take 3 poison damage a turn until healed"
		8:
			string = "All your money becomes dirt"
		9:
			string = "Everytime you walk roll a Body Check of 15, if you fail you trip and fall"
		10:
			string = "Any weapons or armour you’re wearing fall off you in a comedic fashion"
		11:
			string = "The nearest 2 enemies ge a free attack on you"
		12:
			string = "Everytime you walk through a doorway you become snagged on some part of it"
		13:
			string = "Everytime you sneeze something embarrassing happens to you"
		14:
			string = "You get a clogged nose and throat"
		15:
			string = "Everytime you speak a soft whistling noise is heard"
		16:
			string = "Everything tastes delicious to you now"
		17:
			string = "Gain 10m of walking speed"
		18:
			string = "You magically find d8 + 2 shimmering crystals"
		19:
			string = "The next attack that is aimed at you auto misses"
		20:
			string = "Lower one targets CC by 3"
		21:
			string = "Turn off one magical spell, enchantment or item of your choosing"
		22:
			string = "Become immune to one type of damage"
		23:
			string = "Automatically succeed any Athletics Checks"
		24:
			string = "Apply any one status effect to a target"
		25:
			string = "Become resistant to fall damage "
		26:
			string = "You can react 3 times for 1 IP"
		27:
			string = "Your next 5 hits are guaranteed to hit"
		28:
			string = "Your next 5 hits are guaranteed crits"
		29:
			string = "You gain +4CC for the rest of the encounter, if you are not in an encounter then it vanishes at the end of your next encounter"
		30:
			string = "You can choose one effect and give it to yourself or another target"
		31:
			string = "Apply levitation to yourself"
		32:
			string = "Explode the nearest two enemies, dealing 40 Fire damage to each"
		33:
			string = "Explode yourself, dealing 40 Fire damage to yourself"
		34:
			string = "Heal equal to your Intelligence Bonus x 2"
		35:
			string = "Heal equal to your Life Bonus x 4"
		36:
			string = "Gain 1 Temporary Health"
		37:
			string = "3 plastic ducks appear"
		38:
			string = "The next thing you touch becomes frozen"
		39:
			string = "1d4 Wolves spawn around you"
		40:
			string = "Change the weather to stormy"
		41:
			string = "Reverse time by 10 seconds"
		42:
			string = "Create a clone of you with 1 LP and 1 HP"
		43:
			string = "Teleport 100m in a direction of your choice"
		44:
			string = "Halve the movement speed of all entities within 50m of you"
		45:
			string = "Reverse the damage types of everything around you (Force → Slashing, Ice → Fire, Psychic → Force, Necrotic → Faith, etc)"
		46:
			string = "Time freezes for everyone but you for 10 seconds"
		47:
			string = "Create a Gravity Well (From The Godhand Book) right by your feet"
		48:
			string = "Throw everyone backwards 15m, take 25 force damage if you hit a wall"
		49:
			string = "Turn into a horse"
		50:
			string = "Turn into a cat"
		51:
			string = "Turn into a bat"
		52:
			string = "Turn into a rat"
		53:
			string = "Become unable to speak Commoner"
		54:
			string = "A house appears around you"
		55:
			string = "An evil Ghost (HP:500 LP:600 BD:12) is spawned besides you and attacks you on sight"
		56:
			string = "Everytime you bleed, floating forest sharks appear to attack you"
		57:
			string = "Now when Frightened, pass out completely for 1 minute"
		58:
			string = "Take 15 Fire damage for every 10 seconds in the sunlight"
		59:
			string = "Become blind"
		60:
			string = "Lose both your arms"
		61:
			string = "All enemies become half their size (Half BD, +2 CC)"
		62:
			string = "All enemies start to float upwards"
		63:
			$Label.text += "lost 1 level!!! (in practice just press lvl up twice)"
			lvl_down.emit()
		64:
			string = "All enemies lose their memory"
		65:
			string = "All enemies lose their equipment"
		66:
			string = "All enemies level up"
		67:
			string = "All enemies duplicate"
		68:
			string = "All enemies lose their legs"
		69:
			string = "All enemies become magical"
		70:
			string = "All enemies become frogs"
		71:
			string = "Turn all melee weapons to ranged and all ranged to melee"
		72:
			string = "Turn all armour to wooden"
		73:
			string = "Extinguish all fire based spells instantly"
		74:
			string = "Drain all water based spells instantly"
		75:
			string = "Reset all entities to level 1"
		76:
			string = "Limit everything's BD to 3"
		77:
			string = "Gain magical armour"
		78:
			string = "Lose all magical items"
		79:
			string = "Turn all items into snakes"
		80:
			string = "summon 1d4 wolves"
		81:
			string = "The next attack that hits you deals no damage"
		82:
			string = "The next attack that hits you deals its damage back to the attacker"
		83:
			string = "The next attack that hits you deals double damage"
		84:
			string = "The next attack that hits you deals half damage"
		85:
			string = "The next attack that hits you turns you into a frog"
		86:
			string = "The next attack that hits you turns the attacker in a frog"
		87:
			string = "Summon 1 Small Dragon"
		88:
			string = "Create a black hole"
		89:
			string = "Create a white hole"
		90:
			string = "Level up once"
			lvl_up.emit()
		91:
			string = "Half the Max HP of all enemies"
		92:
			string = "Limit all enemies to 1 IP"
		93:
			string = "Magic becomes unusable around you"
		94:
			string = "kill any target of your choice"
		95:
			string = "Fourteen golden statues of you are formed around you"
		96:
			string = "You gain infinite flight"
		97:
			string = "Become permanently invisible"
		98:
			string = "Teleport at will an infinite distance"
		99:
			string = "Reroll 5 times and take all 5 at once"
		100:
			string = "Reset back to level 1"
			reset.emit()
	$Label.text += string


signal reset

func _on_button_pressed9() -> void:
	_reset()
	num = roll_d10()
	match num:
		1:
			string = "Item becomes an animal of your choice with 50 hit points and 10 BD, it moves on your IP."
		2: 
			string = "Item erupts into static like fluid into a 10m radius, anything in this radius becomes stumbled."
		3: 
			string = "Item heals you 15 HP when broken"
		4: 
			string = "Item doubles"
		5: 
			string = "Item deals +6 Ice Damage"
		6: 
			string = "Item inverts uses for 1 minute"
		7: 
			string = "Item turns to mist for 3 hours"
		8: 
			string = "Item swaps places with another item you can see"
		9: 
			string = "Item is Upgraded"
		10:
			string = "Item is Downgraded"
	$Label.text += string


func _on_button_pressed10() -> void:
	_reset()
	num = 13 + roll_d20()
	$Label.text += "DMG is " + str(num) + "!!"


func _on_button_pressed11() -> void:
	num = roll_d8()*100
	num2 = roll_d8()*10
	num3 = roll_d8()
	num4 = num + num2 + num3
	match num4:
		111:
			string = "111: Return on investment: Act as if this was never rolled, gaining your 2 IP back"
		123:
			string = "123: Win!: Gain +5 BD until your next turn."
		222:
			string = "222: DOUBLE YOUR DOUBLE YOUR DOUBLE: the next roll made, sextuple the resulting number. Ally or Enemy."
		321:
			string = "321: Loss!: Lose all your BD for 2 minutes!"
		333:
			string = "333: LUCKY NUMBER: The next corruption ability you use, you can control its result."
		444:
			string = "444: Death Number: You fall to 0 Life Points"
		555:
			string = "555: HOT WOMEN NEAR YOU: You call 2 allies to your aid, they are hot women and they are now near you. Each of them has your BD and 2 IP that they can use on their own turn which happens right before and right after you. After 30 seconds your “Free Trial' is up and must either spend your own IP to move them or they vanish."
		666:
			string = "666: THE DEVILS NUMBER: You are Cursed. Everytime you corrupt you now take your own BD in Pure Damage and you lose all immunities and resistances permanently."
		777:
			string = "777: JACKPOT!!!!: You double your BD, you undo all current negative effects (Including THE DEVILS NUMBER!!) you are dealing with from Corrupting, you are now immune to all forms of damage. BD and Immunity return to normal at the end of your 4th turn using this."
		888:
			string = "888: MIAMI: You take a nice vacation, return after a minute with no levels of exhaustion and a cocktail in hand."
		_:
			string = "No Rank Earned! - Take 20 Psychic Damage and gain a level of exhaustion for 1 minute"
	$Label.text += string

extends OptionButton

func check_skills():
	if Global.SP > 0 || Global.mSP > 0 || Global.cSP > 0 || Global.gSP > 0 || Global.mvSP > 0 || Global.dSP > 0 || Global.hSP > 0 || Global.MindSP > 0 || Global.SoulSP > 0 || Global.BodySP > 0 || Global.SoulSP > 0:
		$"../../HBoxContainer/Label2".text = "(skills available)"
	else:
		$"../../HBoxContainer/Label2".text = ""

func check_mind():
	for button in get_tree().get_nodes_in_group("IncreaseMind"):
		if Global.mAP > 0:
			button.disabled = false

func check_body():
	for button in get_tree().get_nodes_in_group("IncreaseBody"):
		if Global.bAP > 0:
			button.disabled = false

func check_soul():
	for button in get_tree().get_nodes_in_group("IncreaseSoul"):
		if Global.sAP > 0:
			button.disabled = false

func movement_update():
	$"../../../../stats/speeds/walk/num".text = str(Global.walk*(Global.military+1))
	$"../../../../stats/speeds/swim/num".text = str(Global.swim)
	$"../../../../stats/speeds/climb/num".text = str(Global.climb)
	$"../../../../stats/speeds/jump/num".text = str(Global.jump)
	if Global.flight:
		$"../../../../stats/speeds/flight/num".text = str(Global.fly)
	$"../../../../stats/speeds/sneak/num".text = str(Global.walk/2 + Global.sneak_buff)

func _update_APs():
	$"../../../../stats/Mind/int/Num".text = str(Global.effint)
	$"../../../../stats/Mind/wis/Num".text = str(Global.effwis)
	$"../../../../stats/Mind/prc/Num".text = str(Global.effprc)
	$"../../../../stats/Mind/stl/Num".text = str(Global.effstl)
	$"../../../../stats/Mind/prs/Num".text = str(Global.effprs)
	$"../../../../stats/Mind/cha/Num".text = str(Global.effcha)
	$"../../../../stats/Body/str/Num".text = str(Global.effstr)
	$"../../../../stats/Body/ath/Num".text = str(Global.effath)
	$"../../../../stats/Body/hlth/Num".text = str(Global.effhlth)
	$"../../../../stats/Soul/fth/Num".text = str(Global.efffth)
	$"../../../../stats/Soul/mgc/Num".text = str(Global.effmgc)
	$"../../../../stats/Soul/life/Num".text = str(Global.efflife)
	$"../../../../stats/Mind/HBoxContainer/Mind".text = str(Global.Mind)
	$"../../../../stats/Body/HBoxContainer/Body".text = str(Global.Body)
	$"../../../../stats/Soul/HBoxContainer/Soul".text = str(Global.Soul)

func _ready():
	connect("item_selected", self._on_item_selected)
	Global.complete_update.connect(update)

func _update_atk():
	$"../../ATK/Label2".text = str(Global.ATK) 
	if Global.fist_atk_buff > 0:
		$"../ATK/Label2".text += "   (bare handed atk is:)" + str(Global.fist_atk_buff)

func update():
	$"../../HP".hp()
	$"../../LP".lp()
	$"../../BD".bd()
	$"../../IPs".ip()
	$"../../CC".changesmaybe()
	$"../../CC".cc()
	$"../../Attributes/APs".primes()
	check_soul()
	check_mind()
	check_body()
	_update_APs()
	movement_update()
	Global.resistance.emit()
	$"../../Copper/amount".text = str(Global.copper)
	check_skills()

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			Global.jump -= 3
			Global.climb -= 2
			Global.HP += 15
			Global.LP += 5
			Global.BD += 1
			Global.AP += 3
			var string = "Ability: Adaptable - Humans are adaptable, they can survive in almost any condition and can change what they focus on when advancing through life. Upon level up you can choose to reposition 1 Attribute Point or Swap Out a Skill with another skill, you do lose all benefits gained by the swapped out skill. Doing this removes any bonus you gained from that point being there."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		1:
			Global.climb -= 3
			Global.swim -= 2
			Global.jump -= 4
			Global.HP += 5
			Global.LP += 10
			Global.IPs += 1
			Global.CC -= 3
			Global.SP += 1
			Global.sAP += 3
			Global.mSP += 3
			var string = "Passive: Lightframe - Witchlings are often lighter than other species, when struck with an attack that rolled Great or above they are knocked to the ground.\n \n Passive: Fragile - Witchlings don’t have as much muscle or as strong bones as humans, their base CC starts at 8. \n \n Passive: Magically Inclined - You can choose 3 Magic Skills and learn them, no matter its requirements."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		2:
			Global.climb += 5
			Global.walk -= 5
			Global.swim += 5
			Global.jump += 5
			Global.HP += 20
			Global.LP += 5
			Global.IPs -= 1
			Global.BD += 3
			Global.Hunteses_BD += 1
			Global.effstr += 1
			Global.effath += 1
			var string = "Patience - Due to their precise and predatory nature, when they attack it has been calculated. Their lack of IP isn't their inability to move or act but their patience and precision. They now can no longer miss attacks, if it’s a miss it automatically becomes a poor. Because of this patience their mind hits a hard limit when it comes to speed in high stress situations, they can no longer go higher than 4 Max IP. \n \n Death In One Blow - When full spending an unarmed attack it becomes a Superior automatically."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		3:
			Global.LP += 5
			Global.walk += 5
			Global.jump += 2
			$"../OptionButton".disabled = false
			$"../OptionButton".visible = true
			var string = "Passive: Elemental Descent - You as a nymph are descended from one of the primordial elements of the universe. A child of the universe itself, choose one of the following elements to gain its bonuses"
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		4:
			Global.climb += 5
			Global.swim += 5
			Global.jump -= 2
			Global.HP += 20
			Global.SP += 1
			Global.AP += 2
			$"../OptionButton2".disabled = false
			$"../OptionButton2".visible = true
			var string = "Passive: Symbiosis - If your party has another animalia, both of you gain one of the bonuses from the species of the other player's species."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		5:
			Global.climb -= 2
			Global.swim -= 5
			Global.jump -= 4
			Global.HP += 15
			Global.BD -= 1
			Global.Constructs += 1
			Global.IPs += 1
			Global.CC += 2
			$"../construct".disabled = false
			$"../construct".visible = true
			$"../../LP".visible = false
			$"../construct_typing".disabled = false
			$"../construct_typing".visible = true
			var string = "Passive: Inorganic - You are not an organic organism, or at least you weren’t intended to end up like this. You are immune to drowning and do not need sleep. \n \n Upgrade: Unnatural Damage - At character creation you can choose what damage type you deal in BD. Magic, Leech, Pure and LP Damage are not accessible to you.\n\nPassive: Wear and Tear - Instead of having health and life you have hit points, a singular bar of HP. When falling to 0 HP instead of dying or falling to a dying state you are reset back to full HP with Worn 1. Everytime you reach 0 you gain a level of wear and tear until you finally collapse into dust. You can recover a total of 1 Level of Wear and Tear per long rest, and each level does something different:
Worn 1: -5 to all rolls.
Torn 1: Half movement speed and -1 Max IP.
Worn 2: Become weak to all damage types.
Torn 2: Half your Max HP.
Worn 3: Character Death.\n\nPassive: Healthless - Since you are a construct you are not biological, putting points into Health or Life gives you a +10 to your HP and does not increase like the health attribute usually does.\n\nUpgrade: Constructed to be perfect - Gain +2 CC.\n\nPassive: Self Upgrade - Every third level you gain an additional Upgrade Point. You can spend this point to give yourself +1 Attribute Point, +1 BD or +10 HP.\n\nOptional Subspecies Bonus:
Fragile - +10 in all movement, -3 CC.
Durable - +20 HP, +1 CC, Moving Interaction costs 2 IP now.
Fluid - +5m range on all melee attacks, +1 free dodge a round, -4 CC"
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		6:
			Global.HP += 15
			Global.BD += 2
			Global.swim -= 5
			Global.jump -= 2
			Global.walk -= 5
			Global.fire_res += 1
			Global.SP += 1
			Global.AP += 1
			Global.effprs += 1
			Global.cSP += 2
			$"../../BD/typing".text = "(Fire)"
			var string = "Passive: Featherless Wings - As a Demonica you have wings upon birth but unlike other flight based creatures they are underdeveloped and so cannot lift you off the ground. Your wings flight speed is equal to your swimming speed which starts off both at 0.\n\nAbility: Possession - If you roll a great in a Persuasion challenge against a target that you can see, you can leave your body and become a spirit-like form that dances through the air. You can now control the target for exactly 1 IP but this costs your entire turn, you cannot return to your body until the beginning of your next turn meaning your body is completely open to be attacked. In this form your CC is lowered by 4 as you have dropped your guard.\n\nPassive: Leeching Lifeforce - When healing another target, only heal them half and heal yourself the missing half."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
			$"../demonica subspecies".visible = true
			$"../demonica subspecies".disabled = false
		7:
			Global.HP += 5
			Global.LP += 15
			Global.BD += 1
			Global.climb += 5
			Global.SP += 1
			Global.AP += 2
			Global.fam += 2
			$"../../BD/typing".text = "(Holy/Faith)"
			var string = "Ability: Unfurl - You can unfurl your wings allowing you to fly equal to your swimming speed\n\nDetriment: Angelic Justice - If you harm a target while your wings are unfurled, you lose access to them for 24 hours.\n\nPassive: Holy is the Angel - You no longer gain any IP debuffs from falling to 0 HP.\n\nPassive: Dare not sin - When people are trying to deceive you, they roll Sabotaged dice.\n\nPassive: Revenge to the Sinful - When attacking an enemy which had struck an ally of yours within the last 10 seconds, roll Rigged Dice."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
			$"../archangelica".visible = true
		8:
			Global.HP += 30
			Global.LP += 35
			Global.BD += 1
			Global.IPs -= 1
			Global.Soul += 2
			Global.SP += 2
			Global.AP += 2
			var string = "Upgrade: Limitless Vessel (NON-FUNCTIONAL) - Witches can take 2 Domains. Gaining the first 10 levels of each chosen Domain alongside each other. After level 10 upon level up you must choose which Domain to gain a level in, you still only reach a max level of 30.

Ability: Natural Enchantress - You can spend 20 minutes to imbue one item a day with an enchantment without the need for special tools or enchanting stones."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		9:
			Global.Undead += 1
			Global.HP += 20
			Global.BD += 1
			Global.walk -= 3
			Global.climb -= 3
			Global.swim -= 3
			Global.jump -= 4
			Global.SP += 1
			Global.AP += 1
			Global.dark_vis += 30
			$"../../BD/typing".text = "(Necrotic)"
			var string = "Passive: IT’S ALIVE! - You now only have a maximum of 1 Life Point, making it easier to fall to 0 LP but now making it far easier to be resurrected.
\nPassive: The Dead Do Not Tire - You now do not feel the effects of exhaustion until it hits level 10. Where it will then act as if you hit level 1. You also will heal 1 level of exhaustion after every battle. Reaching level 20 still imposes serious issues however, you just don’t feel its effects.
"
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		10:
			Global.HP += 10
			$"../scaveger_mods".disabled = false
			$"../scaveger_mods".visible = true
			var string = "Passive: I didn’t need that - Scavs are immune to injuries and resistant to all physical status effects (Stun, Dizzy, Unconscious, Paralysed, Disfigured)

Passive: Living Tapestry - Scavs are made up of many body parts, some come from legendary hunters and some come from uncle bob. Your mind can even have some parts replaced. Instead of choosing 1 singular"
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		11:
			Global.HP += 5
			Global.LP += 5
			var string = "Passive: Smarter not Harder - Husks can no longer gain damage immunities, but now they can apply half, rounded down, of their Prime Attribute Bonus to all Attributes in that category that have no points spent in them.

Passive: Queen of their Craft - At character creation you gain +2 Expertise."
			$"../../BGs/Backgrounds".disabled = true
			$"../husk_bg".visible = true
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
		12:
			Global.Fibrosian += 1
			Global.HP -= 5
			Global.LP += 35
			Global.BD -= 2
			Global.IPs += 1
			var string = "Passive: Photosynthesis - If you are in direct sunlight for an hour, gain +10 Temporary Health.\n\nPassive: More Mature - Fibrosians reach maturity incredibly quickly so when levelling up they gain no extra points in healing but +20 Max Life.\n\nPassive: Temporary Permanence - Unlike in other species Fibrosians gain no loss in IP when on life points as long as they have Temporary Health equal to at least half their Max Life Points.\n\nRoot - Set your movement to 0 as you plant yourself into the ground, while in this state you have a +2 to hit, takes 1 IP to unroot yourself.\n\nAbsorb - Spend 3 IP to absorb nutrients from the ground and gain +25 Temporary Health."
			$"../../../VBoxContainer2/ScrollContainer".ability(string)
			$"../fibrosian stuffs".visible = true
			Global.complete_update.emit()
	update()
#var HP = 10
#var LP = 5
#var BD = 3
#var IPs = 3
#var walking = 10
#var swim = 5
#var jump = 5
#var climb = 5

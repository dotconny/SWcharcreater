extends OptionButton

var string

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			visible = false
		1:
			string = "Trickster - You can control a target for 3 IP but you skip your next turn."
			$"../../../ScrollContainer".ability(string)
		2:
			Global.BD += 4
			string = "Passive: Featherless Wings - As a Demonica you have wings upon birth but unlike other flight based creatures they are underdeveloped and so cannot lift you off the ground. Your wings flight speed is equal to your swimming speed which starts off both at 0."
			$"../../../ScrollContainer".remove(string)
			string = "Ability: Possession - If you roll a great in a Persuasion challenge against a target that you can see, you can leave your body and become a spirit-like form that dances through the air. You can now control the target for exactly 1 IP but this costs your entire turn, you cannot return to your body until the beginning of your next turn meaning your body is completely open to be attacked. In this form your CC is lowered by 4 as you have dropped your guard."
			$"../../../ScrollContainer".remove(string)
			string = "\n"
			var num = $"../../../ScrollContainer/Label".text.find("\n")
			$"../../../ScrollContainer".splice(string,num)
			string = "Enraged - You gain +4 BD but lose your wings and possession ability."
			$"../../../ScrollContainer".ability(string)
		3:
			Global.walk += 10
			Global.BD += 1
			string = "\nAbility: Possession - If you roll a great in a Persuasion challenge against a target that you can see, you can leave your body and become a spirit-like form that dances through the air. You can now control the target for exactly 1 IP but this costs your entire turn, you cannot return to your body until the beginning of your next turn meaning your body is completely open to be attacked. In this form your CC is lowered by 4 as you have dropped your guard.\n"
			$"../../../ScrollContainer".remove(string)
			string = "\n"
			var num = $"../../../ScrollContainer/Label".text.find("\n")
			$"../../../ScrollContainer".splice(string,num-4)
			string = "Imp - Gain +10 movement and +1 BD, cannot possess"
			$"../../../ScrollContainer".ability(string)
		4:
			string = "Wanderer - Can posses on successful rolls, only can use it on life points"
			var old = "roll a great"
			var new = "succeed"
			$"../../../ScrollContainer".new_splice(old, new)
		5:
			string = "Archangelica - Half Demonica, Half Angelica. As an Archangelica you gain some bonuses from both species. You now no longer lose IP when falling to life points but gain a weakness to both Fire and Holy/Faith damage and no longer have access to your flight however you now roll Rigged in all conversational checks and challenges."
			$"../../../ScrollContainer".ability(string)
			Global.fire_res -= 2
			Global.faith_res -= 1
	$"../SpeciesOption".update()

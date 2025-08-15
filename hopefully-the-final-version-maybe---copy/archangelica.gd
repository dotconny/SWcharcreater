extends OptionButton

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			visible = false
		1:
			var string = "\nPassive: Holy is the Angel - You no longer gain any IP debuffs from falling to 0 HP.\n"
			$"../../../ScrollContainer".remove(string)
			Global.fire_res += 1
			string = "Archdemonica - Half Demonica, Half Angelica. As an Archdemonica you gain some bonuses from both species, you lose IP when falling to life points now but lose your Weakness to Fire, your BD increases to 5 and you gain the Possession ability in the form of:

Ability: Holy Temptation - if you roll a great in a Faith Challenge against a target you can see they become instantly charmed by you and no longer wish to harm you. This charm continues even after they are damaged by other creatures and will only vanish if you strike them 3 times or try to charm another figure or if they beat a mind check of 26.
"
			$"../../../ScrollContainer".ability(string)

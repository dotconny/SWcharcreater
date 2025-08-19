extends HBoxContainer


var num

func _ready():
	$Label2.text = "Neutral"
	$minus.pressed.connect(minus)
	$plus.pressed.connect(plus)
	$imm.pressed.connect(imm)
	for button in get_tree().get_nodes_in_group("resistance"):
		button.pressed.connect(update)
	for button in get_tree().get_nodes_in_group("weaknesss"):
		button.pressed.connect(update)
	for button in get_tree().get_nodes_in_group("immunity"):
		button.pressed.connect(update)



func update():
	num = Global.faith_res
	match num:
		0:
			$Label2.text = "Neutral"
		1:
			$Label2.text = "Resisted"
		2:
			$Label2.text = "immune"
		-1:
			$Label2.text = "weakness"
		_:
			if num > 2:
				pass
			elif num < -1:
					$Label2.text = str(-2*num) + "x weakness"

func minus():
	Global.faith_res -= 1
func plus():
	Global.faith_res += 1
func imm():
	Global.faith_res += 2

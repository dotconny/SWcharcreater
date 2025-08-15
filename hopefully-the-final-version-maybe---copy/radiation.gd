extends HBoxContainer

var num

func _ready():
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
	num = Global.radiation_res
	match num:
		0:
			$Label2.text = "Neutral"
		1:
			$Label2.text = "Resisted"
		2:
			$Labe2.text = "immune"
		-1:
			$Label2.text = "weakness"
		_:
			if num > 2:
				pass
			elif num < -1:
					$Label2.text = str(-2*num) + "x weakness"

func minus():
	Global.radiation_res -= 1
func plus():
	Global.radiation_res += 1
func imm():
	Global.radiation_res += 2
	

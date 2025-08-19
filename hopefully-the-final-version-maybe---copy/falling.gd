extends HBoxContainer

var num

func _ready():
	$Label2.text = "Neutral"
	$minus.pressed.connect(minus)
	$plus.pressed.connect(plus)
	$imm.pressed.connect(imm)
	Global.resistance.connect(update)

func update():
	num = Global.falling_res
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
	Global.falling_res -= 1
	update()

func plus():
	Global.falling_res += 1
	update()

func imm():
	Global.falling_res += 2
	update()

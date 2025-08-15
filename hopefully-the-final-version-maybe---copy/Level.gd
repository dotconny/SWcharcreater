extends HBoxContainer

func ready():
	$Num.text = str(Global.LV)

func on():
	$Increase.disabled = false
	print("huh")

func update_label():
	$Num.text = str(Global.LV)


func _on_increase_pressed():
	Global.LV += 1
	if Global.Fibrosian == 1:
		if Global.moss:
			Global.AP += 1
			Global.LVHP += 15
		else:
			Global.AP += 1
			Global.LVLP += 20
	else:
		if Global.Constructs == 1:
			Global.AP += 1
			if Global.LV%3 == 0:
				Global.AP += 1
			Global.LVHP += 10
		else:
			Global.AP += 1
			Global.LVHP += 10
			Global.LVLP += 5
	Global.BD += 1 + Global.Hunteses_BD*((Global.LV)%2)
	$"../Species/SpeciesOption".update()
	update_label()

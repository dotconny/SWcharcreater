extends HBoxContainer

func ready():
	$Num.text = str(Global.LV)
	$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer".lvl_up.connect(_on_increase_pressed)
	$"../../../../../CORRPTORTABLE/HBoxContainer/VBoxContainer".lvl_down.connect(buffer)
	$"../savenload".postsavelv1.connect(lv1lvlup)

var buffernum = 0

signal savelv1

func buffer():
	buffernum += 1

#func on():
#	$Increase.disabled = false

func update_label():
	$Num.text = str(Global.LV)

func lv1lvlup():
	if !buffernum == 1:
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
	else:
		buffernum -=1
	update_label()
	$"../Species/SpeciesOption".update()

func _on_increase_pressed():
	if !Global.LV == 1:
		if !buffernum == 1:
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
		else:
			buffernum -=1
	else:
		savelv1.emit()
		if !buffernum == 1:
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

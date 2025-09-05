extends VBoxContainer

var intelligence = 0
var wisdom = 0
var prcep = 0
var stl = 0
var prsu = 0
var charis = 0
var str = 0
var athl = 0
var lif = 0
var magc = 0
var fth = 0
var string

func connectors():
	for button in get_tree().get_nodes_in_group("int"):
		button.pressed.connect(intel)
	for button in get_tree().get_nodes_in_group("wis"):
		button.pressed.connect(wis)
	for button in get_tree().get_nodes_in_group("prc"):
		button.pressed.connect(prc)
	for button in get_tree().get_nodes_in_group("prs"):
		button.pressed.connect(prs)
	for button in get_tree().get_nodes_in_group("cha"):
		button.pressed.connect(cha)
	for button in get_tree().get_nodes_in_group("ath"):
		button.pressed.connect(ath)
	for button in get_tree().get_nodes_in_group("str"):
		button.pressed.connect(strength)
	for button in get_tree().get_nodes_in_group("mgc"):
		button.pressed.connect(mgc)
	for button in get_tree().get_nodes_in_group("life"):
		button.pressed.connect(lifesignal)
	for button in get_tree().get_nodes_in_group("fth"):
		button.pressed.connect(faith)


func _ready():
	for button in get_tree().get_nodes_in_group("PLUS"):
		button.pressed.connect(more)
	for button in get_tree().get_nodes_in_group("MINUS"):
		button.pressed.connect(doit)
	connectors()
	for button in get_tree().get_nodes_in_group("skilladd"):
		button.visible = false

func reroll_update():
	if Global.reroll == 1:
		string = "rerolls = " + str(Global.reroll)
		$HBoxContainer/VBoxContainer2/ScrollContainer.ability(string)
	else:
		if Global.reroll == 0:
			string = "rerolls = " + str(Global.effprsu)
			$HBoxContainer/VBoxContainer2/ScrollContainer.remove(string)
		else:
			var new = "rerolls = " + str(Global.reroll)
			var old = "rerolls = " + str(prsu)
			$HBoxContainer/VBoxContainer2/ScrollContainer.new_splice(old,new)

func update_label():
	$HBoxContainer/VBoxContainer/ATK/Label2.text = str(Global.ATK)

func lifesignal():
	if Global.efflife%2 == 0:
		if lif < Global.efflife:
			Global.BD += 2
		else:
			Global.BD -= 2
	lif = Global.efflife
	$HBoxContainer/VBoxContainer/BD.bd()
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func intel():
	if Global.effint%2 == 0:
		if Global.effint > intelligence:
			Global.fam += 1
		else:
			Global.fam -= 1
	if Global.effint%5 == 0:
		if Global.effint > intelligence:
			Global.exper += 1
	else:
		Global.exper -= 1
	intelligence = Global.effint
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func wis():
	if Global.effwis%2 == 0:
		if Global.effwis > wisdom:
			Global.SP += 1
		else:
			Global.SP -= 1
	wisdom = Global.effwis
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func prc():
	if Global.effprc%2 == 0:
		if Global.effprc > prcep:
			Global.cs += 2
			Global.range += 5
		else:
			Global.cs -= 2
			Global.range -= 5
	prcep = Global.effprc
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()


func cha():
	if Global.effcha == 5 || Global.effcha == 15 || Global.effcha == 30:
		if Global.effcha > charis:
			Global.IPs += 1
		else:
			Global.IPs -= 1
	charis = Global.effcha
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func strength():
	if Global.effstr > str:
		Global.lift += 20
	else:
		Global.lift -= 20
	str = Global.effstr
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func prs():
	if Global.effprs > prsu:
		Global.reroll += 1
	else:
		Global.reroll -=1
	reroll_update()
	prsu = Global.effprs
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func ath():
	if Global.effath > athl:
		Global.move_i += 5
		for button in get_tree().get_nodes_in_group("move_mod"):
			button.visible = true
		if Global.flight == true:
			$stats/speeds/flight/plus.visible = true
	else:
		if Global.effath < athl:
			Global.move_i -= 5
			for button in get_tree().get_nodes_in_group("move_minus"):
				button.visible = true
			if Global.flight:
				$stats/speeds/flight/minus.visible = true
	athl = Global.effath
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func mgc():
	if Global.effmgc %2 == 0:
		if Global.effmgc > magc:
			Global.fl_mana += 1
		elif Global.effmgc < magc:
			Global.fl_mana -= 1
	magc = Global.effmgc
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func faith():
	if Global.efffth%2 == 0:
		if Global.efffth > fth:
			Global.temp_ip += 1
		elif Global.efffth < fth:
			Global.temp_ip -= 1
	fth = Global.efffth
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func ap_mod():
	if Global.effint%2 == 0:
		Global.fam += 1
	if Global.effint%5 == 0:
		Global.exper += 1
	if Global.effwis%2 == 0:
		Global.SP += 1
	if Global.effprc %2 == 0:
		Global.cs += 2
		Global.range += 5
	if Global.efffth %2 == 0:
		Global.temp_ip += 1
	if Global.effmgc %2 == 0:
		Global.fl_mana += 1
	if Global.efflife %2 == 0:
		Global.BD += 2
		$HBoxContainer/VBoxContainer/BD.bd()
	$HBoxContainer/VBoxContainer/Species/SpeciesOption.update()

func more():
	Global.the_variable()
	$HBoxContainer/VBoxContainer/Attributes/APs.primes()
	update_label()

func doit():
	Global.the_variable()
	update_label()

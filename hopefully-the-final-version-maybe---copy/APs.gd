extends Label

func _ready():
	Global.connect("score_changed", _on_score_changed)
	text = str(Global.AP) 
	for button in get_tree().get_nodes_in_group("PLUS"):
		button.disabled = true

func check_primes():
	for button in get_tree().get_nodes_in_group("IncreaseMind"):
		if Global.mAP > 0:
			button.disabled = false
	for button in get_tree().get_nodes_in_group("IncreaseBody"):
		if Global.bAP > 0:
			button.disabled = false
	for button in get_tree().get_nodes_in_group("IncreaseSoul"):
		if Global.sAP > 0:
			button.disabled = false

func _plus_disable():
	for button in get_tree().get_nodes_in_group("PLUS"):
		if Global.AP == 0:
			button.disabled = true
	check_primes()

func _plus_enable():
	for button in get_tree().get_nodes_in_group("PLUS"):
		if Global.AP > 0:
			button.disabled = false

func _minus_enable():
	for button in get_tree().get_nodes_in_group("MINUS"):
		if Global.AP < 0:
			button.disabled = false

func _minus_disable():
	for button in get_tree().get_nodes_in_group("MINUS"):
		if Global.AP == 0:
			button.disabled = true

func primes():
	$"../Label2".text = str(Global.mAP)
	$"../Label4".text = str(Global.bAP)
	$"../Label6".text = str(Global.sAP)

func _enablers():
	_plus_enable()
	_plus_disable()
	_minus_disable()
	_minus_enable()
	check_primes()
	$"../../CC".changesmaybe()
	primes()

func _on_score_changed(new_score):
	text = str(new_score)
	_enablers()

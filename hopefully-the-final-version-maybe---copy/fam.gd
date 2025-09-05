extends HBoxContainer

var value

var ID = 0
var factor = 1
@export var meta: String
@export var namez: String

func _ready():
	$Label.text = namez

func _change(meta, ID, factor):
	print(str(Global.get(meta)))
	Global.set(meta,Global.get(meta)+factor) 
	print(str(Global.get(meta)))

func _on_fam_pressed():
	$fam.disabled = true
	ID = 1
	_change(meta,ID,factor)

func _on_exp_pressed():
	$exp.disabled = true
	$fam.disabled = true
	print(str(ID))
	if ID == 1:
		pass
	else:
		factor = 2
	ID = 2
	_change(meta,ID,factor)

func _on_mas_pressed():
	$exp.disabled = true
	$fam.disabled = true
	$mas.disabled = true
	if ID == 1:
		factor = 2
	elif ID == 2:
		factor = 1
	else:
		factor = 3
	ID += 1
	_change(meta,ID,factor)

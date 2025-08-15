extends Button

func _ready():
	pressed.connect(_on_pressed)

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.prc -= 1
	Global.effprc -= 1
	Global.AP += 1
	update(Global.effprc)

extends Button
func _ready():
	pressed.connect(_on_pressed)

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.wis -= 1
	Global.effwis -= 1
	Global.AP += 1
	update(Global.effwis)

extends Button

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.cha += 1
	Global.effcha += 1
	$"../Num".text = str(Global.effcha)

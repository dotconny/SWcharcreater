extends Button

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.intel += 1
	Global.effint += 1
	update(Global.effint)

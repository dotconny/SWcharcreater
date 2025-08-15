extends Button

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.prc += 1
	Global.effprc += 1
	update(Global.effprc)

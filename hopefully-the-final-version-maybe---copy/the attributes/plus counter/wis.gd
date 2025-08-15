extends Button

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.wis += 1
	Global.effwis += 1
	update(Global.effwis)

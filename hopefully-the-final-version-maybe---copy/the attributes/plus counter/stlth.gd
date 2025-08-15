extends Button

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.stl += 1
	Global.effstl += 1
	update(Global.effstl)

extends Button

func update(num):
	$"../Num".text = str(num)

func _on_pressed():
	Global.prs += 1
	Global.effprs += 1
	update(Global.effprs)

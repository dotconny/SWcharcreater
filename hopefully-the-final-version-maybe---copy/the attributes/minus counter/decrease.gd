extends Button

func update(num):
	$"../Num".text = str(num)

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	Global.intel -= 1
	Global.effint -= 1
	Global.AP += 1
	update(Global.effint)

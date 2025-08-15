extends Button

func _ready():
	self.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var roll = randi() % 20 + 1 + Global.effstl
	$"../d20".text = str(roll)
	$"../atk_roll".text = str(roll + Global.ATK)

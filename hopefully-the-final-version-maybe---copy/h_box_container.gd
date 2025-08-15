extends HBoxContainer

var number := 0

# Called when the node enters the scene tree for the first time.
func ready():
	$Num.text = str(number)


func update_label():
	$Num.text = str(number)



func _on_increase_pressed():
	number += 1
	Global.AP -= 1
	update_label()



func _on_decrease_pressed():
	number -= 1
	Global.AP += 1
	update_label()



func _on_roll_pressed():
	var roll = randi() % 20 + 1 + number
	$d20.text = str(roll)
	$atk_roll.text = str(roll + Global.ATK)

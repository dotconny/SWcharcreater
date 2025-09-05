extends VBoxContainer


@export var nam: String
@export var cost: String
@export var bonus: int
@export var type: String
@export var range: String
@export var desc: String
@export var check: int

func _ready():
	$Name/Label.text = nam
	$Cost/Label.text = cost
	$Bonus/Label.text = str(bonus)
	$Bonus/dmg.text = "Dmg: " + str(bonus+Global.BD)
	$Class/Label.text = type
	#$Check/Label.text =
	$Range/Label.text = range
	$Description/Label.text = desc

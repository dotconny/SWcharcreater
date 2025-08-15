extends HBoxContainer

var f_buff = 0

var cc_b = 0

func _ready():
	for button in get_tree().get_nodes_in_group("PLUS"):
		button.pressed.connect(cc)
	for button in get_tree().get_nodes_in_group("STATMOD"):
		button.pressed.connect(changesmaybe)

func cc():
	$Label2.text = str(Global.CC + f_buff)
	$Label.text = str(Global.CC + f_buff + cc_b) + "(Unarmoured)"

func changesmaybe():
	var stat_buff = [Global.Mind, Global.Body, Global.Soul]
	stat_buff.sort()
	stat_buff.reverse()
	print(stat_buff)
	f_buff = stat_buff[2]*2
	cc()

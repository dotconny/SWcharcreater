extends Button


func _pressed():
	$"../../..".visible = false
	$"../../../../NinePatchRect".visible = true

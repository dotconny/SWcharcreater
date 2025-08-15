extends ScrollContainer

func ability(string):
	$Label.text += "\n" + string + "\n"

func remove(string):
	$Label.text = $Label.text.replace(string, "")

func splice(string, num):
	$Label.text = $Label.text.substr(0, num) + $Label.text.substr(num + 4)

func replace(old, new):
	$Label.text.replace(old, new)

func new_splice(old, new):
	var sample = $Label.text.find(old)
	$Label.text = $Label.text.substr(0, sample) + new + $Label.text.substr(sample + old.length(), $Label.text.length())

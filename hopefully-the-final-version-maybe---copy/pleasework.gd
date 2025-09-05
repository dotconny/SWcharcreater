extends Control

var idforhopeful = []
var i = 0

func _ready():
	$NinePatchRect/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Button.changeskills.connect(hopeful)

func hopeful():
	idforhopeful.resize($fams_skills/HBoxContainer/skills/ScrollContainer/skills/VBoxContainer.get_children().size())
	for i in $fams_skills/HBoxContainer/skills/ScrollContainer/skills/VBoxContainer.get_children().size():
		for meow in $fams_skills/HBoxContainer/skills/ScrollContainer/skills/VBoxContainer.get_child(i).get_children():
			if meow is Label:
				meow.autowrap_mode = true
				if idforhopeful[i] != 1:
					meow.text+= "\n"
					idforhopeful[i] = 1

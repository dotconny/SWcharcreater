extends Button

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			visible = false
		1:
			$"../../BGs".num += 1
			Global.old_h += 1
			$"../../BGs/Backgrounds".disabled = false

extends OptionButton

func _ready():
	connect("item_selected", self._on_item_selected)

func _on_item_selected(index):
	disabled = true
	match index:
		0:
			$"../../BD/typing".text = "(Force)"
		1:
			$"../../BD/typing".text = "(Fire)"
		2:
			$"../../BD/typing".text = "(Acid)"
		3:
			$"../../BD/typing".text = "(Ice)"
		4:
			$"../../BD/typing".text = "(Slash/Pierce)"
		5:
			$"../../BD/typing".text = "(Electric)"
		6:
			$"../../BD/typing".text = "(Necrotic)"
		7:
			$"../../BD/typing".text = "(Faith)"
		8:
			$"../../BD/typing".text = "(Poison)"
		9:
			$"../../BD/typing".text = "(Psychic)"
		10:
			$"../../BD/typing".text = "(Radiation)"
		11:
			$"../../BD/typing".text = "(Light)"

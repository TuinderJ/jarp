extends MarginContainer

@onready var icon: TextureRect = %Icon
@onready var count: Label = %Count

var slot: Slot

func display() -> void:
	icon.texture = slot.item.inventory_icon
	if slot.quantity > 1:
		count.text = str(slot.quantity)
	icon.tooltip_text = "%s\n%s" % [slot.item.name.capitalize(), slot.item.description]

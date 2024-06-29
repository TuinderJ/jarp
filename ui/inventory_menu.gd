extends Control
class_name InventoryMenu

@export var slot_scene: PackedScene

@onready var inventory_container: GridContainer = %InventoryContainer

var minimun_slot_count = 30

func reset_inventories(inventory: Inventory) -> void:
	clear_inventories()
	populate_inventory(inventory)
	hide()
	call_deferred("set_visible", true)

func clear_inventories() -> void:
	for child in inventory_container.get_children():
		child.free()

func populate_inventory(inventory: Inventory) -> void:
	for slot in inventory.slots:
		var new_slot = slot_scene.instantiate()
		inventory_container.add_child(new_slot)
		new_slot.slot = slot
		new_slot.display()
	while inventory_container.get_child_count() < minimun_slot_count:
		var new_slot = slot_scene.instantiate()
		inventory_container.add_child(new_slot)

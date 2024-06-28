extends Control
class_name InventoryMenu

@export var slot_scene: PackedScene

@onready var equipment_container: GridContainer = %EquipmentContainer
@onready var consumables_container: GridContainer = %ConsumablesContainer
@onready var resources_container: GridContainer = %ResourcesContainer

var minimun_slot_count = 30

func reset_inventories(inventory: PlayerInventory) -> void:
	clear_inventories()
	populate_inventories(inventory)
	hide()
	call_deferred("set_visible", true)

func clear_inventories() -> void:
	for child in equipment_container.get_children():
		child.free()
	for child in consumables_container.get_children():
		child.free()
	for child in resources_container.get_children():
		child.free()

func populate_inventories(inventory: PlayerInventory) -> void:
	for slot in inventory.equipment_inventory:
		var new_slot = slot_scene.instantiate()
		equipment_container.add_child(new_slot)
		new_slot.slot = slot
		new_slot.display()
	while equipment_container.get_child_count() < minimun_slot_count:
		var new_slot = slot_scene.instantiate()
		equipment_container.add_child(new_slot)
	
	for slot in inventory.consumables_inventory:
		var new_slot = slot_scene.instantiate()
		consumables_container.add_child(new_slot)
		new_slot.slot = slot
		new_slot.display()
	while consumables_container.get_child_count() < minimun_slot_count:
		var new_slot = slot_scene.instantiate()
		consumables_container.add_child(new_slot)
	
	for slot in inventory.resources_inventory:
		var new_slot = slot_scene.instantiate()
		resources_container.add_child(new_slot)
		new_slot.slot = slot
		new_slot.display()
	while resources_container.get_child_count() < minimun_slot_count:
		var new_slot = slot_scene.instantiate()
		resources_container.add_child(new_slot)

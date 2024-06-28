extends Resource
class_name Item

## Base class for an item. Items shouldn't be created directly from this. You should use the specific types of items such as Armor, Food, etc.

@export var name: String ## Written in snake_case.
@export_multiline var description: String ## This will be the information displayed to the player.
@export var weight: int = 0 ## How much the item weighs when in the player's inventory.
@export var inventory_icon: Texture2D ## This will be the icon displayed in things like the inventory, shops, etc.

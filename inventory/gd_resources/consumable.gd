extends StackableItem
class_name Consumable
## Base class for any food item.

@export_enum("Food", "Potion") var type ## Weather the item is considered food or a potion.
@export var stat_boosts: Array[StatBoost] ## A list of stats that will be increased when the food is consumed.

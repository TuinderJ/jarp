extends Resource
class_name StatSheet

@export_group("Information")
@export var name: String
@export_enum("Add", "Mini-Boss", "Boss", "Elite") var type = "Add"
@export_group("Combat")
@export_range(1, 1, 1, "or_greater") var health: int = 1
@export var damage: int
@export var armor: int

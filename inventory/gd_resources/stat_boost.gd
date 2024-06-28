extends Resource
class_name StatBoost

@export_enum("Max Health", "Armor", "Max Stamina", "Stamina Regen", "Damage Boost Percent") var stat = "Armor" ## The stat that is being effected.
@export var value: int = 0 ## The amount a stat will be increased by.

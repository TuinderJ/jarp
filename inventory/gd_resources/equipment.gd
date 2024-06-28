extends Item
class_name Equipment

@export var stat_boosts: Array[StatBoost] = [] ## A list of stats that will be increased when the armor is worn.
@export var on_hit_effects: Array[OnHitEffect] = [] ## A list of effects that happen when the player hits something with a weapon attack.
@export var abilities: Array[Ability] = [] ## A list of abilities that the player will have access to when the armor is worn.

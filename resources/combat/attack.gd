class_name Attack extends Resource

@export var damage: float
#@export var knockback: float

func calculate_damage() -> float: #"target" argument to change damage for its attributes
	return damage

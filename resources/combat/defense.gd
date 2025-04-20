class_name Defense extends Resource

@export var flat_defense: float

func defend(attack: Attack) -> float:
	var damage_received = attack.calculate_damage()
	damage_received -= flat_defense
	return damage_received

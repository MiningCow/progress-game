class_name Hurtbox extends Area2D

@export var actor: Node2D
@export var health_stat: Stat
@export var defense: Defense #this way an enemy can have weak spots with different defense

func hurt(attack: Attack, _attacker: Node2D): #attacker can be used to calculate knockback
	take_damage.rpc_id(1, defense.defend(attack))

@rpc("call_local", "any_peer")
func take_damage(amount: float):
	health_stat.value -= amount

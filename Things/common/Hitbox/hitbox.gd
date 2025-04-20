class_name Hitbox extends Area2D

@export var actor: Node2D
@export var attack: Attack #temporary, will probably come from the weapon root

func _on_area_entered(hurtbox: Area2D):
	assert(hurtbox is Hurtbox)
	(hurtbox as Hurtbox).hurt(attack, actor)

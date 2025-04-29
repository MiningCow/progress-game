class_name Hitbox extends Area2D

@export var actor: Node2D
@export var attack: Attack #temporary, will probably come from the weapon root

func _enter_tree():
	set_multiplayer_authority(actor.get_multiplayer_authority())

func _on_area_entered(hurtbox: Area2D):
	if not is_multiplayer_authority(): return

	assert(hurtbox is Hurtbox)
	(hurtbox as Hurtbox).hurt(attack, actor)

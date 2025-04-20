@tool
class_name ItemDropperComponent extends Node2D

@export var health: HealthStat:
	set(value):
		health = value
		update_configuration_warnings()
@export var item_stack: ItemStack

func _ready():
	if Engine.is_editor_hint(): return
	assert(health)
	if not item_stack: return
	health.died.connect(
		func(): Globals.world.drop_item(item_stack, global_position)
	)


func _get_configuration_warnings():
	if health == null: return ["Missing health stat!"]

extends StaticBody2D

@export var drops: ItemStack

func _on_health_changed(value):
	if value <= 0.0:
		Globals.world.drop_item(drops, position)
		queue_free()

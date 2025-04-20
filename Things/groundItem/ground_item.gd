@tool
class_name GroundItem extends Node2D

@export var item_stack: ItemStack:
	set(value):
		item_stack = value
		_on_itemstack_changed()
		if item_stack == null: return
		item_stack.changed.connect(_on_itemstack_changed)

func _on_itemstack_changed():
	if Engine.is_editor_hint(): update_configuration_warnings()
	if item_stack and item_stack.item and item_stack.item.texture:
		$Sprite.texture = item_stack.item.texture



func _on_interacted(actor: Node):
	var actor_inventory := get_node_inventory(actor)
	assert(actor_inventory != null)
	actor_inventory.add_item(item_stack)
	queue_free()

func get_node_inventory(node: Node) -> Inventory: #Generalize into a util function
	for child in node.get_children():
		if child is Inventory: return child

	return null

func _get_configuration_warnings():
	var warnings: Array[String] = []
	if item_stack == null:
		warnings.append("Missing an ItemStack!")
	elif item_stack.item == null:
		warnings.append("ItemStack is missing an Item!")
	return warnings

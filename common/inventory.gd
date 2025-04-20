class_name Inventory extends Node

@export var _items: Array[ItemStack]

func get_items() -> Array[ItemStack]:
	return _items

func has_item(id: String, quantity = null) -> bool:
	if _items.any(func(stack: ItemStack):
		if stack.item.id != id: return false
		if quantity != null and stack.quantity >= quantity: return true
		return false
	): return true
	return false

func add_item(item_stack: ItemStack):
	var existing_stack_index = find_stack_of(item_stack.item.id)
	if existing_stack_index != -1 and _items[existing_stack_index].add_stack(item_stack):
		return
	_items.append(item_stack)

func remove_item(item: Item, quantity: int, all: bool = false) -> bool:
	var stack_index = find_stack_of(item.id)
	if stack_index == -1: return false
	if all:
		_items.pop_at(stack_index)
		return true
	_items[stack_index].subtract(quantity)
	return true

func find_stack_of(id: String) -> int:
	return _items.find_custom(func(item_stack: ItemStack): return item_stack.item.id == id)

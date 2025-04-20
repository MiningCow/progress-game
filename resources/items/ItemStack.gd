@tool
class_name ItemStack extends Resource

@export var item: Item:
	set(value):
		item = value
		emit_changed()
@export var quantity: int = 1:
	set(value):
		quantity = value
		emit_changed()
		if quantity <= 0: free()

func add_stack(item_stack: ItemStack) -> bool:
	if not item.stackable: return false
	assert(item_stack.item.id == item.id) #may need further comparison in the future
	quantity += item_stack.quantity
	return true

func subtract(amount: int, overflow: bool = false) -> bool:
	if not overflow and amount > quantity: return false
	quantity -= amount
	return true
	

class_name InventoryItem extends TextureRect

@onready var quantity_label: Label = $Quantity
@export var item_stack: ItemStack:
	set = set_item

func set_item(stack):
	item_stack = stack
	texture = item_stack.item.texture
	item_stack.changed.connect(_on_stack_changed)
	_on_stack_changed()

func _on_stack_changed():
	set_quantity_label(item_stack.quantity)

func set_quantity_label(quantity: int):
	if quantity < 2:
		quantity_label.hide()
		return
	quantity_label.text = str(quantity)

extends StaticBody2D


func _on_interacted(actor):
	print("<<<INVENTORY>>>")
	for item_stack in actor.get_node("Inventory").get_items():
		print(item_stack.item.id + " x" + str(item_stack.quantity))

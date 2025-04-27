class_name InventoryDisplay extends Control

const TILE_SIZE := 18
@export var inventory_item_scene: PackedScene
var is_open: bool = false

func _ready():
	Globals.playerInventoryDisplay = self

func toggle(inventory: Inventory):
	if is_open:
		close()
	else:
		open(inventory)

func open(inventory: Inventory):
	%Background.custom_minimum_size = Vector2(TILE_SIZE*inventory.width, TILE_SIZE*inventory.height)
	load_items(inventory.get_items())
	is_open = true
	show()

func close():
	is_open = false
	hide()

func load_items(items: Array[ItemStack]):
	clear_items()
	for stack in items:
		var inventory_item: InventoryItem = inventory_item_scene.instantiate()
		%ItemGrid.add_child(inventory_item)
		inventory_item.set_item(stack)

func clear_items():
	for child in %ItemGrid.get_children():
		child.queue_free()

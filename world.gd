class_name World extends Node2D

var ground_item_scene: PackedScene = preload("res://Things/groundItem/ground_item.tscn")

func _ready():
	Globals.world = self

func drop_item(item_stack: ItemStack, at: Vector2) -> GroundItem:
	var ground_item := ground_item_scene.instantiate() as GroundItem
	ground_item.item_stack = item_stack
	ground_item.position = at
	add_child.call_deferred(ground_item)
	
	return ground_item

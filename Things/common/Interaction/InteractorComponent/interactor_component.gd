class_name Interactor extends Area2D

@export var actor: Player

func _enter_tree():
	set_multiplayer_authority(actor.get_multiplayer_authority())

func attempt_interaction():
	if not is_multiplayer_authority(): return

	var available_interactions = get_overlapping_areas()
	if available_interactions.is_empty(): return null
	var closest_interactable := find_closest_node(available_interactions) as Interactable
	closest_interactable.interact.rpc(actor.get_path())

func find_closest_node(nodes: Array) -> Node2D:
	return nodes.reduce(func(min_dist_node, node: Node2D):
		return node if distance_squared(node) < distance_squared(min_dist_node) else min_dist_node)

func distance_squared(of: Node2D):
	return global_position.distance_squared_to(of.global_position)

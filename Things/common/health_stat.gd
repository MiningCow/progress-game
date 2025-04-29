class_name HealthStat extends Stat

signal died

func _set_stat(to):
	super._set_stat(to)
	if value <= 0:
		if is_multiplayer_authority(): _on_death.rpc()

@rpc("call_local")
func _on_death():
	died.emit()

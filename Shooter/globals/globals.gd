extends Node

signal stat_change

var laser_amount: int = 20:
	set(value):
		laser_amount = value
		stat_change.emit()
		
var grenade_amount: int = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()
		
var player_hp: int = 60:
	set(value):
		player_hp = value
		stat_change.emit()

var player_position: Vector2

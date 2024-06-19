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
		player_hp = min(value,100)
		stat_change.emit()

var can_player_be_hit: bool = true:
	set(value):
		can_player_be_hit = value
var player_position: Vector2

extends Node2D

func _on_gate_player_entered_gate():
	print('player has entered the gate')


func _on_gate_player_exited_gate():
	print('player has exited the gate')


func _on_player_player_shot_laser():
	print('The player has shot laser')


func _on_player_player_shot_grenade():
	print('The player has shot grenade')

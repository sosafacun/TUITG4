extends StaticBody2D

signal player_entered_gate
signal player_exited_gate

func _on_gate_crossing_area_body_entered(_body):
	player_entered_gate.emit()


func _on_gate_crossing_area_body_exited(_body):
	player_exited_gate.emit()

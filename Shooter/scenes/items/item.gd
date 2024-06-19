extends Area2D

@export var rotation_speed: int = 3
@export var available_options = ['laser', 'laser', 'laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	if (type == 'laser'):
		$Sprite2D.modulate = Color('00c8c9')
	if (type == 'grenade'):
		$Sprite2D.modulate = Color('ff1c2e')
	if (type == 'health'):
		$Sprite2D.modulate = Color('006b14')
	
	var target_position = (position + direction * distance)
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_position, 0.5)
	tween.tween_property(self, "scale", Vector2(1,1), 0.3).from(Vector2(0,0))

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	if (type == 'laser'):
		Globals.laser_amount += 5
	if (type == 'grenade'):
		Globals.grenade_amount += 1
	if (type == 'health'):
		Globals.player_hp += 10
	queue_free()

extends CharacterBody2D

const speed: float = 500

const laser_cd: float = 0.5
const greande_cd: float = 1.5

var can_laser: bool = true
var can_grenade: bool = true

signal player_shot_laser(pos, direction)
signal player_shot_grenade(pos, direction)

func _process(_delta):
	move()
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if (Input.is_action_just_pressed("primary_action")
	and can_laser):
		shoot(player_direction)
		
	if (Input.is_action_just_pressed("secondary_action")
	and can_grenade):
		secondary(player_direction)

func shoot(player_direction):
	var laser_markers = $LaserStartPositions.get_children()
	var selected_laser = laser_markers[randi() % laser_markers.size()]
	player_shot_laser.emit(selected_laser.global_position, player_direction)
	can_laser = false
	$LaserCD.start()

func secondary(player_direction):
	var pos = $GrenadeStartPosition/Marker2D.global_position
	player_shot_grenade.emit(pos, player_direction)
	can_grenade = false
	$GrenadeCD.start()

func move():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())

func _on_grenade_cd_timeout():
	can_grenade = true

func _on_laser_cd_timeout():
	can_laser = true

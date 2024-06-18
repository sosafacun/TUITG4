extends CanvasLayer

@onready var laser_lable: Label = $LaserCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect

@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect

var green: Color = Color("6bbfa3")
var red: Color = Color("ff0000")

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_lable.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_lable, laser_icon)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)

func update_color(ammo_amount:int, ui_label: Label, ui_icon: TextureRect) -> void:
	if(ammo_amount != 0):
		ui_label.modulate = green
		ui_icon.modulate = green
	else:
		ui_label.modulate = red
		ui_icon.modulate = red

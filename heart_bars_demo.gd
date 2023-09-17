extends CenterContainer

@onready var health_label = $VBoxContainer/Label
@onready var bars = $VBoxContainer/HBoxContainer/Bars

var current_health = 4:
	set = set_health

func _ready():
	current_health = 5

func set_health(value):
	current_health = clamp(value, 0, 10)
	health_label.text = "Current Health : %s" % current_health
	for bar in bars.get_children():
		bar.update_health(current_health)

func _on_add_button_pressed():
	current_health += 1


func _on_subtract_button_pressed():
	current_health -= 1

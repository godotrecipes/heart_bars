extends HBoxContainer

enum modes {SIMPLE, EMPTY, PARTIAL}

var heart_full = preload("res://assets/hud_heartFull.png")
var heart_empty = preload("res://assets/hud_heartEmpty.png")
var heart_half = preload("res://assets/hud_heartHalf.png")

@export var mode : modes

func update_health(value):
	match mode:
		modes.SIMPLE:
			update_simple(value)
		modes.EMPTY:
			update_empty(value)
		modes.PARTIAL:
			update_partial(value)
			
func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i
		
func update_empty(value):
	for i in get_child_count():
		if value > i:
			get_child(i).texture = heart_full
		else:
			get_child(i).texture = heart_empty
			
func update_partial(value):
	for i in get_child_count():
		if value > i * 2 + 1:
			get_child(i).texture = heart_full
		elif value > i * 2:
			get_child(i).texture = heart_half
		else:
			get_child(i).texture = heart_empty

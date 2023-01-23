extends ProgressBar

export var renew_health = 600
export var step_value = 10
export var crashval = 3
export var fake_value = 100
var current_frame_delay = 0
signal dead
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func crash(speed):
	fake_value -= (speed / 20) + 10
	current_frame_delay = 0

func _on_Area2D_body_entered(body):
	if body.name == "Car":
		current_frame_delay = 0
		fake_value -= step_value
	

func _physics_process(delta):
	if value <= 0:
		print("gameover")
		current_frame_delay = 0
		emit_signal("dead")
		
	current_frame_delay += 1
	
	if current_frame_delay >= renew_health:
		current_frame_delay = 0
		fake_value += step_value
		
	if value > fake_value:
		if (value - fake_value) > 10:
			value -= 0.5
		elif (value - fake_value) > 5:
			value -= 0.3
		else:
			value -= 0.2
	elif value < fake_value:
		if (fake_value - value) > 10:
			value += 0.5
		elif (fake_value - value) > 5:
			value += 0.3
		else:
			value += 0.2
		
	if fake_value > 100:
		fake_value = 100



func _on_Dialog_window_dialogfail():
	value = 0

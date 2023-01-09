extends ProgressBar

export var renew_health = 600
export var step_value = 10
export var fake_value = 100
var current_frame_delay = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	fake_value -= step_value
	

func _physics_process(delta):
	current_frame_delay += 1
	
	if current_frame_delay >= renew_health:
		current_frame_delay = 0
		fake_value += step_value
		
	if value > fake_value:
		value -= 0.2
	elif value < fake_value:
		value += 0.2
		
	if fake_value > 100:
		fake_value = 100


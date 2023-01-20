extends PathFollow2D
var carspeed = 325

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var run = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if run:
		
	#set_offset(get_offset() + carspeed / 100)
		set_offset(get_offset() + carspeed * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

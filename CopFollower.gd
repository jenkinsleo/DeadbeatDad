extends PathFollow2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var run = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if run and offset > 10:
		set_offset(get_offset() - 1)
	else:
		
		run = false

func _on_Cop_copvisible():
	run = true


func _on_Dialog_window_dialogpass():
	
	set_offset(-1)

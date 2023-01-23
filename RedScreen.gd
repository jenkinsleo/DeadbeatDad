extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HealthLevel_dead():
	
	visible = true
	
	
func _process(delta):
	if Input.is_action_pressed("ui_accept") and visible:
		$Hopethisbreaksit.name

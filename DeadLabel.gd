extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var score = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HealthLevel_dead():
	visible = true
	
	text = """Game Over
	
Final Score
""" + str(score) + """ 













Press Enter To Quit"""

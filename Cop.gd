extends Area2D

var rng = RandomNumberGenerator.new()
export var minframes = 2000
export var maxframes = 3000
var currentframes = 0
var dedframes = 0
var activecount = false
var emitonce = false
var pos = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true # Replace with function body.
	

signal copvisible
signal startmessage
var run = false
export(NodePath) var cardetectpath
export(NodePath) var carpath

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):

	if activecount == false:
		dedframes = rng.randf_range(minframes, maxframes)
		print(dedframes)
		activecount = true
		run = true
	else:
		if currentframes >= dedframes:
			
			visible = true
			emit_signal("copvisible")
			
			
			
		else:
			currentframes += 1




func _on_Car_carstopped():
	if visible and emitonce == false:
		emitonce = true
		emit_signal("startmessage")


func _on_Dialog_window_dialogpass():
	visible = false
	emitonce = false
	activecount = false
	currentframes = 0
	dedframes = 0

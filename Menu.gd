extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) var objectives
export(NodePath) var canvaslayer1
export(NodePath) var camera2
export(NodePath) var maincam

signal active
signal closed

onready var camera21 = get_node(camera2)
onready var camera11 = get_node(maincam)

var run = true
# Called when the node enters the scene tree for the first time.
func _ready():
	objectives = get_node(objectives)
	canvaslayer1 = get_node(canvaslayer1)
func _input(event):
	
	if event.is_action_released("menu") and run == true:
		visible = !visible
		
		objectives.visible = !objectives.visible
		canvaslayer1.visible = !canvaslayer1.visible
		
		var currentvar = camera21.current
		camera21.current = camera11.current
		camera11.current = currentvar
		
		
		if visible:
			emit_signal("active")
		else:
			emit_signal("closed")
		
		
		


func _on_HealthLevel_dead():
	run = false
	objectives.visible = false
	canvaslayer1.visible = false
	camera11.current = true
	visible = false
	

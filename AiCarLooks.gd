extends Sprite

var rng = RandomNumberGenerator.new()
var sprites = [["res://Graphic Packs/Car game v4/Cars/Car grey/Car grey.png", "res://Graphic Packs/Car game v4/Cars/Car grey/Grey car crashed.png"], ["res://Graphic Packs/Car game v4/Cars/Car red/Car red.png", "res://Graphic Packs/Car game v4/Cars/Car red/Red car crashed.png"], ["res://Graphic Packs/Car game v4/Cars/Car red striped/Car Striped.png", "res://Graphic Packs/Car game v4/Cars/Car red striped/Red striped car crashed.png"], ["res://Graphic Packs/Car game v4/Cars/Car yellow/Car yellow.png", "res://Graphic Packs/Car game v4/Cars/Car yellow/Yellow car crashed.png"]]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var maincar = "null"
var crashedcar = "null"
export var current = 0

var crash_delay = 0.2
var crash_count = 0
var run = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomize()
	
	current = randi()%(sprites.size() - 1)
	set_texture(load(sprites[int(current)][0]))
	
	
	
	


func crash(speed):
	
	crash_count = crash_delay * speed
	run = true
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	if run:
		
		
		if (crash_count <= 0):
			
			run = false
			set_texture(load(sprites[int(current)][1]))
		crash_count -= 1

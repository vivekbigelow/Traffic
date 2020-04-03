extends KinematicBody

var velocity = Vector3(0,0,-5)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.translation.x = rand_range(-4.843,4.843)
	self.translation.y = 0.449
	self.translation.z = 10
	
func _physics_process(delta):
	if self.translation.z < -20:
			self.queue_free()
			
	var collisions = move_and_collide(velocity*delta)
	
	if collisions:
		var car = collisions.collider
		self.queue_free()
		
	
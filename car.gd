extends KinematicBody

var velocity = Vector3()
var obstacleScene = preload("res://obstacle.tscn")

export var speed = 5

# Called when the node enters the scene tree for the first time.
#func _ready():


func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = -speed
	if Input.is_action_just_pressed("ui_accept"):
		make_obstacle()
	
	
	move_and_slide(velocity)
	
func make_obstacle():
		var obstacle = obstacleScene.instance()
		self.get_parent().add_child(obstacle)
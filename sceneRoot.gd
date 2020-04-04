extends Spatial

var replayButton

# Called when the node enters the scene tree for the first time.
func _ready():
	replayButton = self.get_node("Button")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if replayButton.pressed:
		get_tree().reload_current_scene()
		replayButton.pressed = false

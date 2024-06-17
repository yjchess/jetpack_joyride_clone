extends CanvasLayer
signal start

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	emit_signal("start")
	$Button.disabled = true
	$Message.hide()
	$Button.hide()
	pass # Replace with function body.

func update_score(new_score):
	$Score.text = new_score

func unhide():
	$Message.show()
	$Button.show()
	$Button.disabled = false

extends Area2D

var interactive = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("interact") and interactive == true):
		Dados.semente += 30


func _on_body_entered(body: Node2D) -> void:
	$Label.show()
	interactive = true
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	$Label.hide()
	interactive = false
	pass # Replace with function body.

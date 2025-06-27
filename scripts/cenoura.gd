extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	$AnimatedSprite2D.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	show()

extends Area2D
var semente = Dados.semente

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = 0
	show()
	await get_tree().create_timer(60.0).timeout
	$AnimatedSprite2D.frame = 1
	await get_tree().create_timer(60.0).timeout
	$AnimatedSprite2D.frame = 2
	await get_tree().create_timer(60.0).timeout
	$AnimatedSprite2D.frame = 3
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	Dados.isInside = 1

func _on_body_exited(_body: Node2D) -> void:
	Dados.isInside = 0

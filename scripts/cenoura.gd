extends Area2D
var semente = Dados.semente
var isInside = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../Informacoes/Label".text = str("Sementes: ", semente)
		
	if ((semente >= 1) and (isInside == true) and (Input.is_action_just_pressed("interact"))):
		semente -= 1
		$AnimatedSprite2D.frame = 0
		show()
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 3
	

func _on_body_entered(body: Node2D) -> void:
	isInside = true
		
func _on_body_exited(body: Node2D) -> void:
	isInside = false

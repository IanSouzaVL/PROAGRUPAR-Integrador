extends Area2D
var podeInteragir = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (podeInteragir == true) and Input.is_action_just_pressed("interact") and (Dados.residencial == true):
		Dados.residencial = false
		var resultado = get_tree().change_scene_to_file("res://scenes/main.tscn")
		Dados.chave = true
		if resultado != OK:
			push_error("Falha ao trocar de cena. Código de erro: %s" % resultado)



func _on_body_entered(_body: Node2D) -> void:
	$Label.show()
	podeInteragir = true
	Dados.residencial = true
	print(podeInteragir)

func _on_body_exited(_body: Node2D) -> void:
	$Label.hide()
	podeInteragir = false
	print(podeInteragir)

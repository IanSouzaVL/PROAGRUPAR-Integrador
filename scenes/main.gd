extends Node2D
var node = preload("res://scenes/cenoura.tscn")
@onready var player = $Player
@onready var tilemap = $"Layer 0/Layer 1"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Informacoes/Label.text = str("Sementes: ", Dados.semente)
	$Informacoes/PanelContainer/Label.text = str("Pontuação: ", Dados.pontuacao)
	
	if (Input.is_action_just_pressed("interact")) and (Dados.isInside == 0) and (Dados.semente >= 1) and (Dados.residencial == false):
		print(Dados.isInside)
		Dados.semente -= 1
		var tile_coords = tilemap.local_to_map(tilemap.to_local(player.global_position))
		var tile_pixel_pos = tilemap.map_to_local(tile_coords)
		var cenoura = preload("res://scenes/cenoura.tscn").instantiate()
		cenoura.position = tile_pixel_pos
		add_child(cenoura)
		
		Dados.pontuacao += 1
	
		

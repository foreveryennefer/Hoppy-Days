extends Node2D

export var starting_lives = 3
var lives

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()

func update_GUI():
	Global.GUI.update_GUI(lives)

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func hurt():
	lives -= 1
	update_GUI()
	Global.Player.hurt()
	if lives < 0:
		end_game()
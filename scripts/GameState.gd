extends Node2D

export var starting_lives = 3
export var coin_target = 2 #How many coins for an extra life

onready var GUI = Global.GUI

var lives
var coins = 0

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()

func update_GUI():
	Global.GUI.update_GUI(lives, coins)

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func hurt():
	lives -= 1
	update_GUI()
	Global.Player.hurt()
	GUI.animate_icon("Hurt")
	if lives < 0:
		end_game()

func coin_up():
	coins += 1
	update_GUI()
	var multiple_of_coin_target = (coins % coin_target) == 0
	GUI.animate_icon("CoinPulse")
	if multiple_of_coin_target:
		print("Life up")
		life_up()

func life_up():
	lives += 1
	update_GUI()
	GUI.animate_icon("LifePulse")

extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(lives, coins):
	$Banner/HBoxContainer/Life/LifeCount.text = str(lives)
	$Banner/HBoxContainer/Coin/CoinCount.text = str(coins)

func animate_icon(icon_name):
	$AnimationPlayer.play(icon_name)
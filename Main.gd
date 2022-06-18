extends Node2D

var Level = 0
var XP = 0 #Current amount of XP
var XP_Needed = 50 #XP Needed for Level-up

var Damage = 0
var HP = 0

export var XP_Increment = 10 #Amount of XP that should be added when XPup button is pressed

#Labels
onready var XP_Increase_Button_Label = $XPup

onready var Level_Label = $Level
onready var XP_Label = $XP
onready var HP_Label = $HP
onready var Damage_Label = $Damage

func _on_Levelup_pressed():
	Level += 1

func _on_XPup_pressed():
	XP += XP_Increment


func _process(delta):
	XP_Increase_Button_Label.text = "Increase XP by " + str(XP_Increment)
	
	Level_Label.text = "Level: " + str(Level) #Level
	XP_Label.text = "XP: " + str(XP) + "/" + str(XP_Needed) #XP Amount
	HP_Label.text = "HP: " + str(HP)
	Damage_Label.text = "Damage: " + str(Damage)
	
	if XP >= XP_Needed:
		Level += 1
		
		XP = XP - XP_Needed #XP Leftover after level-up
		XP_Needed = int(XP_Needed * 1.5) #Rounds XP_Needed to an integer
		
		HP = (HP * 1.6) + 2
		HP = int(HP) #Rounds HP to an integer
		
		Damage = (Damage * 1.3) + 3
		Damage = int(Damage) #Rounds Damage to an integer


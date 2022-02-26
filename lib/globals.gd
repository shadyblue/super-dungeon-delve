extends Node

var player: KinematicBody2D
var map: TileMap
const GRID_SIZE = 16

var gold = 0
var depth = 1
var kills = 0


const ENTITIES = {
		"MONSTERS": {
			"skeleton": {
				"scene": preload("res://entities/monsters/monster.tscn"),
				"script": preload("res://entities/monsters/monster-skel.gd")
			},
			"slime": {
				"scene": preload("res://entities/monsters/monster.tscn"),
				"script": preload("res://entities/monsters/monster-slime.gd")
			},
			"goblin": {
				"scene": preload("res://entities/monsters/monster.tscn"),
				"script": preload("res://entities/monsters/monster-goblin.gd")
			}
		},
		"PLAYERS": {
			"knight": {
				"scene": preload("res://entities/players/player-knight.tscn"),
				"script": preload("res://entities/players/player.gd")
			},
			"lizard": {
				"scene": preload("res://entities/players/player-lizard.tscn"),
				"script": preload("res://entities/players/player-lizard.gd")
			}
		}
	}
	
var selectablePlayers = ENTITIES.PLAYERS.keys()

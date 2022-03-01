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
				"scene": preload("res://entities/players/player-knight.tscn")
			},
			"lizard": {
				"scene": preload("res://entities/players/player-lizard.tscn")
			},
			"elf": {
				"scene": preload("res://entities/players/player-elf.tscn")
			}
		},
		"WEAPONS": {
			"Sword": {
				"scene": preload("res://entities/weapons/sword.tscn")
			},
			"Daggers": {
				"scene": preload("res://entities/weapons/Daggers.tscn")
			}
		}
	}
	
var selectablePlayers = ENTITIES.PLAYERS.keys()

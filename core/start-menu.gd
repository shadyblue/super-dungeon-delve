extends Control
#comment

const OPT_START = 0
const OPT_EXIT = 1

var knight = preload("res://entities/Knight.tscn")
var elf = preload("res://entities/Elf.tscn")
var wizard = preload("res://entities/Wizard.tscn")
var _selected = 0
var _old_selected = 1

var _selected_char = 0
#var _old_selected_char = 1
var _player_choices = ["knight", "elf", "wizard"]
var charSprite = _player_choices[_selected_char]

func _ready():
	$AnimationPlayer.play("selected")
	$CharSelectorAnim.play("selectedChar")
	$Character.play(charSprite)
	print(charSprite)
	print("player choices size", _player_choices.size() - 1 )
	print(_selected_char)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if _selected == OPT_START:
			# Let the player know what is happening
			$Label0.text = "Generating Dungeon ..."
			$Label0.modulate = Color.lawngreen
			$Label0.rect_position.x = $Label0.rect_position.x - 180
			$Label1.visible = false
			$pointer.visible = false
			# Without this, the label change is never visible before the scene switch
			yield(get_tree(), 'idle_frame')
			# Now start the game by switching to the main scene
			get_tree().change_scene("res://core/main.tscn")
			
		if _selected == OPT_EXIT:
			get_tree().quit()
			
	if Input.is_action_just_pressed("ui_down"):
		_old_selected = _selected
		_selected += 1
	if Input.is_action_just_pressed("ui_up"):
		_old_selected = _selected
		_selected -= 1
		#check if pressed AND if selected is greater than array
	if Input.is_action_just_pressed("ui_right"):
		print(_selected_char)
		#fix array issue, if selected char is greater than array size, start back from top
		if _selected_char == _player_choices.size() - 2:
			print(_selected_char)
			_selected_char == 0
			$Character.set_animation(charSprite)
		_selected_char += 1
		charSprite = _player_choices[_selected_char]
		$Character.set_animation(charSprite)
#
		
	if _selected > OPT_EXIT: 
		_selected = OPT_START
	if _selected < OPT_START: 
		_selected = OPT_EXIT
			
	# Move pointer next to selected option label
	$pointer.position.y = get_node("Label"+str(_selected)).rect_position.y + get_node("Label"+str(_selected)).rect_size.y / 2
	$charSelector.position.x = $Character.position.x + 150
	$charSelector.position.y = $Character.position.y + 50
#	print(get_node("Character").get_viewport_rect() )
#	$charSelector.position.x = get_node("Character").rect_position.x * 2
#	$charSelector.position.y = get_node("Character").rect_position.y + get_node("Character").rect_size.y / 2
	
	# Change the animation which makes the labels "glow"
	var startAni = $AnimationPlayer.get_animation("selected")
	get_node("Label"+str(_old_selected)).modulate = Color.white
	# We can modify the property the animation path animates on the fly, how clever!
	startAni.track_set_path(1, "Label"+str(_selected)+":modulate")
	
#func _character_select():
#	var instancedObject = SpriteFrameResource.new()
#	var frameResource = instancedObject.getFrames()
#	var name: String = instancedObject.name
#
#	self.set_sprite_frames(frameResource)
#	self.play(name)
		# Change the animation which makes the labels "glow"
#	var charSelectAni = $charSelectorAnim.get_animation("selectedChar")
#	$Character.add_child(charSprite)
	# We can modify the property the animation path animates on the fly, how clever!
#	charSelectAni.track_set_path(1, "Label"+str(_selected_char)+":modulate")						
#	add_child(charSprite(str(_player_choices[_selected_char]))

extends Node2D


var wsMultiplayerPeer = WebSocketMultiplayerPeer.new()

var clients = {}
var lobbies = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	init_Server()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	wsMultiplayerPeer.poll()
	if wsMultiplayerPeer.get_available_packet_count() > 0:
		var packet = wsMultiplayerPeer.get_packet()
		if packet != null:
			var dataString = packet.get_string_from_utf8()
			var data = JSON.parse_string(dataString)
			print(data)
	pass

func init_Server():
	print("CREATING SERVER")
	var err = wsMultiplayerPeer.create_server(8915)
	if err != 0:
		wsMultiplayerPeer.close()
		push_error("AN ERROR OCCURED")
		
	print("CREATED SERVER")
	

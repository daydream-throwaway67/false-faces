extends Label

func _ready() -> void:
	var text = ""
	for answer in Global.answers:
		print(answer)
		text += answer + "\n"
		if answer == "I wish for a million dollars!":
			if Global.answers[answer] == "accept":
				text += "Accepted wish - The money came from random bank accounts, and he became the most wanted criminal overnight.\n\n"
			else:
				text += "Declined wish - He couldn't pay for his dog's cancer treatment. The dog eventually sadly passed away a few months later.\n\n"
		elif answer == "I wish my girlfriend to love me.":
			if Global.answers[answer] == "accept":
				text += "Accepted wish - At first, everything seemed fine. After a period of time, she became so addicted to him she wanted to be with him in every step and every moment. She grew more violent over time and he became trapped forever.\n\n"
			else:
				text += "Declined wish - He felt very sad and had many bad thoughts and they broke up, but after a few years he got a loving girlfriend.\n\n"
		elif answer == "I wish to be able to teleport.":
			if Global.answers[answer] == "accept":
				text += "Accepted wish - There was a 5% chance it would not teleport to the desired location and instead to a random place in the world. One time, he sadly got teleported to a rainforest and disappeared.\n\n"
			else:
				text += "Declined wish - After you declined, he became a hermit and never talked to anyone for the rest of his life.\n\n"
	
	$".".text = text

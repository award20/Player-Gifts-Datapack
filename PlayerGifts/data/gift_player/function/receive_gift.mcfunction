# @s is the RECEIVER
# Sender(s) are tagged with gift_sender

# Mark receiver as having a pending gift
scoreboard players set @s has_gift 1

# Called as the executing player
scoreboard players set @s actionbar_tick 60
tag @s add ab_timer

# Gift pinger cooldown reset (5 mins)
scoreboard players set @s gift_ping 6000 

# Feedback to receiver: actionbar with team-colored sender name
schedule function gift_player:receive_gift_anim 1t replace

# Sound for receiver
playsound minecraft:entity.player.levelup block @s ~ ~ ~ 0.25 1.5

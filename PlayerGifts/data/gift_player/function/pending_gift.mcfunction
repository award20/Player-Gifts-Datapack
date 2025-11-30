# @s is the RECEIVER
# Sender(s) are tagged with gift_sender

# Called as the executing player
scoreboard players set @s actionbar_tick 60
tag @s add ab_timer

# Feedback to receiver: actionbar with team-colored sender name
schedule function gift_player:pending_gift_anim 1t replace

# Sound for receiver
playsound minecraft:entity.player.levelup block @s ~ ~ ~ 0.25 1.5

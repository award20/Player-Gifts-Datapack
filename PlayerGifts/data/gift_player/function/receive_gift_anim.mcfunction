# Run once per tick (as the server), and handle all players with active timers

# Show the actionbar for any player with ab_timer > 0
execute as @a[scores={actionbar_tick=1..}] run title @s actionbar [{"text":"You have received a gift from ","color":"gold"},{"selector":"@a[tag=gift_sender,limit=1]"},{"text":"! Use ","color":"gold"},{"text":"/trigger open_gift","color":"white"},{"text":" to open it!","color":"gold"}]

# Decrease the actionbar tick counter by 1 for all players with active timers
scoreboard players remove @a[scores={actionbar_tick=1..}] actionbar_tick 1

# Remove the tag from players whose time just hit 0
tag @a[scores={actionbar_tick=0}] remove ab_timer

execute as @a[scores={actionbar_tick=1..}] run schedule function gift_player:receive_gift_anim 1t replace
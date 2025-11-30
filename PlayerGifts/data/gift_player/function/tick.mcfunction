# Keep the player index list update every tick
function gift_player:update_player_list

# Auto enable trigger for all players
scoreboard players enable @a send_gift
scoreboard players enable @a list_players
scoreboard players enable @a open_gift
scoreboard players enable @a gp_help

# Handle sending gifts
execute as @a[scores={send_gift=1..}] run function gift_player:send_gift

# Handle player listing
execute as @a[scores={list_players=1..}] run function gift_player:show_list

# Handle opening gifts
execute as @a[scores={open_gift=1..}] run function gift_player:open_gift

# Handle help trigger
execute as @a[scores={gp_help=1..}] run function gift_player:gp_help

# Decrement ping timer for players with a gift
scoreboard players remove @a[scores={gift_ping=1..}] gift_ping 1

# When it hits 0, show a reminder and reset
execute as @a[scores={has_gift=1..,gift_ping=0}] run function gift_player:pending_gift
scoreboard players set @a[scores={has_gift=1..,gift_ping=0}] gift_ping 6000
#execute as @a[tag=ab_timer] if score #actionbar_notif actionbar_tick matches ..0 run tag @s remove ab_timer
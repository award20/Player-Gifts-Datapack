# Reset the trigger
scoreboard players set @s gp_help 0

# Explanation messages
tellraw @s {"text":"-= How to Use Player Gifts =-","color":"gold","bold":true}
tellraw @s {"text":"1. '/trigger list_players' Shows a list of active players you can send gifts to.","color":"white"}
tellraw @s {"text":"2. '/trigger send_gift set <player_index>' Sends the item in your main hand as a gift to the selected player.","color":"white"}
tellraw @s {"text":"3. '/trigger open_gift' Opens any pending gifts you have received.","color":"white"}
tellraw @s {"text":" "}
tellraw @s {"text":"Example Usage:","color":"gold","bold":true}
tellraw @s {"text":"/trigger list_players","color":"white"}
tellraw @s {"text":" "}
tellraw @s {"text":"Active Players:","color":"gold"}
tellraw @s [{"text":"1.","color":"white"},{"text":" Player1","color":"light_purple"}]
tellraw @s [{"text":"2.","color":"white"},{"text":" Player2","color":"green"}]
tellraw @s [{"text":"3.","color":"white"},{"text":" Player3","color":"red"}]
tellraw @s {"text":" "}
tellraw @s {"text":"/trigger send_gift set 2","color":"white"}
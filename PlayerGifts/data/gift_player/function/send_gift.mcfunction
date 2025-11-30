# Copy chosen index from trigger into gift_target
scoreboard players operation @s gift_target = @s send_gift

# Reset trigger
scoreboard players set @s send_gift 0

# If target index is invalid, notify and exit
execute unless score @s gift_target matches 1.. run title @s actionbar {"text":"Use /trigger send_gift set <player number> after /trigger list_players.","color":"red"}
execute unless score @s gift_target matches 1.. run playsound minecraft:block.anvil.land block @s ~ ~ ~ 0.1 2
execute unless score @s gift_target matches 1.. run return 0

# Must hold an item
execute unless data entity @s SelectedItem run title @s actionbar {"text":"You must be holding an item to send as a gift!","color":"red"}
execute unless data entity @s SelectedItem run playsound minecraft:block.anvil.land block @s ~ ~ ~ 0.1 2
execute unless data entity @s SelectedItem run return 0

# Clear any leftover tags from prior runs
tag @a remove gift_sender
tag @a remove gift_receiver

# Mark sender
tag @s add gift_sender

# Store the target index in a fake player
scoreboard players operation #target list_id = @s gift_target

# Mark the matching player (by list_id) as receiver, excluding the sender
execute as @a[tag=!gift_sender] if score @s list_id = #target list_id run tag @s add gift_receiver

# If no receiver with that index exists, notify and exit (do NOT touch the item)
execute unless entity @a[tag=gift_receiver] run title @s actionbar {"text":"No player with that number is online!","color":"red"}
execute unless entity @a[tag=gift_receiver] run playsound minecraft:block.anvil.land block @s ~ ~ ~ 0.1 2
execute unless entity @a[tag=gift_receiver] run tag @a remove gift_sender
execute unless entity @a[tag=gift_receiver] run tag @a remove gift_receiver
execute unless entity @a[tag=gift_receiver] run return 0

# At this point we KNOW there is a valid receiver.
# Now we can safely store the item in storage and remove it from the sender.

# Store item temporarily in storage
data modify storage gift_player:gift item set from entity @s SelectedItem

# Remove item from sender's hand
item replace entity @s weapon.mainhand with air

# Feedback to sender
title @s actionbar [{"text":"You have sent your gift to ","color":"gold"},{"selector":"@a[tag=gift_receiver,limit=1]"},{"text":"!","color":"gold"}]

# Notify the receiver that they have a pending gift
execute as @a[tag=gift_receiver,limit=1] run function gift_player:receive_gift

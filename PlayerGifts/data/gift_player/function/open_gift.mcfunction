# Reset the trigger
scoreboard players set @s open_gift 0
scoreboard players set @s gift_ping 0

# Check if this player has a pending gift?
execute unless score @s has_gift matches 1.. run title @s actionbar {"text":"You have no gifts to open.","color":"red"}
execute unless score @s has_gift matches 1.. run playsound minecraft:block.anvil.land block @s ~ ~ ~ 0.1 2
execute unless score @s has_gift matches 1.. run return 0

# Check if there is actually item data in storage?
execute unless data storage gift_player:gift item run title @s actionbar {"text":"Your gift data is missing or corrupted.","color":"red"}
execute unless data storage gift_player:gift item run playsound minecraft:block.anvil.land block @s ~ ~ ~ 0.1 2
execute unless data storage gift_player:gift item run scoreboard players set @s has_gift 0
execute unless data storage gift_player:gift item run return 0

# Summon a temporary item entity where the player is
execute at @s run summon item ~ ~1 ~ {Tags:["gp_temp_drop"],Item:{id:"minecraft:stone",Count:1b},PickupDelay:10}

# Copy the stored Item NBT onto THAT specific entity
data modify entity @e[type=item,tag=gp_temp_drop,sort=nearest,limit=1] Item set from storage gift_player:gift item

# Remove the temporary tag (no need to keep it on the item)
tag @e[type=item,tag=gp_temp_drop,sort=nearest,limit=1] remove gp_temp_drop

# Clear storage and flag
data remove storage gift_player:gift item
scoreboard players set @s has_gift 0

# Feedback to player
title @s actionbar {"text":"You opened your gift!","color":"gold"}
playsound minecraft:entity.player.levelup block @s ~ ~ ~ 0.4 1.2

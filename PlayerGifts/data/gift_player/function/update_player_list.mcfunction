# Reset all online players' indices to 0
scoreboard players set @a list_id 0

# Reset global counter
scoreboard players set #next_id list_id 0

# For each online player, increment the counter and store it as their index
execute as @a store result score @s list_id run scoreboard players add #next_id list_id 1
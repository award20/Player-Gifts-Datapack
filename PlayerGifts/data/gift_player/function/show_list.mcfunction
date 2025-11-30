# Reset trigger
scoreboard players set @s list_players 0

# Mark player requesting the list
tag @s add list_requester

# Header
tellraw @s {"text":"Active Players:","color":"gold"}

# For each online player, print "<index>. <player_name>" to requester
execute as @a run tellraw @a[tag=list_requester] [{"score":{"name":"@s","objective":"list_id"}},{"text":". "},{"selector":"@s"}]

# Cleanup
tag @a[tag=list_requester] remove list_requester
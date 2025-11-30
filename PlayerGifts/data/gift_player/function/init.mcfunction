# Gift system trigger
scoreboard objectives add send_gift trigger

# List of player systems
scoreboard objectives add list_players trigger
scoreboard objectives add list_id dummy

# Target index chosen via /trigger send_gift set <index>
scoreboard objectives add gift_target dummy

# Open gift trigger
scoreboard objectives add open_gift trigger

# Flag: does this player have a pending gift?
scoreboard objectives add has_gift dummy

# Fake players for index bookkeeping
scoreboard players set #target list_id 0
scoreboard players set #next_id list_id 0

# Actionbar animation tick counter
scoreboard objectives add actionbar_tick dummy

# Actionbar notification cooldown (to prevent spamming)
scoreboard objectives add gift_ping dummy

# Trigger help
scoreboard objectives add gp_help trigger
# 🎁 Player Gifts Datapack

Player Gifts is a lightweight datapack that allows players to **send items to each other using simple trigger commands**.

Perfect for SMP survival worlds, roleplay servers, and community events.

---

## ✨ Features
- Send the item in your hand to any online player
- No dropped items lost to lag or void *(gifts are stored safely until opened)*
- Receiver gets a notification showing **who sent the gift** (with team formatting)
- Gifts are not delivered instantly — players must use `/trigger open_gift`
- Lightweight and SMP-friendly *(minimal tick usage, no entity spam)*
- Fully multiplayer compatible *(supports multiple simultaneous gifts without conflict)*

---

## 🎮 Commands
| Command | Description |
|--------|-------------|
| `/trigger gp_help` | Shows general help info |
| `/trigger list_players` | Shows a numbered list of online players *(updates dynamically with joins & leaves)* |
| `/trigger send_gift set <number>` | Sends your held item to the player with that index |
| `/trigger open_gift` | Opens a pending gift and drops it at your feet |

---

## 🔔 Notifications
- Sender is told **who received** the gift
- Receiver is told **who sent** the gift *(with correct team formatting, colors & prefixes)*
- Periodic gift reminder *(every 5 minutes)* to open pending gifts

---

## 🛡 Safety
- Items are stored using NBT — **never duped, never voided**
- Cannot send gifts with an empty hand
- Cannot target offline or invalid players
- Fails safely and **returns the item** if delivery is not possible

---

## 📦 Installation
1. Download `PlayerGifts.zip`
2. Place into: `world/datapacks/`
3. Run `/reload` in game

---

## 🧩 Supported Versions
**Minecraft Java 1.21.10**

---

If you encounter any issues or have feature requests, feel free to open an Issue or Pull Request.

Other Links:
Modrinth: https://modrinth.com/datapack/player-gifts
Planet Minecraft https://www.planetminecraft.com/data-pack/player-gifts-datapack/

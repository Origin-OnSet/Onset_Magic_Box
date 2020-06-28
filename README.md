# Onset_Magic_Box
Simple Zombie COD Magic Box system for Onset

## How to install
- Add the "Onset_Magic_Box" folder to your server packages
- Add the ["Onset_Weapon_Patch"](https://github.com/Origin-OnSet/Onset_Weapon_Patch) folder to your server packages 
- Add the ["soundstreamer"](https://github.com/soljian/soundstreamer) folder to your server packages 

- Edit your server_config.json and add "Onset_Magic_Box" in the packages section before the files who need it

```json
"packages": [
  "Onset_Magic_Box",
  "Onset_Weapon_Patch",
  "soundstreamer"
],
```
- On the files who needs to initialize the Onset_Magic_Box using this function  
```lua
local Magic_Box = ImportPackage("Onset_Magic_Box")
```
After that you should be able to use the built-in functions

## Function
```lua
Create(x,y,z,h)
Open(player)
```

## Exemple
[ Simple Server Side Script]
```lua
local Magic_Box = ImportPackage("Onset_Magic_Box") -- Import to your Server Script Onset_Magic_Box

Magic_Box.Create(0,0,1600,90) -- Create Magic box at x:0 y:0 z:1600 h:90

AddRemoteEvent("Magic_Box:Open", function(player)
  OpenMagiqueBox(player)
end)

```

[ Simple Client Side Script]
```lua
local Magic_Box = ImportPackage("Onset_Magic_Box") -- Import to your Server Script Onset_Magic_Box

AddEvent("OnKeyPress", function(key)
    if key == "E" then
        CallRemoteEvent("Magic_Box:Open")      
    end
end)
```

## Package Config
[ Edite CONFIG.lua file ]
```lua
-- Made with 🖤 By Philip-J.Fry --

DISABLE_COMMANDE = false -- Set to true for disabled command

Weapond_List = {
    {2, 1000}, -- {[Weapon Id](https://dev.playonset.com/wiki/Weapons) : Ammo}
    {3, 1000},
    {4, 1000},
    {5, 1000},
    {6, 1000},
    {7, 1000},
    {8, 1000},
    {9, 1000},
    {10, 1000},
    {11, 1000},
    {12, 1000},
    {13, 1000},
    {14, 1000},
    {15, 1000},
    {16, 1000},
    {17, 1000},
    {18, 1000},
    {19, 1000},
    {20, 1000},
    {21, 1000}
}
```
## Package Commands
```
/create_box -- Create box at the position of player
/open_box -- open box if the distance 3d is less than 300
```

## Discord
Join Origin [Discord](https://discord.gg/MDEwtKr) server now !

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License

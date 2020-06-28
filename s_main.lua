local Weapon = ImportPackage("Onset_Weapon_Patch")

Magic_Box_List = {}

function CreateMagiqueBox(x, y, z, h)
    local NewMagiqueBoxObject = CreateObject(978, x + 100, y, z - 100, 0, 0, h)
    
    table.insert(Magic_Box_List, { objectId = NewMagiqueBoxObject, statu = 0, playerActive = nil, weapondObject = nil, weapondId = 0, weapondAmmo = 100, Animation = nil, Delay = nil} )
end

AddFunctionExport("Create", CreateMagiqueBox)


AddEvent("OnPlayerJoin", function(player)
    CallRemoteEvent(player, "MagicBox:Setup", DISABLE_COMMANDE)
end)


function OpenMagiqueBox(player)
    local x,y,z = GetPlayerLocation(player)
    
    for k,v in pairs(Magic_Box_List) do
        local x2,y2,z2 = GetObjectLocation(v.objectId)
        local dist = GetDistance3D(x, y, z, x2, y2, z2)

        if dist <= 300 then

            if v.statu == 0 then

                v.statu = 2

                v.playerActive = player

                for h,n in pairs(GetAllPlayers()) do
                    CallRemoteEvent(n,"MagicBox:PlayerSound", "mystery-box.mp3", x2, y2, z2, 1500)
                end

                local random = math.random(1, #Weapond_List)

                for j,c in pairs(Weapond_List) do
                    if j == random then

                        v.weapondId = c[1]
                        v.weapondAmmo = c[2]

                        break
                    end
                end

                v.Animation = CreateTimer(function ( )
                    if v.weapondObject ~= nil then
                        DestroyObject(v.weapondObject)
                        v.weapondObject = nil
                    end

                    v.weapondObject = CreateObject(Random(4, 22), x2, y2 - 60, z2 + 100) 

                end, 500)

                Delay(4000, function (  )
                    if v.statu ~= 2 then return end
                    v.statu = 3

                    DestroyTimer(v.Animation)

                    DestroyObject(v.weapondObject)

                    v.weapondObject = CreateObject(v.weapondId + 2, x2, y2 - 60, z2 + 100) 

                    v.Animation = CreateTimer(function ( )
                        local x,y,z = GetObjectLocation(v.weapondObject)
                        SetObjectLocation(v.weapondObject, x, y, z - 3)
                    end, 200)

                end)

                v.Delay = CreateTimer(function ( )
                    if v.statu ~= 0 then

                        v.statu = 0
                        v.playerActive = nil

                        DestroyObject(v.weapondObject)
                        v.weapondObject = nil

                        v.weapondId = 0

                        DestroyTimer(v.Animation)
                        v.Animation = nil

                        DestroyTimer(v.Delay)
                    end
                end, 8000)

            elseif v.statu == 3 and v.playerActive == player then

                Weapon.SetWeapon(player, v.weapondId, v.weapondAmmo, true, GetPlayerEquippedWeaponSlot(player), true)

                v.statu = 0
                v.playerActive = nil

                DestroyObject(v.weapondObject)
                v.weapondObject = nil

                v.weapondId = 0

                DestroyTimer(v.Animation)
                v.Animation = nil

                DestroyTimer(v.Delay)

            end
        end
    end
end

AddFunctionExport("Open", OpenMagiqueBox)
AddRemoteEvent("Magic_Box:Open", OpenMagiqueBox)


if DISABLE_COMMANDE == false then

    function create_boxxx(player)
        local x,y,z = GetPlayerLocation(player)
    
        CreateMagiqueBox(x,y,z, 0)
    end

    AddCommand("create_box", create_boxxx)
    AddCommand("open_box", OpenMagiqueBox)
end
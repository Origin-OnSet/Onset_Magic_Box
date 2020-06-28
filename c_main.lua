local sr = ImportPackage("soundstreamer")

local COMMANDE = true

AddRemoteEvent("MagicBox:Setup", function(DISABLE_COMMANDE)
    COMMANDE = DISABLE_COMMANDE
end)

AddEvent("OnKeyPress", function(key)
    if COMMANDE == true then return end

    if key == "E" then
        CallRemoteEvent("MagicBox:Open")      
	end
end)

AddRemoteEvent("MagicBox:PlayerSound", function ( file, x, y, z, r )
	local sound = CreateSound3D("Sound/"..file, x, y, z, r)
	SetSoundVolume(sound, 0.5)  
end)

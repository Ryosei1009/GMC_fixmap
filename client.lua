local QBCore = exports['qb-core']:GetCoreObject()
local isMapFixed = false

RegisterCommand("fixmap", function()
    isMapFixed = not isMapFixed
    
    if isMapFixed then
        LockMinimapAngle(0)
        QBCore.Functions.Notify("マップを北に固定しました", "success")
    else
        UnlockMinimapAngle()
        QBCore.Functions.Notify("マップの固定を解除しました", "error")
    end
end, false)

function LockMinimapAngle(angle)
    Citizen.InvokeNative(0x299FAEBB108AE05B, angle)
end

function UnlockMinimapAngle()
    Citizen.InvokeNative(0x8183455E16C42E3A)
end

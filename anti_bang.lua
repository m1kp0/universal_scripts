local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_lime"))()
local wind = lib:Window("anti bang")

wind:Button("kill banger", function()
    local plr = game.Players.LocalPlayer
    local hrp = plr.Character.HumanoidRootPart
    local old_cframe = hrp.CFrame
    workspace.FallenPartsDestroyHeight = -10000
    hrp.CFrame = CFrame.new(0, -1000, 0)
    task.wait(1)
    hrp.CFrame = old_cframe
    workspace.FallenPartsDestroyHeight = -100
end)

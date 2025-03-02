local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_lime"))()
local wind = lib:Window("anti bang")

wind:Button("press", function()
    local plr = game.Players.LocalPlayer
    local hrp = plr.Character.HumanoidRootPart
    local oldPos = rhp.Position
  workspace.FallenPartsDestroyHeight = -10000
  hrp.CFrame = CFrame.new(0, -1000, 0)
  task.wait(1)
  hrp.CFrame = CFrame.new(oldPos)
  workspace.FallenPartsDestroyHeight = -100
end)

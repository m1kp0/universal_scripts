local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_lime"))()
local wind = lib:Window("anti bang")

wind:Button("press", function()
  oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
  game.Workspace.FallenPartsDestroyHeight = -10000
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -1000, 0)
  wait(1)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldPos)
  game.Workspace.FallenPartsDestroyHeight = -100
end)

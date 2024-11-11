local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/lime"))()
local wind = lib:Window("anti bang")

local localPlayer = game.Players.LocalPlayer
local char = localPlayer.Character
local localHMRP = char.HumanoidRootPart
local CFrame = localHMRP.CFrame
local pos = localHMRP.Position
local oldPos = nil

wind:Button("teleport", function()
  oldPos = pos
  game.Workspace.FallenPartsDestroyHeight = -10000
  CFrame = CFrame.new(0, -1000, 0)
  wait(1)
  CFrame = CFrame.new(oldPos)
end)

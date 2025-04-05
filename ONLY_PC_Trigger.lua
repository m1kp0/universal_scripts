print("[SCRIPT]: loading..")
local others = game.Players
local me = others.LocalPlayer
local mouse = me:GetMouse()
local get_others = game.Players:GetPlayers()
local run_service = game:GetService("RunService")
local auto_shoot = false
local last_click = 0
local max_distance = 1000

local function check_player()
    local hit = mouse.Target
    if hit then
        local character = hit:FindFirstAncestorOfClass("Model")
        if character and others:GetPlayerFromCharacter(character) then
            if auto_shoot and (character.HumanoidRootPart.Position - me.Character.HumanoidRootPart.Position).Magnitude < max_distance then
                return true
            end
        end
    end
    return false
end

print("[SCRIPT]: loaded functions. Loading gui..")
local L = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local W = L:NewWindow("Trigger")
local Main = W:NewSection("Main")

Main:CreateToggle("Toggle trigger", function(en)
    auto_shoot = en
    run_service.Heartbeat:Connect(function()
        run_service.Heartbeat:Wait()
        if auto_shoot and check_player() then
            local current_click = tick()
            if current_click - last_click >= 0.01 then
                mouse1click()
                last_click = current_click
            end
        end
    end)
end)

Main:CreateSlider("Max distance", 0, 1000, 1000, false, function(value) max_distance = value end)
print("[SCRIPT]: loaded gui.")

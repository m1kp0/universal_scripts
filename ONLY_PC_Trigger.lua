print("starting")
local others = game.Players
local me = others.LocalPlayer
local mouse = me:GetMouse()
local get_others = game.Players:GetPlayers()
local run_service = game:GetService("RunService")

-- toggles
local last_click = 0
local auto_shoot = false
local max_distance = math.huge

-- function 
local function check_player()
    local target = mouse.Target
    if target then
        local character = target:FindFirstAncestorOfClass("Model")
        local player = others:GetPlayerFromCharacter(character)
        if character and player then
            if auto_shoot and (character.HumanoidRootPart.Position - me.Character.HumanoidRootPart.Position).Magnitude <= max_distance then
                if character.Humanoid.Health ~= 0 then 
                    return true 
                end
            end
        end
    end
    return false
end

print("loading..")

-- gui
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local window = lib:NewWindow("Universal trigger")
local Main = window:NewSection("Main")

Main:CreateToggle("Toggle trigger", function(en)
    auto_shoot = en
    run_service.Heartbeat:Connect(function()
        run_service.Heartbeat:Wait()
        if auto_shoot and check_player() then
            local current_click = tick()
            if current_click - last_click >= 0.01 then
                mouse1click() -- simulate click
                last_click = current_click
            end
        end
    end)
end)

Main:CreateSlider("Max distance", 1, 1000, 1000, false, function(value) 
    max_distance = value 
end)

print("loaded")

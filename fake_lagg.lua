-- haha open source
-- service
local me = game:GetService"Players".LocalPlayer
local core = game:GetService"CoreGui"
local uis = game:GetService"UserInputService"
local starter_gui = game:GetService"StarterGui"
local tween_service = game:GetService"TweenService"
local char, hum, hrp

-- check loaded
if core:FindFirstChild"Fake_lagg" then
    starter_gui:SetCore(
        "SendNotification", 
        {
            Title = "Fake lagg: Loaded",
            Text = "gui already loaded",
            Duration = 5
        }
    )
    return
else
    print("loading..")
end

-- instance
local gui = Instance.new"ScreenGui"
local bg_frame = Instance.new"Frame"
local minimize_frame = Instance.new"Frame"
local close_btn = Instance.new"TextButton"
local lagg_btn = Instance.new"TextButton"
local standing_btn = Instance.new"TextButton"
local delay_box = Instance.new"TextBox"
local uic1 = Instance.new"UICorner"
local uic2 = Instance.new"UICorner"
local uic3 = Instance.new"UICorner"
local uic4 = Instance.new"UICorner"
local uic5 = Instance.new"UICorner"
local uic6 = Instance.new"UICorner"

-- toggle
local fake_lagg_v = false
local standing_v = false
local dragging_v = false

-- settings
local start_pos = nil
local drag_start = nil
local drag_speed = 0.2
local delay_seconds = 1

-- gui
gui.Parent = core
gui.Name = "Fake_lagg"

bg_frame.Parent = gui
bg_frame.BorderSizePixel = 0
bg_frame.Size = UDim2.new(0, 124, 0, 151)
bg_frame.Position = UDim2.new(0.5, 0, 0.5, 0)
bg_frame.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
bg_frame.Name = "Background_frame"
bg_frame.Visible = false

minimize_frame.Parent = gui
minimize_frame.BorderSizePixel = 0
minimize_frame.Size = UDim2.new(0, 124, 0, 13)
minimize_frame.Position = UDim2.new(0, 0, 0, 0)
minimize_frame.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
minimize_frame.Name = "Minimize_frame"
bg_frame.Visible = false

close_btn.Parent = minimize_frame
close_btn.TextColor3 = Color3.fromRGB(240, 240, 240)
close_btn.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
close_btn.Position = UDim2.new(-0.081, 10, -0.306, 0)
close_btn.Size = UDim2.new(0, 124, 0, 19)
close_btn.BorderSizePixel = 0
close_btn.Text = "Close"
close_btn.Font = Enum.Font.FredokaOne
close_btn.TextSize = 13
close_btn.Name = "Close_button"

lagg_btn.Parent = bg_frame
lagg_btn.TextColor3 = Color3.fromRGB(240, 240, 240)
lagg_btn.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
lagg_btn.Position = UDim2.new(0, 10, 0.151, 0)
lagg_btn.Size = UDim2.new(0, 102, 0, 31)
lagg_btn.BorderSizePixel = 0
lagg_btn.Text = "Lagg: OFF"
lagg_btn.Font = Enum.Font.FredokaOne
lagg_btn.TextSize = 18
lagg_btn.Name = "Lagg_button"

standing_btn.Parent = bg_frame
standing_btn.TextColor3 = Color3.fromRGB(240, 240, 240)
standing_btn.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
standing_btn.Position = UDim2.new(0.087, 0, 0.397, 0)
standing_btn.Size = UDim2.new(0, 102, 0, 31)
standing_btn.BorderSizePixel = 0
standing_btn.Text = "Standing: OFF"
standing_btn.Font = Enum.Font.FredokaOne
standing_btn.TextSize = 18
standing_btn.Name = "Standing_button"

delay_box.Parent = bg_frame
delay_box.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
delay_box.TextColor3 = Color3.fromRGB(240, 240, 240)
delay_box.Position = UDim2.new(0.087, 0,0.643, 0)
delay_box.Size = UDim2.new(0, 102, 0, 42)
delay_box.BorderSizePixel = 0
delay_box.Font = Enum.Font.FredokaOne
delay_box.TextSize = 14
delay_box.PlaceholderText = "Delay seconds"
delay_box.Name = "Delay_textbox"
delay_box.Text = "1"

uic1.Parent = bg_frame
uic2.Parent = minimize_frame
uic3.Parent = close_btn
uic4.Parent = lagg_btn
uic5.Parent = standing_btn
uic6.Parent = delay_box

-- functions
local function create_gui_f()
    bg_frame.Visible = true
    minimize_frame.Visible = true
end

local function fake_lagg_f()
    char = me.Character
    hrp = char.HumanoidRootPart

    hrp.Anchored = true
    task.wait(delay_seconds)
    hrp.Anchored = false
end

local function int(var)
    var = tonumber(var) or var
    return var
end

local function update_input(i)
    local e = i.Position - drag_start
    local pos = UDim2.new(
        start_pos.X.Scale,
        start_pos.X.Offset + e.X, 
        start_pos.Y.Scale, 
        start_pos.Y.Offset + e.Y
    )
    tween_service:Create(bg_frame, TweenInfo.new(drag_speed), {Position = pos}):Play()
    tween_service:Create(minimize_frame, TweenInfo.new(drag_speed), {Position = pos}):Play()
end

-- gui mechanics
close_btn.MouseButton1Click:Connect(function()
    if bg_frame.Visible then
        bg_frame.Visible = false
        close_btn.Text = "Open"
    else
        bg_frame.Visible = true
        close_btn.Text = "Close"
    end
end)

lagg_btn.MouseButton1Click:Connect(function()
    fake_lagg_v = not fake_lagg_v
    if fake_lagg_v then
        lagg_btn.Text = "Lagg: ON"
        while fake_lagg_v do
            if me.Character ~= nil then
                fake_lagg_f()
            else
                break
            end
            task.wait(.1)
        end
    else
        lagg_btn.Text = "Lagg: OFF"
    end
end)

standing_btn.MouseButton1Click:Connect(function()
	standing_v = not standing_v
    if me.Character ~= nil then
        hum = me.Character.Humanoid
        if standing_v then
            standing_btn.Text = "Standing: ON"
            hum.PlatformStand = true
        else
            standing_btn.Text = "Standing: OFF"
            hum.PlatformStand = false
        end
    end
end)

delay_box.FocusLost:Connect(function()
    delay_seconds = int(delay_box.Text)
    if delay_seconds >= 10 then
        delay_seconds = delay_seconds - (delay_seconds - 10)
        starter_gui:SetCore(
            "SendNotification", 
            {
                Title = "Fake lagg: Delay",
                Text = "lower than 10 please",
                Duration = 5
            }
        )
        delay_box.Text = 10
    end
end)

-- dragging
bg_frame.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging_v = true
        drag_start = i.Position
        start_pos = bg_frame.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then dragging_v = false end
        end)
    end 
end)

close_btn.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging_v = true
        drag_start = i.Position
        start_pos = minimize_frame.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then dragging_v = false end
        end)
    end 
end)

uis.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
        if dragging_v then update_input(i) end
    end
end)

-- script
local plrs = game.Players
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local rs = game:GetService'ReplicatedStorage'
local ts = game:GetService'TweenService'
local uis = game:GetService'UserInputService'
local tcs = game:GetService'TextChatService'
local coregui = game:GetService'CoreGui'
local oldChat = tcs.ChatVersion == Enum.ChatVersion.LegacyChatService

-- toggle
local dragging
local lock
local en

-- settings
local startPos = nil
local dragStart = nil
local dragSpeed = 0.2

-- instance
local gui = Instance.new'ScreenGui'
local main = Instance.new'Frame'
local mini = Instance.new'Frame'
local text1 = Instance.new'TextLabel'
local text2 = Instance.new'TextLabel'
local open = Instance.new'TextButton'
local close = Instance.new'TextButton'
local toggle = Instance.new'TextButton'
local minimiz = Instance.new'TextButton'
local lock_btn = Instance.new'TextButton'
local BypassTextbox = Instance.new'TextBox'
local uic1 = Instance.new'UICorner'
local uic2 = Instance.new'UICorner'
local uic3 = Instance.new'UICorner'
local uic4 = Instance.new'UICorner'
local uic5 = Instance.new'UICorner'
local uic6 = Instance.new'UICorner'
local uic7 = Instance.new'UICorner'
local uic8 = Instance.new'UICorner'
local uic9 = Instance.new'UICorner'
local uic10 = Instance.new'UICorner'

-- functions
local function invis_chat(e)
    plrs:Chat(e)
end

local function bypass_chat()
    invis_chat('EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE')
    task.wait()
    invis_chat('/e ABC')
    task.wait()
    invis_chat('le le le le le le le')
    task.wait()
    invis_chat('le le le le le')
    task.wait()
end

-- gui
gui.Parent = coregui
gui.Name = 'bypass gui'

main.Parent = gui
main.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
main.BorderSizePixel = 0
main.Position = UDim2.new(0, 0, 0, 50)
main.Size = UDim2.new(0, 289, 0, 94)
main.Name = 'main frame'

mini.Parent = gui
mini.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
mini.BorderSizePixel = 0
mini.Position = UDim2.new(0, 0, 0, 0)
mini.Size = UDim2.new(0, 50, 0, 19)
mini.Name = 'min frame'
mini.Visible = false

text1.Parent = main
text1.TextColor3 = Color3.fromRGB(240, 240, 240)
text1.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
text1.Position = UDim2.new(0, 0, 0.019, 0)
text1.Size = UDim2.new(0, 157, 0, 17)
text2.BorderSizePixel = 0
text1.Text = 'русский chat bypass'
text1.Name = 'text1'

close.Parent = main
close.TextColor3 = Color3.fromRGB(240, 240, 240)
close.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
close.Position = UDim2.new(0.884, 0, 0, 0)
close.Size = UDim2.new(0, 33, 0, 18)
close.BorderSizePixel = 0
close.Text = 'X'

minimiz.Parent = main
minimiz.TextColor3 = Color3.fromRGB(240, 240, 240)
minimiz.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
minimiz.Position = UDim2.new(0.768, 0, 0, 0)
minimiz.Size = UDim2.new(0, 33, 0, 18)
minimiz.BorderSizePixel = 0
minimiz.Text = '-'

toggle.Parent = main
toggle.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
toggle.TextColor3 = Color3.fromRGB(240, 240, 240)
toggle.Position = UDim2.new(0.024, 0, 0.251, 0)
toggle.Size = UDim2.new(0, 215, 0, 20)
toggle.BorderSizePixel = 0
toggle.Text = 'включить'
toggle.Name = 'toggle'

lock_btn.Parent = main
lock_btn.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
lock_btn.TextColor3 = Color3.fromRGB(240, 240, 240)
lock_btn.Position = UDim2.new(0.797, 0, 0.254, 0)
lock_btn.Size = UDim2.new(0, 53, 0, 20)
lock_btn.BorderSizePixel = 0
lock_btn.Text = 'lock'
lock_btn.Name = 'toggle'

BypassTextbox.Parent = main
BypassTextbox.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
BypassTextbox.TextColor3 = Color3.fromRGB(240, 240, 240)
BypassTextbox.Position = UDim2.new(0.024, 0, 0.534, 0)
BypassTextbox.Size = UDim2.new(0, 277, 0, 34)
BypassTextbox.BorderSizePixel = 0
BypassTextbox.PlaceholderText = 'пиши сюда..'
BypassTextbox.Name = 'BypassTextbox'
BypassTextbox.Text = ''

open.Parent = mini
open.TextColor3 = Color3.fromRGB(240, 240, 240)
open.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
open.Position = UDim2.new(0, 0, 0, 0)
open.Size = UDim2.new(0, 50, 0, 18)
open.BorderSizePixel = 0
open.Text = 'open'

uic1.Parent = main
uic2.Parent = text1
uic3.Parent = text2
uic4.Parent = toggle
uic5.Parent = BypassTextbox
uic6.Parent = lock_btn
uic7.Parent = close
uic8.Parent = minimiz
uic9.Parent = open
uic10.Parent = mini

-- work
minimiz.MouseButton1Click:Connect(function() 
    minimiz.Text = '-'
    main.Visible = false
    mini.Visible = true
    open.Visible = true
end)

open.MouseButton1Click:Connect(function() 
    main.Visible = true
    minimiz.Text = '-'
    open.Visible = false
    mini.Visible = false
end)

close.MouseButton1Click:Connect(function() 
    for i, gui in pairs(game.CoreGui:GetDescendants()) do
        if gui.Name == 'bypass gui' then
            gui:Destroy()
        end
    end
end)

lock_btn.MouseButton1Click:Connect(function() 
    if lock_btn.Text == 'lock' then
        lock = true
        lock_btn.Text = 'unlock'
    else
        lock = false
        lock_btn.Text = 'lock'
    end
end)

toggle.MouseButton1Click:Connect(function()
    if toggle.Text == 'включить' then
        en = true
        toggle.Text = 'выключить'
        repeat task.wait()
            bypass_chat()
        until en == false
    else
        en = false
        toggle.Text = 'включить'
    end
end)

BypassTextbox.FocusLost:Connect(function()
    bypass_chat()
    if oldChat then
        rs.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(BypassTextbox.Text, 'All')
    else
        tcs.TextChannels.RBXGeneral:SendAsync(BypassTextbox.Text)
    end
	BypassTextbox.Text = ''
end)

mouse.KeyDown:Connect(function(key) 
    if key == '/' then
        task.wait()
        BypassTextbox:CaptureFocus()
	end
end)

-- drag
local function updateInput(inp)
    local e = inp.Position - dragStart
    local pos = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + e.X, 
        startPos.Y.Scale, 
        startPos.Y.Offset + e.Y
    )
    ts:Create(main, TweenInfo.new(dragSpeed), {Position = pos}):Play()
    ts:Create(open, TweenInfo.new(dragSpeed), {Position = pos}):Play()
end

main.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = inp.Position
        startPos = main.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end 
end)

open.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = inp.Position
        startPos = main.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end 
end)

uis.InputChanged:Connect(function(inp)
    if not lock then
        if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
            if dragging then updateInput(inp) end
        end
    end
end)

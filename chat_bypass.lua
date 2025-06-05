-- script
    local plrs = game.Players
    local plr = plrs.LocalPlayer
    local mouse = plr:GetMouse()
    local rs = game:GetService'ReplicatedStorage'
    local ts = game:GetService'TweenService'
    local uis = game:GetService'UserInputService'
    local tcs = game:GetService'TextChatService'
    local coregui = game:GetService'CoreGui'
    local old_chat = tcs.ChatVersion == Enum.ChatVersion.LegacyChatService

-- toggle
    local dragging, lock, en

-- settings
    local start_pos = nil
    local drag_start = nil
    local drag_speed = 0.2

-- instance
    local instances = {
        gui = Instance.new'ScreenGui',
        main = Instance.new'Frame',
        mini = Instance.new'Frame',
        text1 = Instance.new'TextLabel',
        text2 = Instance.new'TextLabel',
        open = Instance.new'TextButton',
        close = Instance.new'TextButton',
        toggle = Instance.new'TextButton',
        minimiz = Instance.new'TextButton',
        lock_btn = Instance.new'TextButton',
        bypass_textbox = Instance.new'TextBox',
        uic = Instance.new'UICorner'
    }

-- functions
    local function invis_chat(e) plrs:Chat(e) end
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
    instances.gui.Parent = coregui
    instances.gui.Name = 'bypass gui'

    instances.main.Parent = instances.gui
    instances.main.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
    instances.main.BorderSizePixel = 0
    instances.main.Position = UDim2.new(0, 0, 0, 50)
    instances.main.Size = UDim2.new(0, 289, 0, 94)
    instances.main.Name = 'main frame'

    instances.mini.Parent = instances.gui
    instances.mini.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
    instances.mini.BorderSizePixel = 0
    instances.mini.Position = UDim2.new(0, 0, 0, 0)
    instances.mini.Size = UDim2.new(0, 50, 0, 19)
    instances.mini.Name = 'min frame'
    instances.mini.Visible = false

    instances.text1.Parent = instances.main
    instances.text1.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.text1.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
    instances.text1.Position = UDim2.new(0, 0, 0.019, 0)
    instances.text1.Size = UDim2.new(0, 157, 0, 17)
    instances.text1.BorderSizePixel = 0
    instances.text1.Text = 'русский chat bypass'
    instances.text1.Name = 'text1'

    instances.close.Parent = instances.main
    instances.close.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.close.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
    instances.close.Position = UDim2.new(0.884, 0, 0, 0)
    instances.close.Size = UDim2.new(0, 33, 0, 18)
    instances.close.BorderSizePixel = 0
    instances.close.Text = 'X'

    instances.minimiz.Parent = instances.main
    instances.minimiz.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.minimiz.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
    instances.minimiz.Position = UDim2.new(0.768, 0, 0, 0)
    instances.minimiz.Size = UDim2.new(0, 33, 0, 18)
    instances.minimiz.BorderSizePixel = 0
    instances.minimiz.Text = '-'

    instances.toggle.Parent = instances.main
    instances.toggle.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
    instances.toggle.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.toggle.Position = UDim2.new(0.024, 0, 0.251, 0)
    instances.toggle.Size = UDim2.new(0, 215, 0, 20)
    instances.toggle.BorderSizePixel = 0
    instances.toggle.Text = 'включить'
    instances.toggle.Name = 'toggle'

    instances.lock_btn.Parent = instances.main
    instances.lock_btn.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
    instances.lock_btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.lock_btn.Position = UDim2.new(0.797, 0, 0.254, 0)
    instances.lock_btn.Size = UDim2.new(0, 53, 0, 20)
    instances.lock_btn.BorderSizePixel = 0
    instances.lock_btn.Text = 'lock'
    instances.lock_btn.Name = 'toggle'

    instances.bypass_textbox.Parent = instances.main
    instances.bypass_textbox.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
    instances.bypass_textbox.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.bypass_textbox.Position = UDim2.new(0.024, 0, 0.534, 0)
    instances.bypass_textbox.Size = UDim2.new(0, 277, 0, 34)
    instances.bypass_textbox.BorderSizePixel = 0
    instances.bypass_textbox.PlaceholderText = 'пиши сюда..'
    instances.bypass_textbox.Name = 'bypass_textbox'
    instances.bypass_textbox.Text = ''

    instances.open.Parent = instances.mini
    instances.open.TextColor3 = Color3.fromRGB(240, 240, 240)
    instances.open.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
    instances.open.Position = UDim2.new(0, 0, 0, 0)
    instances.open.Size = UDim2.new(0, 50, 0, 18)
    instances.open.BorderSizePixel = 0
    instances.open.Text = 'open'

-- add corners
    for i, e in pairs(instances) do local corner = instances.uic:Clone(); corner.Parent = e end

-- work
    instances.minimiz.MouseButton1Click:Connect(function() instances.minimiz.Text = '-'; instances.main.Visible = false; instances.mini.Visible = true; instances.open.Visible = true end)
    instances.open.MouseButton1Click:Connect(function() instances.minimiz.Text = '-'; instances.main.Visible = true; instances.open.Visible = false; instances.mini.Visible = false end)
    instances.close.MouseButton1Click:Connect(function() coregui:FindFirstChild('bypass gui'):Destroy() end)
    instances.lock_btn.MouseButton1Click:Connect(function()  if instances.lock_btn.Text == 'lock' then lock = true; instances.lock_btn.Text = 'unlock' else lock = false; instances.lock_btn.Text = 'lock' end end)
    instances.toggle.MouseButton1Click:Connect(function()
        if instances.toggle.Text == 'включить' then
            en = true; instances.toggle.Text = 'выключить'; repeat task.wait(.1); task.spawn(bypass_chat) until en == false
        else
            en = false; instances.toggle.Text = 'включить'
        end
    end)
    instances.bypass_textbox.FocusLost:Connect(function()
        task.spawn(bypass_chat); if old_chat then 
            rs.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(instances.bypass_textbox.Text, 'All')
        else 
            tcs.TextChannels.RBXGeneral:SendAsync(instances.bypass_textbox.Text) 
        end; instances.bypass_textbox.Text = ''
    end)

-- auto focus
    mouse.KeyDown:Connect(function(key) if key == '/' then task.wait(); instances.bypass_textbox:CaptureFocus() end end)

-- drag
    local function update_input(inp)
        local e = inp.Position - drag_start
        local pos = UDim2.new(start_pos.X.Scale, start_pos.X.Offset + e.X, start_pos.Y.Scale, start_pos.Y.Offset + e.Y)
        ts:Create(instances.main, TweenInfo.new(drag_speed), {Position = pos}):Play()
        ts:Create(instances.open, TweenInfo.new(drag_speed), {Position = pos}):Play()
    end

    instances.main.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true; drag_start = inp.Position; start_pos = instances.main.Position
            inp.Changed:Connect(function() if inp.UserInputState == Enum.UserInputState.End then dragging =  false end end)
        end 
    end)

    instances.open.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true; drag_start = inp.Position; start_pos = instances.main.Position
            inp.Changed:Connect(function() if inp.UserInputState == Enum.UserInputState.End then dragging =  false end end)
        end 
    end)

    uis.InputChanged:Connect(function(inp)
        if not lock then
            if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
                if dragging then update_input(inp) end
            end
        end
    end)

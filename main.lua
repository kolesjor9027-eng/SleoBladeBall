-- Blade Ball Mod Menu
-- Created by SLEO
-- Supports PC & Mobile

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local isMobile = userInputService.TouchEnabled

-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SleoModMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Scale for mobile
local scale = 1
if isMobile then
    scale = 1.5
end

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300 * scale, 0, 500 * scale)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Minimized Logo Button (RGB)
local logoButton = Instance.new("TextButton")
logoButton.Size = UDim2.new(0, 50 * scale, 0, 50 * scale)
logoButton.Position = UDim2.new(0, 10, 0, 10)
logoButton.Text = "SLEO"
logoButton.Font = Enum.Font.GothamBold
logoButton.TextSize = 14 * scale
logoButton.BorderSizePixel = 0
logoButton.Parent = screenGui

-- RGB animation for logo
spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.01) % 1
        logoButton.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        logoButton.TextColor3 = Color3.fromHSV((hue + 0.5) % 1, 1, 1)
        task.wait(0.05)
    end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35 * scale)
title.Text = "SLEO MADE THIS"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.Font = Enum.Font.GothamBold
title.TextSize = 22 * scale
title.Parent = mainFrame

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30 * scale, 0, 30 * scale)
closeButton.Position = UDim2.new(1, -35 * scale, 0, 2)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18 * scale
closeButton.Parent = mainFrame

-- Minimize Button (_)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30 * scale, 0, 30 * scale)
minimizeButton.Position = UDim2.new(1, -70 * scale, 0, 2)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimizeButton.BorderSizePixel = 0
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 18 * scale
minimizeButton.Parent = mainFrame

-- Main Tab Button
local mainTab = Instance.new("TextButton")
mainTab.Size = UDim2.new(0.5, 0, 0, 30 * scale)
mainTab.Position = UDim2.new(0, 0, 0, 35 * scale)
mainTab.Text = "MAIN"
mainTab.TextColor3 = Color3.new(1, 1, 1)
mainTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainTab.BorderSizePixel = 0
mainTab.Font = Enum.Font.GothamBold
mainTab.TextSize = 16 * scale
mainTab.Parent = mainFrame

-- Trade Tab Button
local tradeTab = Instance.new("TextButton")
tradeTab.Size = UDim2.new(0.5, 0, 0, 30 * scale)
tradeTab.Position = UDim2.new(0.5, 0, 0, 35 * scale)
tradeTab.Text = "TRADE"
tradeTab.TextColor3 = Color3.new(1, 1, 1)
tradeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tradeTab.BorderSizePixel = 0
tradeTab.Font = Enum.Font.GothamBold
tradeTab.TextSize = 16 * scale
tradeTab.Parent = mainFrame

-- Container for features
local featureContainer = Instance.new("Frame")
featureContainer.Size = UDim2.new(1, 0, 1, -70 * scale)
featureContainer.Position = UDim2.new(0, 0, 0, 70 * scale)
featureContainer.BackgroundTransparency = 1
featureContainer.Parent = mainFrame

-- Function to create toggle with label (mobile friendly)
local function createToggle(name, yPos, container)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.95, 0, 0, 50 * scale)
    frame.Position = UDim2.new(0.025, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 12 * scale
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = frame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60 * scale, 0, 30 * scale)
    button.Position = UDim2.new(0.7, 0, 0.5, -15 * scale)
    button.Text = "OFF"
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.TextSize = 14 * scale
    button.Parent = frame
    
    return {frame = frame, button = button, label = label, isOn = false}
end

-- Function to create speed changer (mobile friendly)
local function createSpeedChanger(name, yPos, container)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.95, 0, 0, 50 * scale)
    frame.Position = UDim2.new(0.025, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.35, 0, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 12 * scale
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 70 * scale, 0, 30 * scale)
    textBox.Position = UDim2.new(0.38, 0, 0.5, -15 * scale)
    textBox.Text = "16"
    textBox.TextColor3 = Color3.new(1, 1, 1)
    textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    textBox.BorderSizePixel = 0
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 14 * scale
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60 * scale, 0, 30 * scale)
    button.Position = UDim2.new(0.7, 0, 0.5, -15 * scale)
    button.Text = "OFF"
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.TextSize = 14 * scale
    button.Parent = frame
    
    return {frame = frame, button = button, textBox = textBox, label = label, isOn = false}
end

-- Main Features Container
local mainContainer = Instance.new("ScrollingFrame")
mainContainer.Size = UDim2.new(1, 0, 1, 0)
mainContainer.BackgroundTransparency = 1
mainContainer.ScrollBarThickness = 5 * scale
mainContainer.CanvasSize = UDim2.new(0, 0, 0, 400 * scale)
mainContainer.Parent = featureContainer

-- Trade Features Container
local tradeContainer = Instance.new("ScrollingFrame")
tradeContainer.Size = UDim2.new(1, 0, 1, 0)
tradeContainer.BackgroundTransparency = 1
tradeContainer.ScrollBarThickness = 5 * scale
tradeContainer.CanvasSize = UDim2.new(0, 0, 0, 200 * scale)
tradeContainer.Visible = false
tradeContainer.Parent = featureContainer

-- Create Main Features
local autoParryToggle = createToggle("Auto Parry (Auto Detect Ability)", 5 * scale, mainContainer)
local autoJumpToggle = createToggle("Auto Jump", 60 * scale, mainContainer)
local speedChanger = createSpeedChanger("Speed Changer", 115 * scale, mainContainer)

-- Create Trade Features
local freezeTradeToggle = createToggle("Freeze Trade", 5 * scale, tradeContainer)
local forceAcceptToggle = createToggle("Force Accept", 60 * scale, tradeContainer)

-- Tab switching
mainTab.MouseButton1Click:Connect(function()
    mainContainer.Visible = true
    tradeContainer.Visible = false
    mainTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    tradeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

tradeTab.MouseButton1Click:Connect(function()
    mainContainer.Visible = false
    tradeContainer.Visible = true
    tradeTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    mainTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

-- Logo button toggles main menu
logoButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Close button hides everything
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Minimize button hides main frame but shows logo
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Remote Event
local remote = Instance.new("RemoteEvent")
remote.Name = "SleoModEvents"
remote.Parent = game.ReplicatedStorage

-- Bypass Anti-Cheat
spawn(function()
    task.wait(1)
    -- Anti-cheat bypass
    local success, err = pcall(function()
        -- Disable anti-cheat scripts
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Script") or v:IsA("LocalScript") then
                if v.Name:lower():find("anticheat") or v.Name:lower():find("anti") or v.Name:lower():find("cheat") or v.Name:lower():find("detect") then
                    v.Disabled = true
                end
            end
        end
        
        -- Disable anti-cheat remote events
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                if v.Name:lower():find("anticheat") or v.Name:lower():find("anti") or v.Name:lower():find("cheat") or v.Name:lower():find("detect") or v.Name:lower():find("report") then
                    v:Destroy()
                end
            end
        end
        
        -- Disable anti-cheat modules
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ModuleScript") then
                if v.Name:lower():find("anticheat") or v.Name:lower():find("anti") or v.Name:lower():find("cheat") or v.Name:lower():find("detect") then
                    v:Destroy()
                end
            end
        end
    end)
    
    -- Notify user
    local notification = Instance.new("ScreenGui")
    notification.Name = "BypassNotification"
    notification.ResetOnSpawn = false
    notification.Parent = player:WaitForChild("PlayerGui")
    
    local notifyFrame = Instance.new("Frame")
    notifyFrame.Size = UDim2.new(0, 300 * scale, 0, 50 * scale)
    notifyFrame.Position = UDim2.new(0.5, -150 * scale, 0.5, -25 * scale)
    notifyFrame.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    notifyFrame.BorderSizePixel = 0
    notifyFrame.BackgroundTransparency = 0.2
    notifyFrame.Parent = notification
    
    local notifyLabel = Instance.new("TextLabel")
    notifyLabel.Size = UDim2.new(1, 0, 1, 0)
    notifyLabel.Text = "BYPASSED ANTI-CHEAT"
    notifyLabel.TextColor3 = Color3.new(1, 1, 1)
    notifyLabel.BackgroundTransparency = 1
    notifyLabel.Font = Enum.Font.GothamBold
    notifyLabel.TextSize = 20 * scale
    notifyLabel.Parent = notifyFrame
    
    -- Remove notification after 3 seconds
    task.wait(3)
    notification:Destroy()
end)

-- Toggle function (works for both mouse and touch)
local function setupToggle(toggleData, modName)
    toggleData.button.MouseButton1Click:Connect(function()
        toggleData.isOn = not toggleData.isOn
        if toggleData.isOn then
            toggleData.button.Text = "ON"
            toggleData.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        else
            toggleData.button.Text = "OFF"
            toggleData.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
        remote:FireServer(modName, toggleData.isOn)
    end)
    
    -- Touch support for mobile
    if isMobile then
        toggleData.button.TouchTap:Connect(function()
            toggleData.isOn = not toggleData.isOn
            if toggleData.isOn then
                toggleData.button.Text = "ON"
                toggleData.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            else
                toggleData.button.Text = "OFF"
                toggleData.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            end
            remote:FireServer(modName, toggleData.isOn)
        end)
    end
end

setupToggle(autoParryToggle, "autoParry")
setupToggle(autoJumpToggle, "autoJump")
setupToggle(freezeTradeToggle, "freezeTrade")
setupToggle(forceAcceptToggle, "forceAccept")

-- Speed Changer (works for both mouse and touch)
speedChanger.button.MouseButton1Click:Connect(function()
    speedChanger.isOn = not speedChanger.isOn
    if speedChanger.isOn then
        speedChanger.button.Text = "ON"
        speedChanger.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        local speed = tonumber(speedChanger.textBox.Text)
        if speed and speed >= 1 and speed <= 5000 then
            remote:FireServer("speedChanger", true, speed)
        else
            speedChanger.textBox.Text = "16"
            remote:FireServer("speedChanger", true, 16)
        end
    else
        speedChanger.button.Text = "OFF"
        speedChanger.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        remote:FireServer("speedChanger", false, tonumber(speedChanger.textBox.Text) or 16)
    end
end)

-- Touch support for mobile on speed changer
if isMobile then
    speedChanger.button.TouchTap:Connect(function()
        speedChanger.isOn = not speedChanger.isOn
        if speedChanger.isOn then
            speedChanger.button.Text = "ON"
            speedChanger.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            local speed = tonumber(speedChanger.textBox.Text)
            if speed and speed >= 1 and speed <= 5000 then
                remote:FireServer("speedChanger", true, speed)
            else
                speedChanger.textBox.Text = "16"
                remote:FireServer("speedChanger", true, 16)
            end
        else
            speedChanger.button.Text = "OFF"
            speedChanger.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            remote:FireServer("speedChanger", false, tonumber(speedChanger.textBox.Text) or 16)
        end
    end)
end

-- Server-side script (put this in ServerScriptService)
local modData = {}

game.ReplicatedStorage.SleoModEvents.OnServerEvent:Connect(function(player, action, state, value)
    if not modData[player] then
        modData[player] = {}
    end
    modData[player][action] = state
    modData[player][action .. "_value"] = value
    
    if action == "autoParry" then
        local connection
        connection = runService.Heartbeat:Connect(function()
            if not modData[player] or not modData[player].autoParry then
                connection:Disconnect()
                return
            end
            local character = player.Character
            if not character then return end
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            -- Find all balls in workspace
            for _, ball in pairs(workspace:GetChildren()) do
                if ball:IsA("Part") and ball.Name:find("Ball") then
                    local distance = (ball.Position - humanoidRootPart.Position).Magnitude
                    
                    -- Auto parry when ball is very close
                    if distance < 2 then
                        local sword = character:FindFirstChildOfClass("Tool")
                        if sword then
                            -- Auto spam during clash
                            for i = 1, 10 do
                                sword:Activate()
                                task.wait(0.01)
                            end
                        end
                    end
                    
                    -- Detect and counter all abilities
                    if ball:FindFirstChild("Ability") then
                        local ability = ball.Ability
                        if ability.Value == "Pulse" or ability.Value == "Shadow" or ability.Value == "Riptide" or ability.Value == "Flame" or ability.Value == "Gravity" or ability.Value == "Freeze" or ability.Value == "Wind" or ability.Value == "Thunder" then
                            -- Auto counter any ability
                            local sword = character:FindFirstChildOfClass("Tool")
                            if sword then
                                sword:Activate()
                                task.wait(0.05)
                                sword:Activate()
                            end
                        end
                    end
                end
            end
        end)
        
    elseif action == "autoJump" then
        local connection
        connection = runService.Heartbeat:Connect(function()
            if not modData[player] or not modData[player].autoJump then
                connection:Disconnect()
                return
            end
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
                    humanoid.Jump = true
                    task.wait(0.1)
                    humanoid.Jump = false
                end
            end
        end)
        
    elseif action == "speedChanger" then
        local connection
        connection = runService.Heartbeat:Connect(function()
            if not modData[player] or not modData[player].speedChanger then
                connection:Disconnect()
                return
            end
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = modData[player].speedChanger_value or 16
                end
            end
        end)
        
    elseif action == "freezeTrade" then
        -- Freeze trade GUI
        local playerGui = player:FindFirstChild("PlayerGui")
        if playerGui then
            local tradeGui = playerGui:FindFirstChild("TradeGUI") or playerGui:FindFirstChild("Trade")
            if tradeGui then
                tradeGui.Enabled = not state
            end
        end
        
    elseif action == "forceAccept" then
        -- Force accept trade
        local playerGui = player:FindFirstChild("PlayerGui")
        if playerGui then
            local tradeGui = playerGui:FindFirstChild("TradeGUI") or playerGui:FindFirstChild("Trade")
            if tradeGui then
                local acceptButton = tradeGui:FindFirstChild("AcceptButton") or tradeGui:FindFirstChild("Accept")
                if acceptButton and acceptButton:IsA("TextButton") then
                    acceptButton:Fire()
                end
            end
        end
    end
end)

print("SLEO Blade Ball Mod Menu Loaded! (PC & Mobile Supported)")
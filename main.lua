-- Blade Ball Mod Menu
-- Created by SLEO
-- Supports PC & Mobile

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
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
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35 * scale)
title.Text = "SLEO MADE THIS"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.Font = Enum.Font.GothamBold
title.TextSize = 22 * scale
title.Parent = mainFrame

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
    
    return {frame = frame, button = button, label = label}
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
    
    return {frame = frame, button = button, textBox = textBox, label = label}
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

-- Remote Event
local remote = Instance.new("RemoteEvent")
remote.Name = "SleoModEvents"
remote.Parent = game.ReplicatedStorage

-- Toggle function (works for both mouse and touch)
local function setupToggle(toggleData, modName)
    toggleData.button.MouseButton1Click:Connect(function()
        local isOn = toggleData.button.Text == "ON"
        if isOn then
            toggleData.button.Text = "OFF"
            toggleData.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            remote:FireServer(modName, false)
        else
            toggleData.button.Text = "ON"
            toggleData.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            remote:FireServer(modName, true)
        end
    end)
    
    -- Touch support for mobile
    if isMobile then
        toggleData.button.TouchTap:Connect(function()
            local isOn = toggleData.button.Text == "ON"
            if isOn then
                toggleData.button.Text = "OFF"
                toggleData.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                remote:FireServer(modName, false)
            else
                toggleData.button.Text = "ON"
                toggleData.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
                remote:FireServer(modName, true)
            end
        end)
    end
end

setupToggle(autoParryToggle, "autoParry")
setupToggle(autoJumpToggle, "autoJump")
setupToggle(freezeTradeToggle, "freezeTrade")
setupToggle(forceAcceptToggle, "forceAccept")

-- Speed Changer (works for both mouse and touch)
speedChanger.button.MouseButton1Click:Connect(function()
    local isOn = speedChanger.button.Text == "ON"
    if isOn then
        speedChanger.button.Text = "OFF"
        speedChanger.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        remote:FireServer("speedChanger", false, tonumber(speedChanger.textBox.Text) or 16)
    else
        local speed = tonumber(speedChanger.textBox.Text)
        if speed and speed >= 1 and speed <= 5000 then
            speedChanger.button.Text = "ON"
            speedChanger.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            remote:FireServer("speedChanger", true, speed)
        else
            speedChanger.textBox.Text = "16"
        end
    end
end)

-- Touch support for mobile on speed changer
if isMobile then
    speedChanger.button.TouchTap:Connect(function()
        local isOn = speedChanger.button.Text == "ON"
        if isOn then
            speedChanger.button.Text = "OFF"
            speedChanger.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            remote:FireServer("speedChanger", false, tonumber(speedChanger.textBox.Text) or 16)
        else
            local speed = tonumber(speedChanger.textBox.Text)
            if speed and speed >= 1 and speed <= 5000 then
                speedChanger.button.Text = "ON"
                speedChanger.button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
                remote:FireServer("speedChanger", true, speed)
            else
                speedChanger.textBox.Text = "16"
            end
        end
    end)
end

print("SLEO Blade Ball Mod Menu Loaded! (PC & Mobile Supported)")
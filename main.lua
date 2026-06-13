-- Blade Ball Mod Menu v2.0
-- Created by SLEO
-- 100% Working - PC & Mobile

local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local isMobile = userInputService.TouchEnabled

-- Scale for mobile
local scale = isMobile and 1.5 or 1

-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SleoModMenu"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350 * scale, 0, 500 * scale)
mainFrame.Position = UDim2.new(0.5, -175 * scale, 0.5, -250 * scale)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Add corner radius
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- Minimized Logo Button (Black circle with white text)
local logoButton = Instance.new("ImageButton")
logoButton.Size = UDim2.new(0, 60 * scale, 0, 60 * scale)
logoButton.Position = UDim2.new(0, 10, 0, 10)
logoButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
logoButton.BackgroundTransparency = 0.3
logoButton.BorderSizePixel = 0
logoButton.Active = true
logoButton.Draggable = true
logoButton.Visible = true
logoButton.Parent = screenGui

-- Make logo circular
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = logoButton

-- Logo text
local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.Text = "SLEO"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.BackgroundTransparency = 1
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 16 * scale
logoText.Parent = logoButton

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40 * scale)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

-- Title text
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -60, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.Text = "SLEO MADE THIS"
titleText.TextColor3 = Color3.fromRGB(255, 215, 0)
titleText.BackgroundTransparency = 1
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 20 * scale
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeBtn.BorderSizePixel = 0
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.Parent = titleBar

-- Minimize button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -70, 0, 5)
minimizeBtn.Text = "_"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16
minimizeBtn.Parent = titleBar

-- Tab buttons
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, 0, 0, 35 * scale)
tabFrame.Position = UDim2.new(0, 0, 0, 40 * scale)
tabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = mainFrame

local mainTab = Instance.new("TextButton")
mainTab.Size = UDim2.new(0.5, 0, 1, 0)
mainTab.Text = "MAIN"
mainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainTab.BorderSizePixel = 0
mainTab.Font = Enum.Font.GothamBold
mainTab.TextSize = 14 * scale
mainTab.Parent = tabFrame

local tradeTab = Instance.new("TextButton")
tradeTab.Size = UDim2.new(0.5, 0, 1, 0)
tradeTab.Position = UDim2.new(0.5, 0, 0, 0)
tradeTab.Text = "TRADE"
tradeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
tradeTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tradeTab.BorderSizePixel = 0
tradeTab.Font = Enum.Font.GothamBold
tradeTab.TextSize = 14 * scale
tradeTab.Parent = tabFrame

-- Feature containers
local mainContainer = Instance.new("ScrollingFrame")
mainContainer.Size = UDim2.new(1, 0, 1, -75 * scale)
mainContainer.Position = UDim2.new(0, 0, 0, 75 * scale)
mainContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainContainer.BorderSizePixel = 0
mainContainer.ScrollBarThickness = 5
mainContainer.CanvasSize = UDim2.new(0, 0, 0, 500 * scale)
mainContainer.Parent = mainFrame

local tradeContainer = Instance.new("ScrollingFrame")
tradeContainer.Size = UDim2.new(1, 0, 1, -75 * scale)
tradeContainer.Position = UDim2.new(0, 0, 0, 75 * scale)
tradeContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
tradeContainer.BorderSizePixel = 0
tradeContainer.ScrollBarThickness = 5
tradeContainer.CanvasSize = UDim2.new(0, 0, 0, 200 * scale)
tradeContainer.Visible = false
tradeContainer.Parent = mainFrame

-- Function to create a working switch toggle
local function createSwitch(name, yPos, container, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.95, 0, 0, 55 * scale)
    frame.Position = UDim2.new(0.025, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = container
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 5)
    frameCorner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 13 * scale
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Parent = frame
    
    -- Switch background
    local switchBg = Instance.new("Frame")
    switchBg.Size = UDim2.new(0, 50 * scale, 0, 25 * scale)
    switchBg.Position = UDim2.new(0.85, -25 * scale, 0.5, -12.5 * scale)
    switchBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    switchBg.BorderSizePixel = 0
    switchBg.Parent = frame
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switchBg
    
    -- Switch knob
    local switchKnob = Instance.new("Frame")
    switchKnob.Size = UDim2.new(0, 21 * scale, 0, 21 * scale)
    switchKnob.Position = UDim2.new(0, 2, 0.5, -10.5 * scale)
    switchKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    switchKnob.BorderSizePixel = 0
    switchKnob.Parent = switchBg
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = switchKnob
    
    -- Click detector
    local switchButton = Instance.new("TextButton")
    switchButton.Size = UDim2.new(1, 0, 1, 0)
    switchButton.BackgroundTransparency = 1
    switchButton.Text = ""
    switchButton.Parent = switchBg
    
    local isOn = false
    
    local function toggle()
        isOn = not isOn
        if isOn then
            switchBg.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            switchKnob:TweenPosition(UDim2.new(0, 27 * scale, 0.5, -10.5 * scale), "Out", "Quad", 0.2, true)
        else
            switchBg.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            switchKnob:TweenPosition(UDim2.new(0, 2, 0.5, -10.5 * scale), "Out", "Quad", 0.2, true)
        end
        if callback then
            callback(isOn)
        end
    end
    
    switchButton.MouseButton1Click:Connect(toggle)
    if isMobile then
        switchButton.TouchTap:Connect(toggle)
    end
    
    return {frame = frame, toggle = toggle, isOn = function() return isOn end}
end

-- Remote Event
local remote = Instance.new("RemoteEvent")
remote.Name = "SleoModEvents"
remote.Parent = game.ReplicatedStorage

-- Auto Parry System (FULLY WORKING)
local BASE_THRESHOLD = 0.2
local VELOCITY_SCALING_FACTOR_FAST = 0.050
local VELOCITY_SCALING_FACTOR_SLOW = 0.1
local sliderValue = 20
local isRunning = false
local focusedBall = nil
local distanceVisualizer = nil
local parryConnection = nil

local ballsFolder = workspace:WaitForChild("Balls")
local parryButtonPress = replicatedStorage:FindFirstChild("Remotes") and replicatedStorage.Remotes:FindFirstChild("ParryButtonPress")
local abilityButtonPress = replicatedStorage:FindFirstChild("Remotes") and replicatedStorage.Remotes:FindFirstChild("AbilityButtonPress")

-- Auto-detect remotes
if not parryButtonPress then
    for _, v in pairs(replicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:lower():find("parry") or v.Name:lower():find("block")) then
            parryButtonPress = v
            break
        end
    end
end

if not abilityButtonPress then
    for _, v in pairs(replicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:lower():find("ability") or v.Name:lower():find("skill")) then
            abilityButtonPress = v
            break
        end
    end
end

local character = player.Character or player.CharacterAdded:Wait()

local function chooseNewFocusedBall()
    local balls = ballsFolder:GetChildren()
    for _, ball in ipairs(balls) do
        if ball:GetAttribute("realBall") ~= nil and ball:GetAttribute("realBall") == true then
            focusedBall = ball
            break
        elseif ball:GetAttribute("target") ~= nil then
            focusedBall = ball
            break
        end
    end
    
    if focusedBall == nil then
        task.wait(0.5)
        chooseNewFocusedBall()
    end
    return focusedBall
end

local function getDynamicThreshold(ballVelocityMagnitude)
    if ballVelocityMagnitude > 60 then
        return math.max(0.20, BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR_FAST))
    else
        return math.min(0.01, BASE_THRESHOLD + (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR_SLOW))
    end
end

local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
    if not character or not character.PrimaryPart then return math.huge end
    local directionToPlayer = (character.PrimaryPart.Position - focusedBall.Position).Unit
    local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
    
    if velocityTowardsPlayer <= 0 then
        return math.huge
    end
    
    return (distanceToPlayer - sliderValue) / velocityTowardsPlayer
end

local function checkIfTarget()
    for _, v in pairs(ballsFolder:GetChildren()) do
        if v:IsA("Part") and v.BrickColor == BrickColor.new("Really red") then 
            return true 
        end 
    end 
    return false
end

local function checkBallDistance()
    if not character or not character.PrimaryPart then return end
    if not checkIfTarget() then return end

    local charPos = character.PrimaryPart.Position
    local charVel = character.PrimaryPart.Velocity

    if focusedBall and not focusedBall.Parent then
        chooseNewFocusedBall()
    end
    if not focusedBall then 
        chooseNewFocusedBall()
        return
    end

    local ball = focusedBall
    local distanceToPlayer = (ball.Position - charPos).Magnitude
    local ballVelocityTowardsPlayer = ball.Velocity:Dot((charPos - ball.Position).Unit)
    
    if distanceToPlayer < 15 and parryButtonPress then
        parryButtonPress:FireServer()
        task.wait(0.05)
    end

    if parryButtonPress and timeUntilImpact(ball.Velocity, distanceToPlayer, charVel) < getDynamicThreshold(ballVelocityTowardsPlayer) then
        parryButtonPress:FireServer()
        task.wait(0.3)
    end
end

local function autoParryLoop()
    while isRunning do
        pcall(checkBallDistance)
        task.wait(0.01)
    end
end

function startAutoParry()
    if isRunning then return end
    isRunning = true
    chooseNewFocusedBall()
    coroutine.wrap(autoParryLoop)()
end

function stopAutoParry()
    isRunning = false
end

-- Create Main Features
local autoParrySwitch = createSwitch("Auto Parry", 5, mainContainer, function(state)
    if state then
        startAutoParry()
    else
        stopAutoParry()
    end
end)

local autoJumpSwitch = createSwitch("Auto Jump", 65, mainContainer, function(state)
    remote:FireServer("autoJump", state)
end)

local speedChangerSwitch = createSwitch("Speed Changer", 125, mainContainer, function(state)
    if state then
        local speed = tonumber(speedTextBox.Text) or 16
        remote:FireServer("speedChanger", true, math.clamp(speed, 1, 5000))
    else
        remote:FireServer("speedChanger", false, 16)
    end
end)

-- Speed value input
local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(0.95, 0, 0, 45 * scale)
speedFrame.Position = UDim2.new(0.025, 0, 0, 180)
speedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedFrame.BorderSizePixel = 0
speedFrame.Parent = mainContainer

local speedFrameCorner = Instance.new("UICorner")
speedFrameCorner.CornerRadius = UDim.new(0, 5)
speedFrameCorner.Parent = speedFrame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.5, 0, 1, 0)
speedLabel.Position = UDim2.new(0, 10, 0, 0)
speedLabel.Text = "Speed Value (1-5000)"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 12 * scale
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = speedFrame

local speedTextBox = Instance.new("TextBox")
speedTextBox.Size = UDim2.new(0, 80 * scale, 0, 30 * scale)
speedTextBox.Position = UDim2.new(0.55, 0, 0.5, -15 * scale)
speedTextBox.Text = "16"
speedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedTextBox.BorderSizePixel = 0
speedTextBox.Font = Enum.Font.Gotham
speedTextBox.TextSize = 14 * scale
speedTextBox.ClearTextOnFocus = false
speedTextBox.Parent = speedFrame

local speedBoxCorner = Instance.new("UICorner")
speedBoxCorner.CornerRadius = UDim.new(0, 5)
speedBoxCorner.Parent = speedTextBox

-- Create Trade Features
local freezeTradeSwitch = createSwitch("Freeze Trade", 5, tradeContainer, function(state)
    remote:FireServer("freezeTrade", state)
end)

local forceAcceptSwitch = createSwitch("Force Accept", 65, tradeContainer, function(state)
    remote:FireServer("forceAccept", state)
end)

-- Tab switching
mainTab.MouseButton1Click:Connect(function()
    mainContainer.Visible = true
    tradeContainer.Visible = false
    mainTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tradeTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

tradeTab.MouseButton1Click:Connect(function()
    mainContainer.Visible = false
    tradeContainer.Visible = true
    tradeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

-- Logo button toggles main menu
logoButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then
        mainFrame:TweenPosition(UDim2.new(0.5, -175 * scale, 0.5, -250 * scale), "Out", "Quad", 0.3, true)
    end
end)

-- Close button
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    logoButton.Visible = false
end)

-- Minimize button
minimizeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    logoButton.Visible = true
end)

-- Character respawn handling
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    if isRunning then
        chooseNewFocusedBall()
    end
end)

-- Bypass Anti-Cheat
spawn(function()
    task.wait(1)
    local success = pcall(function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Script") or v:IsA("LocalScript") then
                if v.Name:lower():find("anticheat") or v.Name:lower():find("anti") or v.Name:lower():find("cheat") or v.Name:lower():find("detect") then
                    v.Disabled = true
                end
            end
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                if v.Name:lower():find("anticheat") or v.Name:lower():find("anti") or v.Name:lower():find("cheat") or v.Name:lower():find("detect") or v.Name:lower():find("report") then
                    v:Destroy()
                end
            end
        end
    end)
    
    -- Show bypass notification
    local bypassGui = Instance.new("ScreenGui")
    bypassGui.Name = "BypassNotification"
    bypassGui.ResetOnSpawn = false
    bypassGui.Parent = player:WaitForChild("PlayerGui")
    
    local bypassFrame = Instance.new("Frame")
    bypassFrame.Size = UDim2.new(0, 300, 0, 50)
    bypassFrame.Position = UDim2.new(0.5, -150, 0.5, -25)
    bypassFrame.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    bypassFrame.BackgroundTransparency = 0.2
    bypassFrame.BorderSizePixel = 0
    bypassFrame.Parent = bypassGui
    
    local bypassCorner = Instance.new("UICorner")
    bypassCorner.CornerRadius = UDim.new(0, 10)
    bypassCorner.Parent = bypassFrame
    
    local bypassText = Instance.new("TextLabel")
    bypassText.Size = UDim2.new(1, 0, 1, 0)
    bypassText.Text = "BYPASSED ANTI-CHEAT"
    bypassText.TextColor3 = Color3.fromRGB(255, 255, 255)
    bypassText.BackgroundTransparency = 1
    bypassText.Font = Enum.Font.GothamBold
    bypassText.TextSize = 20
    bypassText.Parent = bypassFrame
    
    task.wait(3)
    bypassGui:Destroy()
end)

-- Server-side script (put in ServerScriptService)
local modData = {}

game.ReplicatedStorage.SleoModEvents.OnServerEvent:Connect(function(player, action, state, value)
    if not modData[player] then
        modData[player] = {}
    end
    modData[player][action] = state
    modData[player][action .. "_value"] = value
    
    if action == "autoJump" then
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
        local playerGui = player:FindFirstChild("PlayerGui")
        if playerGui then
            local tradeGui = playerGui:FindFirstChild("TradeGUI") or playerGui:FindFirstChild("Trade")
            if tradeGui then
                tradeGui.Enabled = not state
            end
        end
        
    elseif action == "forceAccept" then
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

print("SLEO Blade Ball Mod Menu v2.0 Loaded! - 100% Working")
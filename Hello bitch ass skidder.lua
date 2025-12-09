local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local DISCORD_ICON_ASSET_ID = "h"
local BACKGROUND_ASSET_ID = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=90495290872623"
local discordLink = "Sex.com"
local EXIT_DELAY_SECONDS = 5

local function trySetClipboard(text)
    if typeof(setclipboard) == "function" then
        local ok, _ = pcall(function() setclipboard(text) end)
        return ok
    end
    return false
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CyberNeonUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
screenGui.DisplayOrder = 100

local mainFrame = Instance.new("Frame")
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.35, 0)
mainFrame.Size = UDim2.new(0.42, 0, 0.32, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(10,10,12)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0,14)
mainCorner.Parent = mainFrame

local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1,0,1,0)
shadow.Position = UDim2.new(0,0,0,0)
shadow.BackgroundColor3 = Color3.fromRGB(255,0,0)
shadow.BackgroundTransparency = 0.9
shadow.BorderSizePixel = 0
shadow.Parent = mainFrame

local shadowStroke = Instance.new("UIStroke")
shadowStroke.Color = Color3.fromRGB(0, 255, 255)
shadowStroke.Thickness = 4
shadowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
shadowStroke.LineJoinMode = Enum.LineJoinMode.Round
shadowStroke.Parent = mainFrame

local bg = Instance.new("ImageLabel")
bg.Size = UDim2.new(1,0,1,0)
bg.Position = UDim2.new(0,0,0,0)
bg.BackgroundTransparency = 1
bg.Image = BACKGROUND_ASSET_ID
bg.ScaleType = Enum.ScaleType.Crop
bg.Parent = mainFrame

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1,-6,1,-6)
overlay.Position = UDim2.new(0,3,0,3)
overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
overlay.BackgroundTransparency = 0.2
overlay.BorderSizePixel = 0
overlay.Parent = mainFrame

local overlayCorner = Instance.new("UICorner")
overlayCorner.CornerRadius = UDim.new(0,12)
overlayCorner.Parent = overlay

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.5,0)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "THANKS FOR BUYING SLH PAID BITCH"
title.TextColor3 = Color3.fromRGB(255,0,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.TextStrokeTransparency = 0.5
title.TextWrapped = true
title.Parent = overlay

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -20,0.15,0)
subtitle.Position = UDim2.new(0,10,0.5,0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Modern Cyber Neon Ad"
subtitle.TextColor3 = Color3.fromRGB(255,255,255)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = overlay

local buttonsFrame = Instance.new("Frame")
buttonsFrame.Size = UDim2.new(1,-20,0.3,0)
buttonsFrame.Position = UDim2.new(0,10,0.7,0)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Parent = overlay

local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0.48,0,1,0)
copyBtn.Position = UDim2.new(0,0,0,0)
copyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
copyBtn.TextColor3 = Color3.fromRGB(255,255,255)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 14
copyBtn.Text = "Copy Discord Link"
copyBtn.BorderSizePixel = 0
copyBtn.Parent = buttonsFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0,6)
copyCorner.Parent = copyBtn

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0,18,0,18)
icon.Position = UDim2.new(0,8,0.5,-9)
icon.BackgroundTransparency = 1
icon.Image = DISCORD_ICON_ASSET_ID
icon.Parent = copyBtn

local exitBtn = Instance.new("TextButton")
exitBtn.Size = UDim2.new(0.48,0,1,0)
exitBtn.Position = UDim2.new(0.52,0,0,0)
exitBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
exitBtn.TextColor3 = Color3.fromRGB(255,255,255)
exitBtn.Font = Enum.Font.GothamBold
exitBtn.TextSize = 14
exitBtn.Text = "Exit"
exitBtn.BorderSizePixel = 0
exitBtn.Visible = false
exitBtn.Parent = buttonsFrame

local exitCorner = Instance.new("UICorner")
exitCorner.CornerRadius = UDim.new(0,6)
exitCorner.Parent = exitBtn

local waitBtn = Instance.new("TextButton")
waitBtn.Size = exitBtn.Size
waitBtn.Position = exitBtn.Position
waitBtn.BackgroundColor3 = exitBtn.BackgroundColor3
waitBtn.TextColor3 = exitBtn.TextColor3
waitBtn.Font = exitBtn.Font
waitBtn.TextSize = exitBtn.TextSize
waitBtn.Text = ("Exit in %ds"):format(EXIT_DELAY_SECONDS)
waitBtn.BorderSizePixel = 0
waitBtn.Parent = buttonsFrame

local waitCorner = Instance.new("UICorner")
waitCorner.CornerRadius = UDim.new(0,6)
waitCorner.Parent = waitBtn

local fallbackBox = Instance.new("TextBox")
fallbackBox.Size = UDim2.new(1,0,0.18,0)
fallbackBox.Position = UDim2.new(0,0,1.02,0)
fallbackBox.Visible = false
fallbackBox.ClearTextOnFocus = false
fallbackBox.Text = ""
fallbackBox.Font = Enum.Font.Gotham
fallbackBox.TextSize = 14
fallbackBox.TextColor3 = Color3.fromRGB(15,23,42)
fallbackBox.BackgroundColor3 = Color3.fromRGB(248,250,252)
fallbackBox.BorderSizePixel = 0
fallbackBox.Parent = overlay

local fbCorner = Instance.new("UICorner")
fbCorner.CornerRadius = UDim.new(0,6)
fbCorner.Parent = fallbackBox

local dragging = false
local dragStart = nil
local startPos = nil

local function updatePosition(input)
	local delta = input.Position - dragStart
	local newPos = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
	mainFrame.Position = newPos
end

overlay.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		updatePosition(input)
	end
end)

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.Escape then
		screenGui.Enabled = not screenGui.Enabled
	end
end)

copyBtn.MouseButton1Click:Connect(function()
	if trySetClipboard(discordLink) then
		local orig = copyBtn.Text
		copyBtn.Text = "Copied!"
		task.delay(0.8,function()
			if copyBtn and copyBtn.Parent then copyBtn.Text = orig end
		end)
	else
		fallbackBox.Text = discordLink
		fallbackBox.Visible = true
		pcall(function() fallbackBox:CaptureFocus() end)
	end
end)

exitBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

task.spawn(function()
	for i = EXIT_DELAY_SECONDS,1,-1 do
		waitBtn.Text = ("Exit in %ds"):format(i)
		task.wait(1)
	end
	waitBtn.Visible = false
	exitBtn.Visible = true
end)

 

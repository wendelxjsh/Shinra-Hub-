local S1_ = game:GetService("UserInputService")
local S2_ = game:GetService("TweenService")
local S3_ = game:GetService("Players").LocalPlayer
local S4_ = game:GetService("RunService")
local S5_ = game:GetService("VirtualUser")

S3_.Idled:Connect(function()
	S5_:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	task.wait(1)
	S5_:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local function S6_func()
	local S10_ = Instance.new("UIStroke")
	local S11_ = Instance.new("UICorner")

	local S12_ = Instance.new("ScreenGui")
	local S13_ = Instance.new("ImageButton")

	S12_.Name = "OpenClose"
	S12_.Parent = S4_:IsStudio() and S3_.PlayerGui or (gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui"))
	S12_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	S13_.Parent = S12_
	S13_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S13_.BorderColor3 = Color3.fromRGB(255, 0, 0)
	S13_.Position = UDim2.new(0.1021, 0, 0.0743, 0)
	S13_.Size = UDim2.new(0, 59, 0, 49)
	S13_.Image = "rbxassetid://133387390821775"
	S13_.Visible = true

	S11_.Name = "MainCorner"
	S11_.CornerRadius = UDim.new(0, 9)
	S11_.Parent = S13_

	local S14_ = false
	local S15_ = nil
	local S16_ = nil

	local function S17_func(S18_arg0)
		local S19_ = S18_arg0.Position - S15_
		S13_.Position = UDim2.new(S16_.X.Scale, S16_.X.Offset + S19_.X, S16_.Y.Scale, S16_.Y.Offset + S19_.Y)
	end

	S13_.InputBegan:Connect(function(S20_arg0)
		if S20_arg0.UserInputType == Enum.UserInputType.Touch or S20_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
			S14_ = true
			S15_ = S20_arg0.Position
			S16_ = S13_.Position

			S20_arg0.Changed:Connect(function()
				if S20_arg0.UserInputState == Enum.UserInputState.End then
					S14_ = false
				end
			end)
		end
	end)

	S13_.InputChanged:Connect(function(S21_arg0)
		if S14_ and (S21_arg0.UserInputType == Enum.UserInputType.MouseMovement or S21_arg0.UserInputType == Enum.UserInputType.Touch) then
			S17_func(S21_arg0)
		end
	end)

	return S13_
end

local S7_ = S6_func()

local function S8_func(S22_arg0, S23_arg1)

	local function S24_func(S26_arg0, S27_arg1)
		local S28_ = nil
		local S29_ = nil
		local S30_ = nil
		local S31_ = nil

		local function S32_func(S33_arg0)
			local S34_ = S33_arg0.Position - S30_
			local S35_ = UDim2.new(S31_.X.Scale, S31_.X.Offset + S34_.X, S31_.Y.Scale, S31_.Y.Offset + S34_.Y)
			S27_arg1.Position = S35_
		end

		S26_arg0.InputBegan:Connect(function(S36_arg0)
			if S36_arg0.UserInputType == Enum.UserInputType.MouseButton1 or S36_arg0.UserInputType == Enum.UserInputType.Touch then
				S28_ = true
				S30_ = S36_arg0.Position
				S31_ = S27_arg1.Position

				S36_arg0.Changed:Connect(function()
					if S36_arg0.UserInputState == Enum.UserInputState.End then
						S28_ = false
					end
				end)
			end
		end)

		S26_arg0.InputChanged:Connect(function(S37_arg0)
			if S37_arg0.UserInputType == Enum.UserInputType.MouseMovement or S37_arg0.UserInputType == Enum.UserInputType.Touch then
				S29_ = S37_arg0
			end
		end)

		S1_.InputChanged:Connect(function(S38_arg0)
			if S38_arg0 == S29_ and S28_ then
				S32_func(S38_arg0)
			end
		end)
	end
	
	local function S25_func(S39_arg0)
		local S40_ = false
		local S41_ = nil
		local S42_ = nil
		local S43_ = nil
		local S44_ = S39_arg0.Size.X.Offset
		if S44_ < 399 then
			S44_ = 399
		end
		local S45_ = S44_ - 100
		S39_arg0.Size = UDim2.new(0, S44_, 0, S45_)
		local S46_ = Instance.new("Frame")
	
		S46_.AnchorPoint = Vector2.new(1, 1)
		S46_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S46_.BackgroundTransparency = 0.999
		S46_.BorderSizePixel = 0
		S46_.Position = UDim2.new(1, 20, 1, 20)
		S46_.Size = UDim2.new(0, 40, 0, 40)
		S46_.Name = "changesizeobject"
		S46_.Parent = S39_arg0
	
		local function S47_func(S48_arg0)
			local S49_ = S48_arg0.Position - S42_
			local S50_ = S43_.X.Offset + S49_.X
			local S51_ = S43_.Y.Offset + S49_.Y
			S50_ = math.max(S50_, S44_)
			S51_ = math.max(S51_, S45_)
			local S52_ = S2_:Create(S39_arg0, TweenInfo.new(0.2), {
				Size = UDim2.new(0, S50_, 0, S51_)
			})
			S52_:Play()
		end
	
		S46_.InputBegan:Connect(function(S53_arg0)
			if S53_arg0.UserInputType == Enum.UserInputType.MouseButton1 or S53_arg0.UserInputType == Enum.UserInputType.Touch then
				S40_ = true
				S42_ = S53_arg0.Position
				S43_ = S39_arg0.Size
				S53_arg0.Changed:Connect(function()
					if S53_arg0.UserInputState == Enum.UserInputState.End then
						S40_ = false
					end
				end)
			end
		end)
	
		S46_.InputChanged:Connect(function(S54_arg0)
			if S54_arg0.UserInputType == Enum.UserInputType.MouseMovement or S54_arg0.UserInputType == Enum.UserInputType.Touch then
				S41_ = S54_arg0
			end
		end)
	
		S1_.InputChanged:Connect(function(S55_arg0)
			if S55_arg0 == S41_ and S40_ then
				S47_func(S55_arg0)
			end
		end)
	end	
	S25_func(S23_arg1)
	S24_func(S22_arg0, S23_arg1)
end

function CircleClick(S56_arg0, S57_arg1, S58_arg2)
	spawn(function()
		S56_arg0.ClipsDescendants = true
		local S59_ = Instance.new("ImageLabel")
		S59_.Image = "rbxassetid://266543268"
		S59_.ImageColor3 = Color3.fromRGB(80, 80, 80)
		S59_.ImageTransparency = 0.8999999761581421
		S59_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S59_.BackgroundTransparency = 1
		S59_.ZIndex = 10
		S59_.Name = "Circle"
		S59_.Parent = S56_arg0
		
		local S60_ = S57_arg1 - S59_.AbsolutePosition.X
		local S61_ = S58_arg2 - S59_.AbsolutePosition.Y
		S59_.Position = UDim2.new(0, S60_, 0, S61_)
		local S62_ = 0
		if S56_arg0.AbsoluteSize.X > S56_arg0.AbsoluteSize.Y then
			S62_ = S56_arg0.AbsoluteSize.X * 1.5
		elseif S56_arg0.AbsoluteSize.X < S56_arg0.AbsoluteSize.Y then
			S62_ = S56_arg0.AbsoluteSize.Y * 1.5
		elseif S56_arg0.AbsoluteSize.X == S56_arg0.AbsoluteSize.Y then
			S62_ = S56_arg0.AbsoluteSize.X * 1.5
		end

		local S63_ = 0.5
		S59_:TweenSizeAndPosition(UDim2.new(0, S62_, 0, S62_), UDim2.new(0.5, - S62_ / 2, 0.5, - S62_ / 2), "Out", "Quad", S63_, false, nil)
		for S64_forvar0 = 1, 10 do
			S59_.ImageTransparency = S59_.ImageTransparency + 0.01
			wait(S63_ / 10)
		end
		S59_:Destroy()
	end)
end

-- Sistema de Keybind
local currentKeybind = Enum.KeyCode.RightControl
local keybindConnection = nil

local function setupKeybind()
    if keybindConnection then
        keybindConnection:Disconnect()
    end
    
    keybindConnection = S1_.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == currentKeybind then
            if S94_ and S95_ then
                S95_.Visible = not S95_.Visible
            end
        end
    end)
end

setupKeybind()

-- Sistema de Temas Aprimorado
local currentTheme = "Dark"
local themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 15),
        Secondary = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 200),
        Accent = Color3.fromRGB(255, 0, 255),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 200))
        }
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(220, 220, 220),
        Text = Color3.fromRGB(0, 0, 0),
        TextSecondary = Color3.fromRGB(80, 80, 80),
        Accent = Color3.fromRGB(0, 100, 255),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
        }
    },
    Blue = {
        Background = Color3.fromRGB(10, 20, 40),
        Secondary = Color3.fromRGB(20, 40, 80),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 200, 255),
        Accent = Color3.fromRGB(0, 150, 255),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 200))
        }
    },
    Green = {
        Background = Color3.fromRGB(10, 40, 20),
        Secondary = Color3.fromRGB(20, 80, 40),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 255, 200),
        Accent = Color3.fromRGB(0, 255, 100),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 80))
        }
    },
    Purple = {
        Background = Color3.fromRGB(30, 10, 40),
        Secondary = Color3.fromRGB(50, 20, 80),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(220, 180, 255),
        Accent = Color3.fromRGB(160, 0, 255),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 200))
        }
    },
    Pink = {
        Background = Color3.fromRGB(40, 10, 30),
        Secondary = Color3.fromRGB(80, 20, 60),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(255, 180, 230),
        Accent = Color3.fromRGB(255, 0, 150),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 150)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 120))
        }
    },
    Black = {
        Background = Color3.fromRGB(0, 0, 0),
        Secondary = Color3.fromRGB(20, 20, 20),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(150, 150, 150),
        Accent = Color3.fromRGB(255, 255, 255),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
        }
    },
    White = {
        Background = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(240, 240, 240),
        Text = Color3.fromRGB(0, 0, 0),
        TextSecondary = Color3.fromRGB(80, 80, 80),
        Accent = Color3.fromRGB(0, 0, 0),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
        }
    },
    Red = {
        Background = Color3.fromRGB(40, 10, 10),
        Secondary = Color3.fromRGB(80, 20, 20),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(255, 180, 180),
        Accent = Color3.fromRGB(255, 0, 0),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 0))
        }
    },
    Gray = {
        Background = Color3.fromRGB(50, 50, 50),
        Secondary = Color3.fromRGB(80, 80, 80),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 200),
        Accent = Color3.fromRGB(150, 150, 150),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 120, 120))
        }
    },
    Brown = {
        Background = Color3.fromRGB(40, 25, 15),
        Secondary = Color3.fromRGB(80, 50, 30),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(220, 200, 180),
        Accent = Color3.fromRGB(160, 100, 60),
        Gradient = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 100, 60)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 80, 40))
        }
    }
}

local S9_ = {}
S9_.Unloaded = false

function S9_:MakeNotify(S65_arg0)
	local S66_ = S65_arg0 or {}
	S66_.Title = S66_.Title or "SpeedHubX"
	S66_.Description = S66_.Description or "Notification"
	S66_.Content = S66_.Content or "Content"
	S66_.Color = S66_.Color or Color3.fromRGB(255, 0, 255)
	S66_.Time = S66_.Time or 0.5
	S66_.Delay = S66_.Delay or 5
	
	local themeData = themes[currentTheme] or themes["Dark"]
	
	local S67_ = {}
	spawn(function()
		if not game:GetService("CoreGui"):FindFirstChild("NotifyGui") then
			local S84_ = Instance.new("ScreenGui");
			S84_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			S84_.Name = "NotifyGui"
			S84_.Parent = game:GetService("CoreGui")
		end
		if not game:GetService("CoreGui").NotifyGui:FindFirstChild("NotifyLayout") then
			local S85_ = Instance.new("Frame");
			S85_.AnchorPoint = Vector2.new(1, 1)
			S85_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			S85_.BackgroundTransparency = 0.9990000128746033
			S85_.BorderColor3 = Color3.fromRGB(0, 0, 0)
			S85_.BorderSizePixel = 0
			S85_.Position = UDim2.new(1, -30, 1, -30)
			S85_.Size = UDim2.new(0, 320, 1, 0)
			S85_.Name = "NotifyLayout"
			S85_.Parent = game:GetService("CoreGui").NotifyGui
			local S86_ = 0
			game:GetService("CoreGui").NotifyGui.NotifyLayout.ChildRemoved:Connect(function()
				S86_ = 0
				for S87_forvar0, S88_forvar1 in game:GetService("CoreGui").NotifyGui.NotifyLayout:GetChildren() do
					S2_:Create(
						S88_forvar1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						Position = UDim2.new(0, 0, 1, - ((S88_forvar1.Size.Y.Offset + 12) * S86_))
					}):Play()
					S86_ = S86_ + 1
				end
			end)
		end
		local S68_ = 0
		for S89_forvar0, S90_forvar1 in game:GetService("CoreGui").NotifyGui.NotifyLayout:GetChildren() do
			S68_ = - (S90_forvar1.Position.Y.Offset) + S90_forvar1.Size.Y.Offset + 12
		end
		local S69_ = Instance.new("Frame");
		local S70_ = Instance.new("Frame");
		local S71_ = Instance.new("UICorner");
		local S72_ = Instance.new("Frame");
		local S73_ = Instance.new("ImageLabel");
		local S74_ = Instance.new("Frame");
		local S75_ = Instance.new("TextLabel");
		local S77_ = Instance.new("UICorner");
		local S78_ = Instance.new("TextLabel");
		local S80_ = Instance.new("TextButton");
		local S81_ = Instance.new("ImageLabel");
		local S82_ = Instance.new("TextLabel");
		local gradient = Instance.new("UIGradient")

		S69_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		S69_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S69_.BorderSizePixel = 0
		S69_.Size = UDim2.new(1, 0, 0, 150)
		S69_.Name = "NotifyFrame"
		S69_.BackgroundTransparency = 1
		S69_.Parent = game:GetService("CoreGui").NotifyGui.NotifyLayout
		S69_.AnchorPoint = Vector2.new(0, 1)
		S69_.Position = UDim2.new(0, 0, 1, - (S68_))

		S70_.BackgroundColor3 = themeData.Secondary
		S70_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S70_.BorderSizePixel = 0
		S70_.Position = UDim2.new(0, 400, 0, 0)
		S70_.Size = UDim2.new(1, 0, 1, 0)
		S70_.Name = "NotifyFrameReal"
		S70_.Parent = S69_

		S71_.Parent = S70_
		S71_.CornerRadius = UDim.new(0, 8)

		S72_.BackgroundTransparency = 1
		S72_.BorderSizePixel = 0
		S72_.Size = UDim2.new(1, 0, 1, 0)
		S72_.ZIndex = 0
		S72_.Name = "DropShadowHolder"
		S72_.Parent = S70_

		S73_.Image = "rbxassetid://6015897843"
		S73_.ImageColor3 = Color3.fromRGB(0, 0, 0)
		S73_.ImageTransparency = 0.5
		S73_.ScaleType = Enum.ScaleType.Slice
		S73_.SliceCenter = Rect.new(49, 49, 450, 450)
		S73_.AnchorPoint = Vector2.new(0.5, 0.5)
		S73_.BackgroundTransparency = 1
		S73_.BorderSizePixel = 0
		S73_.Position = UDim2.new(0.5, 0, 0.5, 0)
		S73_.Size = UDim2.new(1, 47, 1, 47)
		S73_.ZIndex = 0
		S73_.Name = "DropShadow"
		S73_.Parent = S72_

		S74_.BackgroundColor3 = themeData.Accent
		S74_.BackgroundTransparency = 0.3
		S74_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S74_.BorderSizePixel = 0
		S74_.Size = UDim2.new(1, 0, 0, 36)
		S74_.Name = "Top"
		S74_.Parent = S70_

		gradient.Color = themeData.Gradient
		gradient.Rotation = 45
		gradient.Parent = S74_

		S75_.Font = Enum.Font.GothamBold
		S75_.Text = S66_.Title
		S75_.TextColor3 = themeData.Text
		S75_.TextSize = 14
		S75_.TextXAlignment = Enum.TextXAlignment.Left
		S75_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S75_.BackgroundTransparency = 0.9990000128746033
		S75_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S75_.BorderSizePixel = 0
		S75_.Size = UDim2.new(1, 0, 1, 0)
		S75_.Parent = S74_
		S75_.Position = UDim2.new(0, 10, 0, 0)

		S77_.Parent = S74_
		S77_.CornerRadius = UDim.new(0, 5)

		S78_.Font = Enum.Font.GothamBold
		S78_.Text = S66_.Description
		S78_.TextColor3 = S66_.Color
		S78_.TextSize = 14
		S78_.TextXAlignment = Enum.TextXAlignment.Left
		S78_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S78_.BackgroundTransparency = 0.9990000128746033
		S78_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S78_.BorderSizePixel = 0
		S78_.Size = UDim2.new(1, 0, 1, 0)
		S78_.Position = UDim2.new(0, S75_.TextBounds.X + 15, 0, 0)
		S78_.Parent = S74_

		S80_.Font = Enum.Font.SourceSans
		S80_.Text = ""
		S80_.TextColor3 = Color3.fromRGB(0, 0, 0)
		S80_.TextSize = 14
		S80_.AnchorPoint = Vector2.new(1, 0.5)
		S80_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S80_.BackgroundTransparency = 0.9990000128746033
		S80_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S80_.BorderSizePixel = 0
		S80_.Position = UDim2.new(1, -5, 0.5, 0)
		S80_.Size = UDim2.new(0, 25, 0, 25)
		S80_.Name = "Close"
		S80_.Parent = S74_

		S81_.Image = "rbxassetid://9886659671"
		S81_.AnchorPoint = Vector2.new(0.5, 0.5)
		S81_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S81_.BackgroundTransparency = 0.9990000128746033
		S81_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S81_.BorderSizePixel = 0
		S81_.Position = UDim2.new(0.49000001, 0, 0.5, 0)
		S81_.Size = UDim2.new(1, -8, 1, -8)
		S81_.Parent = S80_

		S82_.Font = Enum.Font.GothamBold
		S82_.TextColor3 = themeData.TextSecondary
		S82_.TextSize = 13
		S82_.Text = S66_.Content
		S82_.TextXAlignment = Enum.TextXAlignment.Left
		S82_.TextYAlignment = Enum.TextYAlignment.Top
		S82_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S82_.BackgroundTransparency = 0.9990000128746033
		S82_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S82_.BorderSizePixel = 0
		S82_.Position = UDim2.new(0, 10, 0, 27)
		S82_.Parent = S70_
		S82_.Size = UDim2.new(1, -20, 0, 13)

		S82_.Size = UDim2.new(1, -20, 0, 13 + (13 * (S82_.TextBounds.X // S82_.AbsoluteSize.X)))
		S82_.TextWrapped = true

		if S82_.AbsoluteSize.Y < 27 then
			S69_.Size = UDim2.new(1, 0, 0, 65)
		else
			S69_.Size = UDim2.new(1, 0, 0, S82_.AbsoluteSize.Y + 40)
		end
		local S83_ = false
		function S67_:Close()
			if S83_ then
				return false
			end
			S83_ = true
			S2_:Create(
				S70_, TweenInfo.new(tonumber(S66_.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0, 400, 0, 0)
			}):Play()
			task.wait(tonumber(S66_.Time) / 1.2)
			S69_:Destroy()
		end
		S80_.Activated:Connect(function()
			S67_:Close()
		end)
		S2_:Create(
			S70_, TweenInfo.new(tonumber(S66_.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
			Position = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(tonumber(S66_.Delay))
		S67_:Close()
	end)
	return S67_
end

function S9_:MakeGui(S91_arg0)
	local S92_ = S91_arg0 or {}

	S92_.NameHub = S92_.NameHub or ""
	S92_.Description = S92_.Description or ""
	S92_.Color = S92_.Color or Color3.fromRGB(255, 0, 255)
	S92_["Tab Width"] = S92_["Tab Width"] or 120
	S92_["Size UI"] = S92_["Size UI"] or UDim2.fromOffset(550, 315)
	
	local S93_ = {}

	local S94_ = Instance.new("ScreenGui");
	local S95_ = Instance.new("Frame");
	local S96_ = Instance.new("ImageLabel");
	local S97_ = Instance.new("Frame");
	local S98_ = Instance.new("UICorner");
	local S99_ = Instance.new("UIStroke");
	local S100_ = Instance.new("Frame");
	local S101_ = Instance.new("TextLabel");
	local S102_ = Instance.new("UICorner");
	local S103_ = Instance.new("TextLabel");
	local S105_ = Instance.new("TextButton");
	local S106_ = Instance.new("ImageLabel");
	local S107_ = Instance.new("TextButton");
	local S108_ = Instance.new("ImageLabel");
	local S109_ = Instance.new("TextButton");
	local S110_ = Instance.new("ImageLabel");
	local S111_ = Instance.new("Frame");
	local S112_ = Instance.new("UICorner");
	local S113_ = Instance.new("Frame");
	local S114_ = Instance.new("UIStroke");
	local S115_ = Instance.new("Frame");
	local S116_ = Instance.new("UICorner");
	local S117_ = Instance.new("TextLabel");
	local S118_ = Instance.new("Frame");
	local S119_ = Instance.new("Folder");
	local S120_ = Instance.new("UIPageLayout");

	S94_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	S94_.Name = "SpeedHubXGui"
	S94_.Parent = S4_:IsStudio() and S3_.PlayerGui or (gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui"))

	S95_.BackgroundTransparency = 1
	S95_.BorderSizePixel = 0
	S95_.Size = UDim2.new(0, 455, 0, 350)
	S95_.ZIndex = 0
	S95_.Name = "DropShadowHolder"
	S95_.Parent = S94_
	
	S95_.Position = UDim2.new(0, (S94_.AbsoluteSize.X // 2 - S95_.Size.X.Offset // 2), 0, (S94_.AbsoluteSize.Y // 2 - S95_.Size.Y.Offset // 2))
	S96_.Image = "rbxassetid://6015897843"
	S96_.ImageColor3 = Color3.fromRGB(15, 15, 15)
	S96_.ImageTransparency = 0.5
	S96_.ScaleType = Enum.ScaleType.Slice
	S96_.SliceCenter = Rect.new(49, 49, 450, 450)
	S96_.AnchorPoint = Vector2.new(0.5, 0.5)
	S96_.BackgroundTransparency = 1
	S96_.BorderSizePixel = 0
	S96_.Position = UDim2.new(0.5, 0, 0.5, 0)
	S96_.Size = S92_["Size UI"]
	S96_.ZIndex = 0
	S96_.Name = "DropShadow"
	S96_.Parent = S95_

	S97_.AnchorPoint = Vector2.new(0.5, 0.5)
	S97_.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	S97_.BackgroundTransparency = 0.1
	S97_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S97_.BorderSizePixel = 0
	S97_.Position = UDim2.new(0.5, 0, 0.5, 0)
	S97_.Size = S92_["Size UI"]
	S97_.Name = "Main"
	S97_.Parent = S96_

	S98_.Parent = S97_

	S99_.Color = Color3.fromRGB(50, 50, 50)
	S99_.Thickness = 1.600000023841858
	S99_.Parent = S97_

	S100_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S100_.BackgroundTransparency = 0.9990000128746033
	S100_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S100_.BorderSizePixel = 0
	S100_.Size = UDim2.new(1, 0, 0, 38)
	S100_.Name = "Top"
	S100_.Parent = S97_

	S101_.Font = Enum.Font.GothamBold
	S101_.Text = S92_.NameHub
	S101_.TextColor3 = Color3.fromRGB(255, 255, 255)
	S101_.TextSize = 14
	S101_.TextXAlignment = Enum.TextXAlignment.Left
	S101_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S101_.BackgroundTransparency = 0.9990000128746033
	S101_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S101_.BorderSizePixel = 0
	S101_.Size = UDim2.new(1, -100, 1, 0)
	S101_.Position = UDim2.new(0, 10, 0, 0)
	S101_.Parent = S100_

	S102_.Parent = S100_

	S103_.Font = Enum.Font.GothamBold
	S103_.Text = S92_.Description
	S103_.TextColor3 = S92_.Color
	S103_.TextSize = 14
	S103_.TextXAlignment = Enum.TextXAlignment.Left
	S103_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S103_.BackgroundTransparency = 0.9990000128746033
	S103_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S103_.BorderSizePixel = 0
	S103_.Size = UDim2.new(1, 0, 1, 0)
	S103_.Position = UDim2.new(0, S101_.TextBounds.X + 15, 0, 0)
	S103_.Parent = S100_

	S105_.Font = Enum.Font.SourceSans
	S105_.Text = ""
	S105_.TextColor3 = Color3.fromRGB(0, 0, 0)
	S105_.TextSize = 14
	S105_.AnchorPoint = Vector2.new(1, 0.5)
	S105_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S105_.BackgroundTransparency = 0.9990000128746033
	S105_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S105_.BorderSizePixel = 0
	S105_.Position = UDim2.new(1, -5, 0.5, 0)
	S105_.Size = UDim2.new(0, 25, 0, 25)
	S105_.Name = "Close"
	S105_.Parent = S100_

	S106_.Image = "rbxassetid://9886659671"
	S106_.AnchorPoint = Vector2.new(0.5, 0.5)
	S106_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S106_.BackgroundTransparency = 0.9990000128746033
	S106_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S106_.BorderSizePixel = 0
	S106_.Position = UDim2.new(0.49000001, 0, 0.5, 0)
	S106_.Size = UDim2.new(1, -8, 1, -8)
	S106_.Parent = S105_

	S107_.Font = Enum.Font.SourceSans
	S107_.Text = ""
	S107_.TextColor3 = Color3.fromRGB(0, 0, 0)
	S107_.TextSize = 14
	S107_.AnchorPoint = Vector2.new(1, 0.5)
	S107_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S107_.BackgroundTransparency = 0.9990000128746033
	S107_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S107_.BorderSizePixel = 0
	S107_.Position = UDim2.new(1, -35, 0.5, 0)
	S107_.Size = UDim2.new(0, 25, 0, 25)
	S107_.Name = "Minimize"
	S107_.Parent = S100_

	S108_.Image = "rbxassetid://9886659671"
	S108_.AnchorPoint = Vector2.new(0.5, 0.5)
	S108_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S108_.BackgroundTransparency = 0.9990000128746033
	S108_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S108_.BorderSizePixel = 0
	S108_.Position = UDim2.new(0.49000001, 0, 0.5, 0)
	S108_.Size = UDim2.new(1, -8, 1, -8)
	S108_.Parent = S107_

	S109_.Font = Enum.Font.SourceSans
	S109_.Text = ""
	S109_.TextColor3 = Color3.fromRGB(0, 0, 0)
	S109_.TextSize = 14
	S109_.AnchorPoint = Vector2.new(1, 0.5)
	S109_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S109_.BackgroundTransparency = 0.9990000128746033
	S109_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S109_.BorderSizePixel = 0
	S109_.Position = UDim2.new(1, -65, 0.5, 0)
	S109_.Size = UDim2.new(0, 25, 0, 25)
	S109_.Name = "Settings"
	S109_.Parent = S100_

	S110_.Image = "rbxassetid://9886659671"
	S110_.AnchorPoint = Vector2.new(0.5, 0.5)
	S110_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S110_.BackgroundTransparency = 0.9990000128746033
	S110_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S110_.BorderSizePixel = 0
	S110_.Position = UDim2.new(0.49000001, 0, 0.5, 0)
	S110_.Size = UDim2.new(1, -8, 1, -8)
	S110_.Parent = S109_

	S111_.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	S111_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S111_.BorderSizePixel = 0
	S111_.Position = UDim2.new(0, 0, 0, 38)
	S111_.Size = UDim2.new(0, S92_["Tab Width"], 1, -38)
	S111_.Name = "TabContainer"
	S111_.Parent = S97_

	S112_.Parent = S111_

	S113_.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	S113_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S113_.BorderSizePixel = 0
	S113_.Position = UDim2.new(0, S92_["Tab Width"], 0, 38)
	S113_.Size = UDim2.new(1, -S92_["Tab Width"], 1, -38)
	S113_.Name = "TabContainer2"
	S113_.Parent = S97_

	S114_.Color = Color3.fromRGB(50, 50, 50)
	S114_.Thickness = 1.600000023841858
	S114_.Parent = S113_

	S115_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S115_.BackgroundTransparency = 0.9990000128746033
	S115_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S115_.BorderSizePixel = 0
	S115_.Size = UDim2.new(1, 0, 0, 30)
	S115_.Name = "TabContainerTop"
	S115_.Parent = S113_

	S116_.Parent = S115_

	S117_.Font = Enum.Font.GothamBold
	S117_.Text = "Tab"
	S117_.TextColor3 = Color3.fromRGB(255, 255, 255)
	S117_.TextSize = 14
	S117_.TextXAlignment = Enum.TextXAlignment.Left
	S117_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	S117_.BackgroundTransparency = 0.9990000128746033
	S117_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S117_.BorderSizePixel = 0
	S117_.Size = UDim2.new(1, -10, 1, 0)
	S117_.Position = UDim2.new(0, 10, 0, 0)
	S117_.Parent = S115_

	S118_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	S118_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S118_.BorderSizePixel = 0
	S118_.Position = UDim2.new(0, 0, 0, 30)
	S118_.Size = UDim2.new(1, 0, 1, -30)
	S118_.Name = "TabContainerBottom"
	S118_.Parent = S113_

	S119_.Name = "Tabs"
	S119_.Parent = S118_

	S120_.SortOrder = Enum.SortOrder.LayoutOrder
	S120_.EasingDirection = Enum.EasingDirection.InOut
	S120_.EasingStyle = Enum.EasingStyle.Quad
	S120_.Padding = UDim.new(0, 5)
	S120_.TweenTime = 0.4
	S120_.FillDirection = Enum.FillDirection.Vertical
	S120_.HorizontalAlignment = Enum.HorizontalAlignment.Center
	S120_.VerticalAlignment = Enum.VerticalAlignment.Top
	S120_.Name = "TabLayout"
	S120_.Parent = S111_

	local S121_ = false
	local S122_ = false

	S105_.Activated:Connect(function()
		S94_:Destroy()
		S9_.Unloaded = true
	end)

	S107_.Activated:Connect(function()
		if S122_ then
			S2_:Create(S97_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Size = S92_["Size UI"]
			}):Play()
			S122_ = false
		else
			S2_:Create(S97_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Size = UDim2.new(0, S92_["Size UI"].X.Offset, 0, 38)
			}):Play()
			S122_ = true
		end
	end)

	S109_.Activated:Connect(function()
		S9_:MakeNotify({
			Title = "Settings",
			Description = "Configurações",
			Content = "Configurações em desenvolvimento...",
			Color = Color3.fromRGB(255, 255, 255),
			Time = 0.5,
			Delay = 3
		})
	end)

	S8_func(S100_, S97_)

	local S123_ = {}
	function S123_:Tab(S124_arg0)
		local S125_ = S124_arg0 or {}
		S125_.Name = S125_.Name or "Tab"
		S125_.Icon = S125_.Icon or ""

		local S126_ = {}
		local S127_ = Instance.new("TextButton");
		local S128_ = Instance.new("UICorner");
		local S129_ = Instance.new("ImageLabel");
		local S130_ = Instance.new("Frame");
		local S131_ = Instance.new("UIPageLayout");

		S127_.Font = Enum.Font.GothamBold
		S127_.Text = ""
		S127_.TextColor3 = Color3.fromRGB(255, 255, 255)
		S127_.TextSize = 14
		S127_.AutoButtonColor = false
		S127_.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		S127_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S127_.BorderSizePixel = 0
		S127_.Size = UDim2.new(1, -10, 0, 30)
		S127_.Name = "Tab"
		S127_.Parent = S111_

		S128_.Parent = S127_

		S129_.Image = S125_.Icon
		S129_.ImageColor3 = Color3.fromRGB(255, 255, 255)
		S129_.ImageTransparency = 0.30000001192092896
		S129_.AnchorPoint = Vector2.new(0, 0.5)
		S129_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S129_.BackgroundTransparency = 0.9990000128746033
		S129_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S129_.BorderSizePixel = 0
		S129_.Position = UDim2.new(0, 10, 0.5, 0)
		S129_.Size = UDim2.new(0, 15, 0, 15)
		S129_.Parent = S127_

		S130_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S130_.BackgroundTransparency = 0.9990000128746033
		S130_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S130_.BorderSizePixel = 0
		S130_.Size = UDim2.new(1, 0, 1, 0)
		S130_.Name = "TabContainer"
		S130_.Parent = S119_

		S131_.SortOrder = Enum.SortOrder.LayoutOrder
		S131_.EasingDirection = Enum.EasingDirection.InOut
		S131_.EasingStyle = Enum.EasingStyle.Quad
		S131_.Padding = UDim.new(0, 5)
		S131_.TweenTime = 0.4
		S131_.FillDirection = Enum.FillDirection.Vertical
		S131_.HorizontalAlignment = Enum.HorizontalAlignment.Center
		S131_.Name = "TabLayout"
		S131_.Parent = S130_

		local S132_ = false
		local S133_ = Instance.new("TextLabel")
		S133_.Font = Enum.Font.GothamBold
		S133_.Text = S125_.Name
		S133_.TextColor3 = Color3.fromRGB(255, 255, 255)
		S133_.TextSize = 14
		S133_.TextTransparency = 0.30000001192092896
		S133_.TextXAlignment = Enum.TextXAlignment.Left
		S133_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S133_.BackgroundTransparency = 0.9990000128746033
		S133_.BorderColor3 = Color3.fromRGB(0, 0, 0)
		S133_.BorderSizePixel = 0
		S133_.Size = UDim2.new(1, -30, 1, 0)
		S133_.Position = UDim2.new(0, 30, 0, 0)
		S133_.Parent = S127_

		S127_.MouseButton1Click:Connect(function()
			for S134_forvar0, S135_forvar1 in S111_:GetChildren() do
				if S135_forvar1:IsA("TextButton") then
					S2_:Create(S135_forvar1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					}):Play()
					S2_:Create(S135_forvar1:FindFirstChildOfClass("TextLabel"), TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						TextTransparency = 0.3
					}):Play()
					S2_:Create(S135_forvar1:FindFirstChildOfClass("ImageLabel"), TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						ImageTransparency = 0.3
					}):Play()
				end
			end
			S2_:Create(S127_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			}):Play()
			S2_:Create(S133_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				TextTransparency = 0
			}):Play()
			S2_:Create(S129_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				ImageTransparency = 0
			}):Play()
			S117_.Text = S125_.Name
			for S136_forvar0, S137_forvar1 in S119_:GetChildren() do
				S137_forvar1.Visible = false
			end
			S130_.Visible = true
		end)

		if not S132_ then
			S132_ = true
			S2_:Create(S127_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			}):Play()
			S2_:Create(S133_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				TextTransparency = 0
			}):Play()
			S2_:Create(S129_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				ImageTransparency = 0
			}):Play()
			S117_.Text = S125_.Name
			for S138_forvar0, S139_forvar1 in S119_:GetChildren() do
				S139_forvar1.Visible = false
			end
			S130_.Visible = true
		end

		function S126_:Section(S140_arg0)
			local S141_ = S140_arg0 or {}
			S141_.Name = S141_.Name or "Section"

			local S142_ = {}
			local S143_ = Instance.new("Frame");
			local S144_ = Instance.new("UICorner");
			local S145_ = Instance.new("UIStroke");
			local S146_ = Instance.new("Frame");
			local S147_ = Instance.new("UICorner");
			local S148_ = Instance.new("TextLabel");
			local S149_ = Instance.new("Frame");
			local S150_ = Instance.new("UIPageLayout");

			S143_.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			S143_.BorderColor3 = Color3.fromRGB(0, 0, 0)
			S143_.BorderSizePixel = 0
			S143_.Size = UDim2.new(1, -10, 0, 30)
			S143_.Name = "Section"
			S143_.Parent = S130_

			S144_.Parent = S143_

			S145_.Color = Color3.fromRGB(50, 50, 50)
			S145_.Thickness = 1.600000023841858
			S145_.Parent = S143_

			S146_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			S146_.BorderColor3 = Color3.fromRGB(0, 0, 0)
			S146_.BorderSizePixel = 0
			S146_.Position = UDim2.new(0, 0, 0, 30)
			S146_.Size = UDim2.new(1, 0, 1, -30)
			S146_.Name = "SectionContainer"
			S146_.Parent = S143_

			S147_.Parent = S146_

			S148_.Font = Enum.Font.GothamBold
			S148_.Text = S141_.Name
			S148_.TextColor3 = Color3.fromRGB(255, 255, 255)
			S148_.TextSize = 14
			S148_.TextXAlignment = Enum.TextXAlignment.Left
			S148_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			S148_.BackgroundTransparency = 0.9990000128746033
			S148_.BorderColor3 = Color3.fromRGB(0, 0, 0)
			S148_.BorderSizePixel = 0
			S148_.Size = UDim2.new(1, -10, 1, 0)
			S148_.Position = UDim2.new(0, 10, 0, 0)
			S148_.Parent = S143_

			S149_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			S149_.BackgroundTransparency = 0.9990000128746033
			S149_.BorderColor3 = Color3.fromRGB(0, 0, 0)
			S149_.BorderSizePixel = 0
			S149_.Size = UDim2.new(1, 0, 1, 0)
			S149_.Name = "SectionContent"
			S149_.Parent = S146_

			S150_.SortOrder = Enum.SortOrder.LayoutOrder
			S150_.EasingDirection = Enum.EasingDirection.InOut
			S150_.EasingStyle = Enum.EasingStyle.Quad
			S150_.Padding = UDim.new(0, 5)
			S150_.TweenTime = 0.4
			S150_.FillDirection = Enum.FillDirection.Vertical
			S150_.HorizontalAlignment = Enum.HorizontalAlignment.Center
			S150_.Name = "SectionLayout"
			S150_.Parent = S149_

			function S142_:Button(S151_arg0)
				local S152_ = S151_arg0 or {}
				S152_.Name = S152_.Name or "Button"
				S152_.Callback = S152_.Callback or function() end

				local S153_ = Instance.new("TextButton");
				local S154_ = Instance.new("UICorner");
				local S155_ = Instance.new("UIStroke");

				S153_.Font = Enum.Font.GothamBold
				S153_.Text = S152_.Name
				S153_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S153_.TextSize = 14
				S153_.AutoButtonColor = false
				S153_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S153_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S153_.BorderSizePixel = 0
				S153_.Size = UDim2.new(1, -10, 0, 30)
				S153_.Parent = S149_

				S154_.Parent = S153_

				S155_.Color = Color3.fromRGB(50, 50, 50)
				S155_.Thickness = 1.600000023841858
				S155_.Parent = S153_

				S153_.MouseButton1Click:Connect(function()
					CircleClick(S153_, S1_:GetMouseLocation().X, S1_:GetMouseLocation().Y)
					S152_.Callback()
				end)

				S153_.MouseEnter:Connect(function()
					S2_:Create(S153_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()
				end)

				S153_.MouseLeave:Connect(function()
					S2_:Create(S153_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				end)
			end

			function S142_:Toggle(S156_arg0)
				local S157_ = S156_arg0 or {}
				S157_.Name = S157_.Name or "Toggle"
				S157_.Flag = S157_.Flag or ""
				S157_.Value = S157_.Value or false
				S157_.Callback = S157_.Callback or function() end

				local S158_ = S157_.Value
				local S159_ = {}

				local S160_ = Instance.new("TextButton");
				local S161_ = Instance.new("UICorner");
				local S162_ = Instance.new("UIStroke");
				local S163_ = Instance.new("Frame");
				local S164_ = Instance.new("UICorner");
				local S165_ = Instance.new("TextLabel");

				S160_.Font = Enum.Font.GothamBold
				S160_.Text = ""
				S160_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S160_.TextSize = 14
				S160_.AutoButtonColor = false
				S160_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S160_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S160_.BorderSizePixel = 0
				S160_.Size = UDim2.new(1, -10, 0, 30)
				S160_.Parent = S149_

				S161_.Parent = S160_

				S162_.Color = Color3.fromRGB(50, 50, 50)
				S162_.Thickness = 1.600000023841858
				S162_.Parent = S160_

				S163_.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
				S163_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S163_.BorderSizePixel = 0
				S163_.Position = UDim2.new(1, -25, 0.5, -7)
				S163_.Size = UDim2.new(0, 20, 0, 14)
				S163_.Name = "Toggle"
				S163_.Parent = S160_

				S164_.Parent = S163_

				S165_.Font = Enum.Font.GothamBold
				S165_.Text = S157_.Name
				S165_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S165_.TextSize = 14
				S165_.TextXAlignment = Enum.TextXAlignment.Left
				S165_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S165_.BackgroundTransparency = 0.9990000128746033
				S165_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S165_.BorderSizePixel = 0
				S165_.Size = UDim2.new(1, -30, 1, 0)
				S165_.Position = UDim2.new(0, 10, 0, 0)
				S165_.Parent = S160_

				local function S166_func()
					S158_ = not S158_
					if S158_ then
						S2_:Create(S163_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							BackgroundColor3 = Color3.fromRGB(0, 255, 0)
						}):Play()
					else
						S2_:Create(S163_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							BackgroundColor3 = Color3.fromRGB(255, 0, 255)
						}):Play()
					end
					S157_.Callback(S158_)
				end

				S160_.MouseButton1Click:Connect(function()
					CircleClick(S160_, S1_:GetMouseLocation().X, S1_:GetMouseLocation().Y)
					S166_func()
				end)

				S160_.MouseEnter:Connect(function()
					S2_:Create(S160_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()
				end)

				S160_.MouseLeave:Connect(function()
					S2_:Create(S160_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				end)

				function S159_:Set(S167_arg0)
					S158_ = S167_arg0
					if S158_ then
						S2_:Create(S163_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							BackgroundColor3 = Color3.fromRGB(0, 255, 0)
						}):Play()
					else
						S2_:Create(S163_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							BackgroundColor3 = Color3.fromRGB(255, 0, 255)
						}):Play()
					end
					S157_.Callback(S158_)
				end

				return S159_
			end

			function S142_:Slider(S168_arg0)
				local S169_ = S168_arg0 or {}
				S169_.Name = S169_.Name or "Slider"
				S169_.Value = S169_.Value or 0
				S169_.Min = S169_.Min or 0
				S169_.Max = S169_.Max or 100
				S169_.Callback = S169_.Callback or function() end

				local S170_ = S169_.Value
				local S171_ = {}

				local S172_ = Instance.new("TextButton");
				local S173_ = Instance.new("UICorner");
				local S174_ = Instance.new("UIStroke");
				local S175_ = Instance.new("Frame");
				local S176_ = Instance.new("UICorner");
				local S177_ = Instance.new("Frame");
				local S178_ = Instance.new("UICorner");
				local S179_ = Instance.new("TextLabel");

				S172_.Font = Enum.Font.GothamBold
				S172_.Text = ""
				S172_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S172_.TextSize = 14
				S172_.AutoButtonColor = false
				S172_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S172_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S172_.BorderSizePixel = 0
				S172_.Size = UDim2.new(1, -10, 0, 30)
				S172_.Parent = S149_

				S173_.Parent = S172_

				S174_.Color = Color3.fromRGB(50, 50, 50)
				S174_.Thickness = 1.600000023841858
				S174_.Parent = S172_

				S175_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				S175_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S175_.BorderSizePixel = 0
				S175_.Position = UDim2.new(0, 10, 0, 20)
				S175_.Size = UDim2.new(1, -20, 0, 5)
				S175_.Name = "Slider"
				S175_.Parent = S172_

				S176_.Parent = S175_

				S177_.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
				S177_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S177_.BorderSizePixel = 0
				S177_.Size = UDim2.new((S170_ - S169_.Min) / (S169_.Max - S169_.Min), 0, 1, 0)
				S177_.Name = "SliderFill"
				S177_.Parent = S175_

				S178_.Parent = S177_

				S179_.Font = Enum.Font.GothamBold
				S179_.Text = S169_.Name .. " | " .. S170_
				S179_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S179_.TextSize = 14
				S179_.TextXAlignment = Enum.TextXAlignment.Left
				S179_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S179_.BackgroundTransparency = 0.9990000128746033
				S179_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S179_.BorderSizePixel = 0
				S179_.Size = UDim2.new(1, -10, 1, 0)
				S179_.Position = UDim2.new(0, 10, 0, 0)
				S179_.Parent = S172_

				local S180_ = false

				local function S181_func(S182_arg0)
					local S183_ = math.clamp((S182_arg0 - S175_.AbsolutePosition.X) / S175_.AbsoluteSize.X, 0, 1)
					S170_ = math.floor(S169_.Min + (S169_.Max - S169_.Min) * S183_)
					S177_.Size = UDim2.new(S183_, 0, 1, 0)
					S179_.Text = S169_.Name .. " | " .. S170_
					S169_.Callback(S170_)
				end

				S172_.InputBegan:Connect(function(S184_arg0)
					if S184_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
						S180_ = true
						S181_func(S184_arg0.Position.X)
					end
				end)

				S172_.InputEnded:Connect(function(S185_arg0)
					if S185_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
						S180_ = false
					end
				end)

				S1_.InputChanged:Connect(function(S186_arg0)
					if S186_arg0.UserInputType == Enum.UserInputType.MouseMovement and S180_ then
						S181_func(S186_arg0.Position.X)
					end
				end)

				function S171_:Set(S187_arg0)
					S170_ = math.clamp(S187_arg0, S169_.Min, S169_.Max)
					local S188_ = (S170_ - S169_.Min) / (S169_.Max - S169_.Min)
					S177_.Size = UDim2.new(S188_, 0, 1, 0)
					S179_.Text = S169_.Name .. " | " .. S170_
					S169_.Callback(S170_)
				end

				return S171_
			end

			function S142_:Textbox(S189_arg0)
				local S190_ = S189_arg0 or {}
				S190_.Name = S190_.Name or "Textbox"
				S190_.Placeholder = S190_.Placeholder or ""
				S190_.Callback = S190_.Callback or function() end

				local S191_ = Instance.new("TextButton");
				local S192_ = Instance.new("UICorner");
				local S193_ = Instance.new("UIStroke");
				local S194_ = Instance.new("TextBox");
				local S195_ = Instance.new("TextLabel");

				S191_.Font = Enum.Font.GothamBold
				S191_.Text = ""
				S191_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S191_.TextSize = 14
				S191_.AutoButtonColor = false
				S191_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S191_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S191_.BorderSizePixel = 0
				S191_.Size = UDim2.new(1, -10, 0, 30)
				S191_.Parent = S149_

				S192_.Parent = S191_

				S193_.Color = Color3.fromRGB(50, 50, 50)
				S193_.Thickness = 1.600000023841858
				S193_.Parent = S191_

				S194_.Font = Enum.Font.GothamBold
				S194_.PlaceholderText = S190_.Placeholder
				S194_.Text = ""
				S194_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S194_.TextSize = 14
				S194_.TextXAlignment = Enum.TextXAlignment.Right
				S194_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S194_.BackgroundTransparency = 0.9990000128746033
				S194_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S194_.BorderSizePixel = 0
				S194_.Position = UDim2.new(0, 0, 0, 0)
				S194_.Size = UDim2.new(1, -10, 1, 0)
				S194_.Parent = S191_

				S195_.Font = Enum.Font.GothamBold
				S195_.Text = S190_.Name
				S195_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S195_.TextSize = 14
				S195_.TextXAlignment = Enum.TextXAlignment.Left
				S195_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S195_.BackgroundTransparency = 0.9990000128746033
				S195_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S195_.BorderSizePixel = 0
				S195_.Size = UDim2.new(1, -10, 1, 0)
				S195_.Position = UDim2.new(0, 10, 0, 0)
				S195_.Parent = S191_

				S194_.FocusLost:Connect(function(S196_arg0)
					if S196_arg0 then
						S190_.Callback(S194_.Text)
					end
				end)

				S191_.MouseEnter:Connect(function()
					S2_:Create(S191_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()
				end)

				S191_.MouseLeave:Connect(function()
					S2_:Create(S191_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				end)
			end

			function S142_:Dropdown(S197_arg0)
				local S198_ = S197_arg0 or {}
				S198_.Name = S198_.Name or "Dropdown"
				S198_.Options = S198_.Options or {}
				S198_.Callback = S198_.Callback or function() end

				local S199_ = nil
				local S200_ = false
				local S201_ = {}

				local S202_ = Instance.new("TextButton");
				local S203_ = Instance.new("UICorner");
				local S204_ = Instance.new("UIStroke");
				local S205_ = Instance.new("TextLabel");
				local S206_ = Instance.new("ImageLabel");
				local S207_ = Instance.new("Frame");
				local S208_ = Instance.new("UICorner");
				local S209_ = Instance.new("UIStroke");
				local S210_ = Instance.new("ScrollingFrame");
				local S211_ = Instance.new("UIPageLayout");

				S202_.Font = Enum.Font.GothamBold
				S202_.Text = ""
				S202_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S202_.TextSize = 14
				S202_.AutoButtonColor = false
				S202_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S202_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S202_.BorderSizePixel = 0
				S202_.Size = UDim2.new(1, -10, 0, 30)
				S202_.Parent = S149_

				S203_.Parent = S202_

				S204_.Color = Color3.fromRGB(50, 50, 50)
				S204_.Thickness = 1.600000023841858
				S204_.Parent = S202_

				S205_.Font = Enum.Font.GothamBold
				S205_.Text = S198_.Name
				S205_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S205_.TextSize = 14
				S205_.TextXAlignment = Enum.TextXAlignment.Left
				S205_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S205_.BackgroundTransparency = 0.9990000128746033
				S205_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S205_.BorderSizePixel = 0
				S205_.Size = UDim2.new(1, -30, 1, 0)
				S205_.Position = UDim2.new(0, 10, 0, 0)
				S205_.Parent = S202_

				S206_.Image = "rbxassetid://9886659671"
				S206_.ImageColor3 = Color3.fromRGB(255, 255, 255)
				S206_.ImageTransparency = 0.30000001192092896
				S206_.AnchorPoint = Vector2.new(1, 0.5)
				S206_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S206_.BackgroundTransparency = 0.9990000128746033
				S206_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S206_.BorderSizePixel = 0
				S206_.Position = UDim2.new(1, -10, 0.5, 0)
				S206_.Rotation = 0
				S206_.Size = UDim2.new(0, 15, 0, 15)
				S206_.Parent = S202_

				S207_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S207_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S207_.BorderSizePixel = 0
				S207_.Position = UDim2.new(0, 0, 1, 5)
				S207_.Size = UDim2.new(1, 0, 0, 0)
				S207_.Visible = false
				S207_.Name = "DropdownContainer"
				S207_.Parent = S202_

				S208_.Parent = S207_

				S209_.Color = Color3.fromRGB(50, 50, 50)
				S209_.Thickness = 1.600000023841858
				S209_.Parent = S207_

				S210_.CanvasSize = UDim2.new(0, 0, 0, 0)
				S210_.ScrollBarThickness = 3
				S210_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S210_.BackgroundTransparency = 0.9990000128746033
				S210_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S210_.BorderSizePixel = 0
				S210_.Size = UDim2.new(1, 0, 1, 0)
				S210_.Name = "DropdownContent"
				S210_.Parent = S207_

				S211_.SortOrder = Enum.SortOrder.LayoutOrder
				S211_.EasingDirection = Enum.EasingDirection.InOut
				S211_.EasingStyle = Enum.EasingStyle.Quad
				S211_.Padding = UDim.new(0, 5)
				S211_.TweenTime = 0.4
				S211_.FillDirection = Enum.FillDirection.Vertical
				S211_.HorizontalAlignment = Enum.HorizontalAlignment.Center
				S211_.Name = "DropdownLayout"
				S211_.Parent = S210_

				local function S212_func()
					S200_ = not S200_
					if S200_ then
						S207_.Visible = true
						S2_:Create(S207_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							Size = UDim2.new(1, 0, 0, math.min(#S198_.Options * 30 + (#S198_.Options - 1) * 5, 120))
						}):Play()
						S2_:Create(S206_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							Rotation = 180
						}):Play()
					else
						S2_:Create(S207_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							Size = UDim2.new(1, 0, 0, 0)
						}):Play()
						S2_:Create(S206_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							Rotation = 0
						}):Play()
						task.wait(0.3)
						S207_.Visible = false
					end
				end

				S202_.MouseButton1Click:Connect(function()
					CircleClick(S202_, S1_:GetMouseLocation().X, S1_:GetMouseLocation().Y)
					S212_func()
				end)

				S202_.MouseEnter:Connect(function()
					S2_:Create(S202_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()
				end)

				S202_.MouseLeave:Connect(function()
					S2_:Create(S202_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				end)

				local function S213_func(S214_arg0)
					for S215_forvar0, S216_forvar1 in S210_:GetChildren() do
						if S216_forvar1:IsA("TextButton") then
							S2_:Create(S216_forvar1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
								BackgroundColor3 = Color3.fromRGB(35, 35, 35)
							}):Play()
						end
					end
					S199_ = S214_arg0
					S205_.Text = S198_.Name .. " | " .. S214_arg0
					S198_.Callback(S214_arg0)
					S212_func()
				end

				for S217_forvar0, S218_forvar1 in S198_.Options do
					local S219_ = Instance.new("TextButton");
					local S220_ = Instance.new("UICorner");
					local S221_ = Instance.new("UIStroke");

					S219_.Font = Enum.Font.GothamBold
					S219_.Text = S218_forvar1
					S219_.TextColor3 = Color3.fromRGB(255, 255, 255)
					S219_.TextSize = 14
					S219_.AutoButtonColor = false
					S219_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					S219_.BorderColor3 = Color3.fromRGB(0, 0, 0)
					S219_.BorderSizePixel = 0
					S219_.Size = UDim2.new(1, -10, 0, 30)
					S219_.Parent = S210_

					S220_.Parent = S219_

					S221_.Color = Color3.fromRGB(50, 50, 50)
					S221_.Thickness = 1.600000023841858
					S221_.Parent = S219_

					S219_.MouseButton1Click:Connect(function()
						S213_func(S218_forvar1)
					end)

					S219_.MouseEnter:Connect(function()
						S2_:Create(S219_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							BackgroundColor3 = Color3.fromRGB(40, 40, 40)
						}):Play()
					end)

					S219_.MouseLeave:Connect(function()
						S2_:Create(S219_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							BackgroundColor3 = Color3.fromRGB(35, 35, 35)
						}):Play()
					end)
				end

				function S201_:Refresh(S222_arg0)
					S198_.Options = S222_arg0 or S198_.Options
					for S223_forvar0, S224_forvar1 in S210_:GetChildren() do
						if S224_forvar1:IsA("TextButton") then
							S224_forvar1:Destroy()
						end
					end
					for S225_forvar0, S226_forvar1 in S198_.Options do
						local S227_ = Instance.new("TextButton");
						local S228_ = Instance.new("UICorner");
						local S229_ = Instance.new("UIStroke");

						S227_.Font = Enum.Font.GothamBold
						S227_.Text = S226_forvar1
						S227_.TextColor3 = Color3.fromRGB(255, 255, 255)
						S227_.TextSize = 14
						S227_.AutoButtonColor = false
						S227_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
						S227_.BorderColor3 = Color3.fromRGB(0, 0, 0)
						S227_.BorderSizePixel = 0
						S227_.Size = UDim2.new(1, -10, 0, 30)
						S227_.Parent = S210_

						S228_.Parent = S227_

						S229_.Color = Color3.fromRGB(50, 50, 50)
						S229_.Thickness = 1.600000023841858
						S229_.Parent = S227_

						S227_.MouseButton1Click:Connect(function()
							S213_func(S226_forvar1)
						end)

						S227_.MouseEnter:Connect(function()
							S2_:Create(S227_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
								BackgroundColor3 = Color3.fromRGB(40, 40, 40)
							}):Play()
						end)

						S227_.MouseLeave:Connect(function()
							S2_:Create(S227_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
								BackgroundColor3 = Color3.fromRGB(35, 35, 35)
							}):Play()
						end)
					end
				end

				return S201_
			end

			function S142_:Keybind(S230_arg0)
				local S231_ = S230_arg0 or {}
				S231_.Name = S231_.Name or "Keybind"
				S231_.Key = S231_.Key or Enum.KeyCode.RightControl
				S231_.Callback = S231_.Callback or function() end

				local S232_ = S231_.Key
				local S233_ = {}
				local S234_ = false

				local S235_ = Instance.new("TextButton");
				local S236_ = Instance.new("UICorner");
				local S237_ = Instance.new("UIStroke");
				local S238_ = Instance.new("TextLabel");
				local S239_ = Instance.new("TextButton");

				S235_.Font = Enum.Font.GothamBold
				S235_.Text = ""
				S235_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S235_.TextSize = 14
				S235_.AutoButtonColor = false
				S235_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S235_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S235_.BorderSizePixel = 0
				S235_.Size = UDim2.new(1, -10, 0, 30)
				S235_.Parent = S149_

				S236_.Parent = S235_

				S237_.Color = Color3.fromRGB(50, 50, 50)
				S237_.Thickness = 1.600000023841858
				S237_.Parent = S235_

				S238_.Font = Enum.Font.GothamBold
				S238_.Text = S231_.Name
				S238_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S238_.TextSize = 14
				S238_.TextXAlignment = Enum.TextXAlignment.Left
				S238_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				S238_.BackgroundTransparency = 0.9990000128746033
				S238_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S238_.BorderSizePixel = 0
				S238_.Size = UDim2.new(1, -100, 1, 0)
				S238_.Position = UDim2.new(0, 10, 0, 0)
				S238_.Parent = S235_

				S239_.Font = Enum.Font.GothamBold
				S239_.Text = S232_.Name
				S239_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S239_.TextSize = 14
				S239_.AutoButtonColor = false
				S239_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				S239_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S239_.BorderSizePixel = 0
				S239_.Position = UDim2.new(1, -80, 0.5, -10)
				S239_.Size = UDim2.new(0, 70, 0, 20)
				S239_.Name = "KeybindButton"
				S239_.Parent = S235_

				local S240_ = Instance.new("UICorner")
				S240_.Parent = S239_

				local function S241_func()
					S239_.Text = "..."
					S234_ = true
					local S242_, S243_
					S242_ = S1_.InputBegan:Connect(function(S244_arg0)
						if S244_arg0.KeyCode ~= Enum.KeyCode.Unknown then
							S232_ = S244_arg0.KeyCode
							S239_.Text = S232_.Name
							S234_ = false
							S242_:Disconnect()
							S231_.Callback(S232_)
						end
					end)
				end

				S239_.MouseButton1Click:Connect(function()
					if not S234_ then
						S241_func()
					end
				end)

				S235_.MouseEnter:Connect(function()
					S2_:Create(S235_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()
				end)

				S235_.MouseLeave:Connect(function()
					S2_:Create(S235_, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				end)

				function S233_:Set(S245_arg0)
					S232_ = S245_arg0
					S239_.Text = S232_.Name
					S231_.Callback(S232_)
				end

				return S233_
			end

			function S142_:Label(S246_arg0)
				local S247_ = S246_arg0 or {}
				S247_.Name = S247_.Name or "Label"
				S247_.Text = S247_.Text or ""

				local S248_ = Instance.new("TextLabel");
				local S249_ = Instance.new("UICorner");
				local S250_ = Instance.new("UIStroke");

				S248_.Font = Enum.Font.GothamBold
				S248_.Text = S247_.Text
				S248_.TextColor3 = Color3.fromRGB(255, 255, 255)
				S248_.TextSize = 14
				S248_.TextWrapped = true
				S248_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				S248_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				S248_.BorderSizePixel = 0
				S248_.Size = UDim2.new(1, -10, 0, 30)
				S248_.Parent = S149_

				S249_.Parent = S248_

				S250_.Color = Color3.fromRGB(50, 50, 50)
				S250_.Thickness = 1.600000023841858
				S250_.Parent = S248_

				local S251_ = {}
				function S251_:Set(S252_arg0)
					S248_.Text = S252_arg0
				end
				return S251_
			end

			return S142_
		end

		return S126_
	end

	return S123_
end

S7_.MouseButton1Click:Connect(function()
	if S94_ and S95_ then
		S95_.Visible = not S95_.Visible
	end
end)

return S9_

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character


if game.CoreGui:FindFirstChild("AutoJoiner") then
	return
end

local found = false
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local ThingsToCreate = {
	["AutoJoiner"] = {
		ClassName = "ScreenGui",
		Enabled = true,
		Name = "AutoJoiner",
		Archivable = true,
		Children = {
			["TextButton"] = {
				ClassName = "TextButton",
				LayoutOrder = 0,
				TextWrapped = true,
				LineHeight = 1,
				Active = true,
				TextStrokeTransparency = 1,
				SizeConstraint = Enum.SizeConstraint.RelativeXY,
				ZIndex = 1,
				BorderSizePixel = 0,
				RichText = false,
				Modal = false,
				AutoButtonColor = true,
				ContentText = "Auto Connect",
				Transparency = 0,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextScaled = true,
				BackgroundColor3 = Color3.new(1, 0, 0),
				Selectable = true,
				AnchorPoint = Vector2.new(0, 0),
				TextSize = 14,
				Size = UDim2.new(0.119, 0,0.069, 0),
				Archivable = true,
				TextStrokeColor3 = Color3.new(0, 0, 0),
				TextTransparency = 0,
				ClipsDescendants = false,
				BorderColor3 = Color3.new(0, 0, 0),
				Text = "Auto Connect",
				BackgroundTransparency = 0,
				Position = UDim2.new(0.44, 0,0.913, 0),
				Rotation = 0,
				Font = Enum.Font.JosefinSans,
				Style = Enum.ButtonStyle.Custom,
				TextXAlignment = Enum.TextXAlignment.Center,
				Visible = true,
				MaxVisibleGraphemes = -1,
				Name = "TextButton",
				TextColor3 = Color3.new(0, 0, 0),
				Children = {
					["UICorner"] = {
						ClassName = "UICorner",
						Archivable = true,
						Name = "UICorner",
						CornerRadius = UDim.new(0.2,0)
					},
					["UIStroke"] = {
						ClassName = "UIStroke",
						Enabled = true,
						Transparency = 0,
						Name = "UIStroke",
						Color = Color3.new(0, 0, 0),
						Archivable = true,
						Thickness = 3,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					},
				},
			},
			["CREDITS"] = {
				ClassName = "TextLabel",
				LayoutOrder = 0,
				TextWrapped = true,
				LineHeight = 1,
				Active = false,
				TextStrokeTransparency = 1,
				SizeConstraint = Enum.SizeConstraint.RelativeXY,
				ZIndex = 1,
				BorderSizePixel = 0,
				RichText = false,
				ContentText = "Rick Accounts Hub - Auto Joiner",
				Transparency = 1,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextScaled = true,
				BackgroundColor3 = Color3.new(1, 1, 1),
				Selectable = false,
				AnchorPoint = Vector2.new(0, 0),
				TextSize = 14,
				Size = UDim2.new(0.26194146275520325, 0, 0.042016807943582535, 0),
				ClipsDescendants = false,
				Archivable = true,
				TextColor3 = Color3.new(1, 1, 1),
				BorderColor3 = Color3.new(0, 0, 0),
				Text = "Rick Accounts - Auto Joiner",
				Visible = true,
				TextTransparency = 0.5,
				Rotation = 0,
				Font = Enum.Font.JosefinSans,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextStrokeColor3 = Color3.new(0, 0, 0),
				MaxVisibleGraphemes = -1,
				Position = UDim2.new(0.013867488130927086, 0, 0.9394958019256592, 0),
				Name = "CREDITS",
			},
			["SERVER"] = {
				ClassName = "TextLabel",
				LayoutOrder = 0,
				TextWrapped = true,
				LineHeight = 1,
				Active = false,
				TextStrokeTransparency = 1,
				SizeConstraint = Enum.SizeConstraint.RelativeXY,
				ZIndex = 1,
				BorderSizePixel = 0,
				RichText = false,
				ContentText = "https://discord.gg/Wzx2AdSTWs",
				Transparency = 1,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextScaled = true,
				BackgroundColor3 = Color3.new(1, 1, 1),
				Selectable = false,
				AnchorPoint = Vector2.new(0, 0),
				TextSize = 14,
				Size = UDim2.new(0.26194146275520325, 0, 0.042016807943582535, 0),
				ClipsDescendants = false,
				Archivable = true,
				TextColor3 = Color3.new(1, 1, 1),
				BorderColor3 = Color3.new(0, 0, 0),
				Text = "https://discord.gg/Wzx2AdSTWs",
				Visible = true,
				TextTransparency = 0.5,
				Rotation = 0,
				Font = Enum.Font.JosefinSans,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextStrokeColor3 = Color3.new(0, 0, 0),
				MaxVisibleGraphemes = -1,
				Position = UDim2.new(0.7249614596366882, 0, 0.9394958019256592, 0),
				Name = "SERVER",
			},
		},
	},
}

local function createGui(data, parent)
	local obj = Instance.new(data.ClassName)
	for prop, value in pairs(data) do
		if prop ~= "ClassName" and prop ~= "Children" then
			pcall(function() obj[prop] = value end)
		end
	end
	if data.Children then
		for _, childData in pairs(data.Children) do
			createGui(childData, obj)
		end
	end
	obj.Parent = parent
	return obj
end

for _, data in pairs(ThingsToCreate) do
	createGui(data, game.CoreGui)
end

function SendMessageEMBED(url, embed)
	if not url then return end

	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json"
	}
	local data = {
		["content"] = "@everyone",
		["embeds"] = {
			{
				["title"] = embed.title,
				["description"] = embed.description,
				["color"] = embed.color,
				["fields"] = embed.fields,
				["footer"] = {
					["text"] = embed.footer.text
				},
				["thumbnail"] = {
					["url"] = embed.thumbnail
				},
				["author"] = {
					["name"] = embed.author.name,
					["icon_url"] = embed.author.icon_url
				},
				["timestamp"] = embed.timestamp
			}
		},
		["components"] = {
			{
				["type"] = 1,
				["components"] = {
					{
						["type"] = 2,
						["label"] = "📱 Mobile COPY",
						["style"] = 1,
						["custom_id"] = "mobile_copy",
						["emoji"] = {
							["name"] = "📱"
						}
					},
					{
						["type"] = 2,
						["label"] = "💻 PC COPY",
						["style"] = 1,
						["custom_id"] = "pc_copy",
						["emoji"] = {
							["name"] = "💻"
						}
					}
				}
			}
		}
	}
	local body = http:JSONEncode(data)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body
	})
end

local function hop()
	print("ServerHop Working")

	local servers = {}
	local success, req = pcall(function()
		return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
	end)

	if not success then
		warn("Error. Trying Again")

		task.wait(10)
		hop()
		return
	end

	local body = HttpService:JSONDecode(req)

	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
				table.insert(servers, 1, v.id)
			end
		end
	end

	if #servers > 0 then
		TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
	else
		hop()
		warn("Couldn't find a server.")
	end
end

local embed = {
	["title"] = "🎯 **RICK ACCOUNTS - BRAINROT ENCONTRADO!** 🎯",
	["description"] = "> ⚡ **Um brainrot raro foi detectado no servidor!** ⚡",
	["color"] = 65280,
	["thumbnail"] = {
		["url"] = "https://i.imgur.com/xU9j9yL.png"
	},
	["author"] = {
		["name"] = "Rick Accounts Auto Joiner",
		["icon_url"] = "https://i.imgur.com/3nKq7e2.png"
	},
	["fields"] = {
		{
			["name"] = "🐕 **INFORMAÇÕES DO BRAINROT**",
			["value"] = "```\nCarregando informações...\n```",
			["inline"] = false
		},
		{
			["name"] = "🆔 **SERVER ID**",
			["value"] = "```"..game.JobId.."```",
			["inline"] = true
		},
		{
			["name"] = "👥 **PLAYERS**",
			["value"] = "```"..#game.Players:GetPlayers().."/"..game.Players.MaxPlayers.."```",
			["inline"] = true
		},
		{
			["name"] = "📋 **COMANDOS PARA ENTRAR**",
			["value"] = "**PC:** `game:GetService('TeleportService'):TeleportToPlaceInstance("..game.PlaceId..", \""..game.JobId.."\", game.Players.LocalPlayer)`\n\n**Mobile:** Use os botões abaixo para copiar",
			["inline"] = false
		}
	},
	["footer"] = {
		["text"] = "Rick Accounts Hub • "..os.date("%d/%m/%Y %H:%M:%S")
	},
	["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

local gui = game.CoreGui:WaitForChild("AutoJoiner")
local button = gui:WaitForChild("TextButton")

local tab = {
	["true"] = Color3.new(0.133333, 1, 0),
	["false"] = Color3.new(1, 0, 0),
	["nil"] = Color3.new(1, 0, 0)
}

button.MouseButton1Click:Connect(function()
	_G.JoinerEnabled = not _G.JoinerEnabled
end

for _, rarity in workspace:GetDescendants() do
	if rarity:IsA("TextLabel") and rarity.Text == _G.Rarity and rarity.Name == "Rarity" then
		local sound = Instance.new("Sound",game.ReplicatedStorage)
		sound.Name = "FoundNotify"
		sound.SoundId = "rbxassetid://4590662766"
		sound.Volume = 10

		sound:Play()
		_G.JoinerEnabled = false
		found = true

		-- Atualiza as informações do brainrot
		embed.fields[1]["value"] = "```\n"..rarity.Text.." - "..rarity.Parent.Mutation.Text.." "..rarity.Parent.DisplayName.Text.." ("..rarity.Parent.Generation.Text..")".."\n```"
		
		-- Atualiza o campo de jogadores com informações em tempo real
		embed.fields[3]["value"] = "```"..#game.Players:GetPlayers().."/"..game.Players.MaxPlayers.."```"
		
		SendMessageEMBED(_G.Webhook,embed)
	end
end

if found and not _G.KeepTeleporting then
	print("Destroying Menu")
	game.CoreGui:WaitForChild("AutoJoiner"):Destroy()
	return
end

while wait(1) do
	button.BackgroundColor3 = tab[tostring(_G.JoinerEnabled)]

	if _G.JoinerEnabled == true then
		local loadingstring = "_G.Webhook = ".."'"..tostring(_G.Webhook).."'".." _G.Rarity = ".."'"..(_G.Rarity or "Secret").."'".." _G.KeepTeleporting = "..tostring(_G.KeepTeleporting).." loadstring(game:HttpGet('kkkk'))()"
		queue_on_teleport(tostring(loadingstring))
		hop()
	end
end

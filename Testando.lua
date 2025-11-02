repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

if game.CoreGui:FindFirstChild("AutoJoiner") then
	return
end

local found = false
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- 🧱 GUI
local ThingsToCreate = {
	["AutoJoiner"] = {
		ClassName = "ScreenGui",
		Enabled = true,
		Name = "AutoJoiner",
		Children = {
			["TextButton"] = {
				ClassName = "TextButton",
				Text = "Auto Connect",
				BackgroundColor3 = Color3.new(1, 0, 0),
				TextColor3 = Color3.new(0, 0, 0),
				Font = Enum.Font.JosefinSans,
				TextScaled = true,
				Size = UDim2.new(0.119, 0, 0.069, 0),
				Position = UDim2.new(0.44, 0, 0.913, 0),
				Children = {
					["UICorner"] = {
						ClassName = "UICorner",
						CornerRadius = UDim.new(0.2, 0)
					},
					["UIStroke"] = {
						ClassName = "UIStroke",
						Color = Color3.new(0, 0, 0),
						Thickness = 3
					},
				},
			},
			["CREDITS"] = {
				ClassName = "TextLabel",
				Text = "Flames Hub Auto Joiner",
				TextColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.JosefinSans,
				TextScaled = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.013, 0, 0.939, 0),
				Size = UDim2.new(0.26, 0, 0.04, 0),
			},
			["SERVER"] = {
				ClassName = "TextLabel",
				Text = "https://discord.gg/GVNYud4rNS",
				TextColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.JosefinSans,
				TextScaled = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.724, 0, 0.939, 0),
				Size = UDim2.new(0.26, 0, 0.04, 0),
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

-- 🟢 Função de envio com banner, logo, footer e contador de players
function SendMessageEMBED(url, embed)
	if not url then return end

	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json"
	}

	local data = {
		["username"] = "🔥 Flames Hub Auto Joiner 🔥",
		["avatar_url"] = "https://i.imgur.com/wkZ2t8J.png",
		["content"] = "@everyone",
		["embeds"] = {
			{
				["title"] = embed.title,
				["description"] = embed.description,
				["color"] = embed.color,
				["fields"] = embed.fields,
				["image"] = { ["url"] = embed.banner or "https://i.imgur.com/VFh3yF2.png" },
				["thumbnail"] = { ["url"] = embed.thumbnail or "https://i.imgur.com/wkZ2t8J.png" },
				["footer"] = {
					["text"] = embed.footer.text or "Flames Hub System",
					["icon_url"] = embed.footer.icon or "https://i.imgur.com/wkZ2t8J.png"
				}
			}
		}
	}

	local body = http:JSONEncode(data)
	request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body
	})
end

-- 🧠 Info do servidor atual
local totalPlayers = #Players:GetPlayers()
local serverId = game.JobId

-- 🟣 Embed configurada
local embed = {
	["title"] = "🔥 FLAMES HUB - SAB AUTO JOINER 🔥",
	["description"] = string.format("Servidor atual: **%d players**\nJob ID: `%s`\n\nSistema automático de conexão para servidores do **Flames Hub**!", totalPlayers, serverId),
	["color"] = 15695665,
	["fields"] = {
		{
			["name"] = "🐶 Brainrot Info",
			["value"] = "```Procurando raridade...```",
			["inline"] = false
		},
		{
			["name"] = "☎ Join",
			["value"] = "Entre pelo link:\n[Flames Hub Game](https://www.roblox.com/games/109253576074416/Flames-Hub-Joiner)\n```lua\nTeleportService:TeleportToPlaceInstance("..game.PlaceId..", \""..game.JobId.."\", LocalPlayer)\n```",
			["inline"] = false
		}
	},
	["footer"] = {
		["text"] = "Feito com ❤️ por Flames Hub",
		["icon"] = "https://i.imgur.com/wkZ2t8J.png"
	},
	["banner"] = "https://i.imgur.com/VFh3yF2.png",
	["thumbnail"] = "https://i.imgur.com/wkZ2t8J.png"
}

local gui = game.CoreGui:WaitForChild("AutoJoiner")
local button = gui:WaitForChild("TextButton")

local tab = {
	["true"] = Color3.new(0.133333, 1, 0),
	["false"] = Color3.new(1, 0, 0)
}

button.MouseButton1Click:Connect(function()
	_G.JoinerEnabled = not _G.JoinerEnabled
end)

-- 🎯 Detectar raridade e enviar embed
for _, rarity in workspace:GetDescendants() do
	if rarity:IsA("TextLabel") and rarity.Text == _G.Rarity and rarity.Name == "Rarity" then
		local sound = Instance.new("Sound", game.ReplicatedStorage)
		sound.Name = "FoundNotify"
		sound.SoundId = "rbxassetid://4590662766"
		sound.Volume = 10
		sound:Play()

		_G.JoinerEnabled = false
		found = true

		embed.fields[1]["value"] = "```"..rarity.Text.." - "..rarity.Parent.Mutation.Text.." "..rarity.Parent.DisplayName.Text.." ("..rarity.Parent.Generation.Text..")```"
		SendMessageEMBED(_G.Webhook, embed)
	end
end

if found and not _G.KeepTeleporting then
	game.CoreGui:WaitForChild("AutoJoiner"):Destroy()
	return
end

-- 🌎 Função de Server Hop
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
		for _, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers)
				and v.playing < v.maxPlayers and v.id ~= game.JobId then
				table.insert(servers, v.id)
			end
		end
	end

	if #servers > 0 then
		TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
	else
		hop()
	end
end

-- ⚙️ Loop principal
while wait(1) do
	button.BackgroundColor3 = tab[tostring(_G.JoinerEnabled)]

	if _G.JoinerEnabled then
		local loadingstring = "_G.JoinerEnabled = "..tostring(_G.JoinerEnabled).." _G.Webhook = '"..tostring(_G.Webhook).."' _G.Rarity = '"..(_G.Rarity or "Secret").."' _G.KeepTeleporting = "..tostring(_G.KeepTeleporting).." loadstring(game:HttpGet('https://raw.githubusercontent.com/qWixxyLuau/FlamesHub/refs/heads/main/SAB_Joiner.lua'))()"
		queue_on_teleport(loadingstring)
		hop()
	end
end

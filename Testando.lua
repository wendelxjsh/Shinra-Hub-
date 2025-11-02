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
						Thickness = 1
					},
				},
			},
			["CREDITS"] = {
				ClassName = "TextLabel",
				Text = "Rick Accounts - Hub Auto Joiner",
				TextColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.JosefinSans,
				TextScaled = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.013, 0, 0.939, 0),
				Size = UDim2.new(0.26, 0, 0.04, 0),
			},
			["SERVER"] = {
				ClassName = "TextLabel",
				Text = "https://discord.gg/Wzx2AdSTWs",
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
		["username"] = "Rick Accounts Notify",
		["avatar_url"] = "https://cdn.discordapp.com/attachments/1432538138793738240/1434343679878758513/roclas.gif?ex=6907fc26&is=6906aaa6&hm=17e71e57771bbd5f0618bec18f45b5c1fa3317d115514e4b493cb280cad85cd0&",
		["content"] = "<@&1434398185547239626>",
		["embeds"] = {
			{
				["title"] = embed.title,
				["description"] = embed.description,
				["color"] = embed.color,
				["fields"] = embed.fields,
				["image"] = { ["url"] = embed.banner or "https://cdn.discordapp.com/attachments/1372641866134061111/1434392469445021827/images.webp?ex=69082996&is=6906d816&hm=a1bb7a450f4902d5b6fd8082dbcc08d88c7c9a4abd010a91609b04e2abe17f2c&" },
				["thumbnail"] = { ["url"] = embed.thumbnail or "https://cdn.discordapp.com/attachments/1432538138793738240/1434347936921292891/rickaccouhnts_copiar-1.png?ex=6908001d&is=6906ae9d&hm=d1adff004124b0b2fa0de957466b64ef7f1560d122c74351cc3c43f14ec612ca&" },
				["footer"] = {
					["text"] = embed.footer.text or "Rick Accounts System",
					["icon_url"] = embed.footer.icon or "https://cdn.discordapp.com/attachments/1432538138793738240/1434343499381346314/roclas.gif?ex=6907fbfb&is=6906aa7b&hm=5c13948fbde06f93b48a58ad1ff91792f8688ac35544ae52e2ccdcdd0d83f502&"
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
	["title"] = "🌴 RICK ACCOUNTS - SAB AUTO JOINER 🌴",
	["description"] = string.format("<:usernotity:1434396026428723281> **%d players**\nJob ID: `%s`\n\nTeleporte, Copie o Job Id e execute Em seu executor. Game: **Steal a Brainrots**!", totalPlayers, serverId),
	["color"] = 16711680,
	["fields"] = {
		{
			["name"] = "<:brainrotnotify:1434396689195597955> Brainrot Info",
			["value"] = "```Em busca de uma raridade...```",
			["inline"] = false
		},
		{
			["name"] = "<:linknotify:1434395789794345091> Join",
			["value"] = "Entrar pelo link:\n[Rick Accounts](https://www.roblox.com/games/109983668079237/Steal-a-Brainrot)\n```lua\nTeleportService:TeleportToPlaceInstance("..game.PlaceId..", \""..game.JobId.."\", LocalPlayer)\n```",
			["inline"] = false
		}
	},
	["footer"] = {
		["text"] = "Feito por <@1220178603858333818>",
		["icon"] = "https://cdn.discordapp.com/attachments/1372641866134061111/1434397677331939358/f2029ead-8b1c-4242-b493-30c6e3881378.jpg?ex=69082e70&is=6906dcf0&hm=5f5f525aa8e2760cb601cb9229a5eca2b012c8d0921163c6445a8f5703c08a6c&"
	},
	["banner"] = "https://cdn.discordapp.com/attachments/1372641866134061111/1434392469445021827/images.webp?ex=69082996&is=6906d816&hm=a1bb7a450f4902d5b6fd8082dbcc08d88c7c9a4abd010a91609b04e2abe17f2c&",
	["thumbnail"] = "https://cdn.discordapp.com/attachments/1432538138793738240/1434347936921292891/rickaccouhnts_copiar-1.png?ex=6908001d&is=6906ae9d&hm=d1adff004124b0b2fa0de957466b64ef7f1560d122c74351cc3c43f14ec612ca&"
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
		local loadingstring = "_G.JoinerEnabled = "..tostring(_G.JoinerEnabled).." _G.Webhook = '"..tostring(_G.Webhook).."' _G.Rarity = '"..(_G.Rarity or "Secret").."' _G.KeepTeleporting = "..tostring(_G.KeepTeleporting).." loadstring(game:HttpGet('https://raw.githubusercontent.com/wendelxjsh/Shinra-Hub-/refs/heads/main/Testando.lua'))()"
		queue_on_teleport(loadingstring)
		hop()
	end
end

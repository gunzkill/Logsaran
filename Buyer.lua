etgenv().Settings = {
    Show_Item_Settings = {
        Godhuman = true,  -- true or false
        Cursed_Dual_Katana = true,  -- true or false
        Hallow_Scythe = true,  -- true or false
        Soul_Guitar = true,  -- true or false
        Tushita = true,  -- true or false
        Yama = true,  -- true or false
		Dark_Dagger = true,
		Valkyrie_Helm = true,
    },
    Show_Material_Settings = {
        Dark_Fragment = true,  -- true or false
        Mirror_Fractal = true,
    },
    Delay_Settings = {
        Enabled = true, -- true or false
        CheckingDelay = 3,
    },
    AutoRejoin = true,
}

repeat wait(.25) until game:IsLoaded() and game.Players.LocalPlayer.Character and game.Players.LocalPlayer:FindFirstChild("Backpack") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main") and pcall(function() return game.Players.LocalPlayer.Idled end)
repeat wait()
	pcall(function()
		join = game.Players.localPlayer.Neutral == false
		if _G.Team == "Pirates" then
			for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
					v.Function()
				end
			end
		elseif _G.Team == "Marines" then
			for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
					v.Function()
				end
			end
		else
			for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
					v.Function()
				end
			end
		end
	end)
until game.Players.LocalPlayer.Team ~= nil

--
local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local host = "http://localhost:7963"
local Port = "7963"
getgenv().Local=function(data)
    if data==1 then return game.Players.LocalPlayer.Name end
    if data==2 then return game.Players.LocalPlayer.UserId end
end
local json_encode = function(data)
    return game:GetService("HttpService"):JSONEncode(data)
end
getgenv().SetAlias=function(Alias)
    local SetAlias = requests({
        Url = host.."/SetAlias?Account="..getgenv().Local(2),
        Method = "POST",
        Body = Alias,
    })
    return SetAlias
end

getgenv().SetDescription=function(Description)
    local SetDescription = requests({
        Url = host.."/SetDescription?Account="..getgenv().Local(2),
        Method = "POST",
        Body = Description,
    })
    return SetDescription
end

local SkillAwake = '❌'
local WorldText = '1'

local placeId = game.PlaceId
if placeId == 2753915549 then
	WorldText = '1'
elseif placeId == 4442272183 then
	WorldText = '2'
elseif placeId == 7449423635 then
	WorldText = '3'
end

local formatNumber = (function (n) n = tostring(n) return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "") end) 

function Abbreviate(x)
    local abbreviations = {
        "K", -- 4 digits
        "M", -- 7 digits
        "B", -- 10 digits
        "T", -- 13 digits
        "QD", -- 16 digits
        "QT", -- 19 digits
        "SXT", -- 22 digits
        "SEPT", -- 25 digits
        "OCT", -- 28 digits
        "NON", -- 31 digits
        "DEC", -- 34 digits
        "UDEC", -- 37 digits
        "DDEC", -- 40 digits
    }
    if x < 1000 then 
        return tostring(x)
    end

    local digits = math.floor(math.log10(x)) + 1
    local index = math.min(#abbreviations, math.floor((digits - 1) / 3))
    local front = x / math.pow(10, index * 3)

    return string.format("%i%s", front, abbreviations[index])
end

task.spawn(function()
    while true do wait(1)
        pcall(function()
            for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v.ToolTip == "Blox Fruit" then
                        if v:FindFirstChild("AwakenedMoves") then
                            if v.AwakenedMoves:FindFirstChild("Z") then
                                AwakeZ = true
                            end
                            if v.AwakenedMoves:FindFirstChild("X") then
                                AwakeX = true
                            end
                            if v.AwakenedMoves:FindFirstChild("C") then
                                AwakeC = true
                            end
                            if v.AwakenedMoves:FindFirstChild("V") then
                                AwakeV = true
                            end
                            if v.AwakenedMoves:FindFirstChild("F") then
                                AwakeF = true
                            end
                            if v.AwakenedMoves:FindFirstChild("TAP") then
                                AwakeTAP = true
                            end
                            if v.Name == "Dough-Dough" then
                                if AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true and AwakeTAP == true then
                                    SkillAwake = "✔️"
                                else
                                    SkillAwake = "❌"
                                end
                            else
                                if (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true) or (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true) then
                                    SkillAwake = "✔️"
                                else
                                    SkillAwake = "❌"
                                end
                            end
                        else
                            SkillAwake = "Can't Awakened | "
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == '' then
                        SkillAwake = "Don't have Fruit"
                    end
                end
            end
        end)
    end
end)

local function GetNewAwake()
    AwakeText = ''
    pcall(function()
        for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Blox Fruit" then
                    if v:FindFirstChild("AwakenedMoves") then
                        if v.AwakenedMoves:FindFirstChild("Z") then
                            AwakeZ = true
                        end
                        if v.AwakenedMoves:FindFirstChild("X") then
                            AwakeX = true
                        end
                        if v.AwakenedMoves:FindFirstChild("C") then
                            AwakeC = true
                        end
                        if v.AwakenedMoves:FindFirstChild("V") then
                            AwakeV = true
                        end
                        if v.AwakenedMoves:FindFirstChild("F") then
                            AwakeF = true
                        end
                        if v.AwakenedMoves:FindFirstChild("TAP") then
                            AwakeTAP = true
                        end
                        if v.Name == "Dough-Dough" then
                            if AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true and AwakeTAP == true then
                                AwakeText = "Full "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            end
                        else
                            if (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true) or (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true) then
                                AwakeText = "Full "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            end
                        end
                    else
                        AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                    end
                elseif game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == '' then
                    AwakeText = "Don't have Fruit"
                end
            end
        end
        for i ,v in pairs(game:GetService("Workspace").Characters[game.Players.LocalPlayer.Name]:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Blox Fruit" then
                    if v:FindFirstChild("AwakenedMoves") then
                        if v.AwakenedMoves:FindFirstChild("Z") then
                            AwakeZ = true
                        end
                        if v.AwakenedMoves:FindFirstChild("X") then
                            AwakeX = true
                        end
                        if v.AwakenedMoves:FindFirstChild("C") then
                            AwakeC = true
                        end
                        if v.AwakenedMoves:FindFirstChild("V") then
                            AwakeV = true
                        end
                        if v.AwakenedMoves:FindFirstChild("F") then
                            AwakeF = true
                        end
                        if v.AwakenedMoves:FindFirstChild("TAP") then
                            AwakeTAP = true
                        end
                        if v.Name == "Dough-Dough" then
                            if AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true and AwakeTAP == true then
                                AwakeText = "Full "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            end
                        else
                            if (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true and AwakeF == true) or (AwakeZ == true and AwakeX == true and AwakeC == true and AwakeV == true) then
                                AwakeText = "F "..string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            else
                                AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                            end
                        end
                    else
                        AwakeText = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
                    end
                end
            end
        end
    end)
    return AwakeText
end

function GetAllMeleeNew()
    if getgenv().Settings.Show_Item_Settings["Godhuman"] == true then
        combat = 0
        BuyDragonTalon = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true))
        if BuyDragonTalon then
            if BuyDragonTalon == 1 then
                combat += 1
            end
        end
        BuySuperhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true))
        if BuySuperhuman then
            if BuySuperhuman == 1 then
                combat += 1
            end
        end
        BuySharkmanKarate = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))
        if BuySharkmanKarate then
            if BuySharkmanKarate == 1 then
                combat += 1
            end
        end
        BuyDeathStep = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true))
        if BuyDeathStep then
            if BuyDeathStep == 1 then
                combat += 1
            end
        end
        BuyElectricClaw = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true))
        if BuyElectricClaw then
            if BuyElectricClaw == 1 then
                combat += 1
            end
        end
        GodHuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
        if GodHuman then
            if GodHuman == 1 then
                CombatText = 'GOD'
            else
                CombatText = combat..'/6'
            end
        end
    else
        CombatText = ''
    end
    return CombatText
end

local function CheckTushita()
    if getgenv().Settings.Show_Item_Settings["Tushita"] == true then
        Tushita_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Tushita' then
                    Tushita_Text = ' TS'
                end
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Tushita') then
                    Tushita_Text = ' TS'
                end
            end
        end
    else
        Tushita_Text = ''
    end
    return Tushita_Text
end

local function CheckYama()
    if getgenv().Settings.Show_Item_Settings["Yama"] == true then
    Yama_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Yama' then
                    Yama_Text = ' YM'
                end
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Yama') then
                    Yama_Text = ' YM'
                end
            end
        end
    else
        Yama_Text = ''
    end
    return Yama_Text
end

function CheckDarkFragment()
    if getgenv().Settings.Show_Material_Settings["Dark_Fragment"] == true then
        DarkFrag_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
            if type(v) == "table" then
                if v.Type == "Material" then
                    if v.Name == "Dark Fragment" then
                        DarkFrag_Text = "\n Dark Fragment : ✔️"
                    end
                end
            end
        end
	else
        DarkFrag_Text = ''
    end
    return DarkFrag_Text
end

function CheckMirrorFractalNew()
    if getgenv().Settings.Show_Material_Settings["Mirror_Fractal"] == true then
        MirrorFac_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
            if type(v) == "table" then
                if v.Type == "Material" then
                    if v.Name == "Mirror Fractal" then
                        MirrorFac_Text = "MIR"
                    end
                end
            end
        end
	else
        MirrorFac_Text = ''
    end
    return MirrorFac_Text
end

function GetFruitInU()
    local ReturnText = {}
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if type(v) == "table" then
            if v ~= nil then
                if v.Price >= 1000000 then
                    table.insert(ReturnText,string.split(v.Name,"-")[2])
                end
            end
        end
    end

    if #ReturnText ~= 0 then
        return table.concat(ReturnText,"")
    else
        return "❌"
    end
end

function CheckFruit()
    DF_Fruits = '❌'
    if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value ~= "" then
        DF_Fruits = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2]
    end
    return DF_Fruits
end

function CheckLevel()
    RaceText = ''
    if game:GetService("Players").LocalPlayer.Data.Level.Value < 2450 then
        RaceText = game:GetService("Players").LocalPlayer.Data.Level.Value..' | '
    else
        RaceText = 'MAX | '
    end
    return RaceText
end

local function CheckSGTNew()
    if getgenv().Settings.Show_Item_Settings["Soul_Guitar"] == true then
        SGT_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Soul Guitar' then
                    SGT_Text = ' SGT'
                end
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Soul Guitar') then
                    SGT_Text = ' SGT'
                end
            end
        end
    else
        SGT_Text = ''
    end
    return SGT_Text
end

local function CheckCDKNew()
    if getgenv().Settings.Show_Item_Settings["Cursed_Dual_Katana"] == true then
        CDK_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Cursed Dual Katana' then
                    CDK_Text = ' | CDK | '
                end
            end
        end
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Cursed Dual Katana') then
            CDK_Text = ' | CDK | '
        end
    else
        CDK_Text = ''
    end
    return CDK_Text
end

local function CheckHSNew()
    if getgenv().Settings.Show_Item_Settings["Hallow_Scythe"] == true then
        HS_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Hallow Scythe' then
                    HS_Text = ' HS'
                end
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Hallow Scythe') then
                    HS_Text = ' HS'
                end
            end
        end
    else
        HS_Text = ''
    end
    return HS_Text
end

local function CheckVK()
    if getgenv().Settings.Show_Item_Settings["Valkyrie_Helm"] == true then
        VK_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Valkyrie Helm' then
                    VK_Text = 'VKH | '
                end
            end
        end
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Valkyrie Helm') then
            VK_Text = 'VKH | '
        end
    else
        VK_Text = ''
    end
    return VK_Text
end

local function CheckDG()
    if getgenv().Settings.Show_Item_Settings["Dark_Dagger"] == true then
        DG_Text = ''
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
            for i1,v1 in pairs(v) do
                if v1 == 'Dark Dagger' then
                    DG_Text = ' DG'
                end
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Dark Dagger') then
                    DG_Text = ' DG'
                end
            end
        end
    else
        DG_Text = ''
    end
    return DG_Text
end

local function CheckRaceV()
	ReturnText = '1'
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Awakening") or game.Players.LocalPlayer.Character:FindFirstChild("Awakening") then
		ReturnText = '4'
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == -2 then
		ReturnText = '3'
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3") == -2 then
		ReturnText = '2'
	end
	return ReturnText
end

task.spawn(function()
    while true do
		pcall(function()
			getgenv().SetAlias(CheckLevel()..GetAllMeleeNew().." | "..CheckCDKNew().." | ["..CheckVK()..CheckMirrorFractalNew()..'] | '..game:GetService("Players").LocalPlayer.Data.Race.Value.." ["..CheckRaceV().."]")
			getgenv().SetDescription(GetNewAwake()..' | W : '..WorldText.." B : "..Abbreviate(game.Players.LocalPlayer.Data.Beli.Value)..' F : '..Abbreviate(game.Players.LocalPlayer.Data.Fragments.Value).." "..CheckHSNew()..CheckSGTNew()..CheckTushita()..CheckYama()..CheckDG()..CheckDarkFragment()..'\n FruitsInv: '..GetFruitInU())
		end);
        if getgenv().Settings.Delay_Settings.Enabled == true then
            wait(getgenv().Settings.Delay_Settings.CheckingDelay)
        else
            wait(1)
        end
    end;
end);

Kick = false
-- [Auto Rejoin]
spawn(function()
	while wait() do
		if getgenv().Settings["AutoRejoin"] then
			game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
				if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") and Kick == false then
                    print("Kicked!")
                    Kick = true
                    local tpservice= game:GetService("TeleportService")
                    local plr = game.Players.LocalPlayer
                    tpservice:Teleport(game.PlaceId, plr)
                    wait(10)
				end
			end)
		end
	end
end)

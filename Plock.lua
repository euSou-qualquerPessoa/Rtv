local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local taskWait = task.wait

-----------------------------
-- CONFIGURAÇÃO DE MUNDOS (IGNORA PlaceId)
-----------------------------
local World1 = true
local World2 = true
local World3 = true

-----------------------------
-- QUESTS COMPLETAS SEA 1 (LEVEL 1 ATÉ 700)
-----------------------------
local function CheckQuestWorld1()
    local MyLevel = LocalPlayer.Data.Level.Value
    if MyLevel >= 1 and MyLevel <= 9 then
        Mon = "Bandit"; LevelQuest = 1; NameQuest = "BanditQuest1"; NameMon = "Bandit"
        CFrameQuest = CFrame.new(1059.37, 15.44, 1550.42); CFrameMon = CFrame.new(1045.96, 27, 1560.82)
    elseif MyLevel >= 10 and MyLevel <= 14 then
        Mon = "Monkey"; LevelQuest = 1; NameQuest = "JungleQuest1"; NameMon = "Monkey"
        CFrameQuest = CFrame.new(-1598.08, 35.55, 153.37); CFrameMon = CFrame.new(-1448.51, 67.85, 11.46)
    elseif MyLevel >= 15 and MyLevel <= 19 then
        Mon = "Gorilla"; LevelQuest = 2; NameQuest = "JungleQuest2"; NameMon = "Gorilla"
        CFrameQuest = CFrame.new(-1580, 36, 160); CFrameMon = CFrame.new(-1450, 68, 20)
    elseif MyLevel >= 20 and MyLevel <= 29 then
        Mon = "Gorilla"; LevelQuest = 2; NameQuest = "JungleQuest3"; NameMon = "Gorilla"
        CFrameQuest = CFrame.new(-1585, 36, 180); CFrameMon = CFrame.new(-1455, 68, 40)
    elseif MyLevel >= 30 and MyLevel <= 39 then
        Mon = "Pirate"; LevelQuest = 3; NameQuest = "PirateQuest1"; NameMon = "Pirate"
        CFrameQuest = CFrame.new(2000, 10, 500); CFrameMon = CFrame.new(2050, 15, 520)
    elseif MyLevel >= 40 and MyLevel <= 59 then
        Mon = "Pirate"; LevelQuest = 3; NameQuest = "PirateQuest2"; NameMon = "Pirate"
        CFrameQuest = CFrame.new(2005, 10, 550); CFrameMon = CFrame.new(2055, 15, 570)
    elseif MyLevel >= 60 and MyLevel <= 69 then
        Mon = "Marine"; LevelQuest = 4; NameQuest = "MarineQuest1"; NameMon = "Marine"
        CFrameQuest = CFrame.new(2150, 12, 600); CFrameMon = CFrame.new(2200, 17, 620)
    elseif MyLevel >= 70 and MyLevel <= 99 then
        Mon = "Marine"; LevelQuest = 4; NameQuest = "MarineQuest2"; NameMon = "Marine"
        CFrameQuest = CFrame.new(2155, 12, 650); CFrameMon = CFrame.new(2205, 17, 670)
    elseif MyLevel >= 100 and MyLevel <= 149 then
        Mon = "Cannon Master"; LevelQuest = 5; NameQuest = "CannonQuest1"; NameMon = "Cannon Master"
        CFrameQuest = CFrame.new(2300, 15, 700); CFrameMon = CFrame.new(2350, 20, 720)
    elseif MyLevel >= 150 and MyLevel <= 199 then
        Mon = "Prisoner"; LevelQuest = 6; NameQuest = "PrisonQuest1"; NameMon = "Prisoner"
        CFrameQuest = CFrame.new(2500, 18, 800); CFrameMon = CFrame.new(2550, 23, 820)
    elseif MyLevel >= 200 and MyLevel <= 299 then
        Mon = "Brute"; LevelQuest = 7; NameQuest = "BruteQuest1"; NameMon = "Brute"
        CFrameQuest = CFrame.new(2700, 20, 900); CFrameMon = CFrame.new(2750, 25, 920)
    elseif MyLevel >= 300 and MyLevel <= 399 then
        Mon = "Zombie"; LevelQuest = 8; NameQuest = "ZombieQuest1"; NameMon = "Zombie"
        CFrameQuest = CFrame.new(2900, 22, 1000); CFrameMon = CFrame.new(2950, 27, 1020)
    elseif MyLevel >= 400 and MyLevel <= 499 then
        Mon = "Shark"; LevelQuest = 9; NameQuest = "SharkQuest1"; NameMon = "Shark"
        CFrameQuest = CFrame.new(3100, 25, 1100); CFrameMon = CFrame.new(3150, 30, 1120)
    elseif MyLevel >= 500 and MyLevel <= 599 then
        Mon = "Commander"; LevelQuest = 10; NameQuest = "CommanderQuest1"; NameMon = "Commander"
        CFrameQuest = CFrame.new(3300, 28, 1200); CFrameMon = CFrame.new(3350, 33, 1220)
    elseif MyLevel >= 600 and MyLevel <= 699 then
        Mon = "Captain"; LevelQuest = 11; NameQuest = "CaptainQuest1"; NameMon = "Captain"
        CFrameQuest = CFrame.new(3500, 30, 1300); CFrameMon = CFrame.new(3550, 35, 1320)
    elseif MyLevel >= 700 then
        Mon = "Vice Admiral de Gelo"; LevelQuest = 12; NameQuest = "ViceAdmiralQuest"; NameMon = "Vice Admiral de Gelo"
        CFrameQuest = CFrame.new(3700, 35, 1400); CFrameMon = CFrame.new(3750, 40, 1420)
    end
end

spawn(function()
    while true do
        taskWait()
        CheckQuestWorld1()
    end
end)

-----------------------------
-- TELEPORT AUTOMÁTICO SEA 1
-----------------------------
local function TPReturnerWorld1()
    local PlaceID = tostring(game.PlaceId)
    local AllIDs = {}
    local ok, Site = pcall(function()
        return HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..PlaceID..'/servers/Public?sortOrder=Asc&limit=100'))
    end)
    if not ok or not Site then return end
    for _, v in pairs(Site.data or {}) do
        local Possible = true
        local ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if ID == tostring(Existing) then Possible = false end
            end
            if Possible then
                table.insert(AllIDs, ID)
                taskWait()
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(tonumber(PlaceID), ID, LocalPlayer)
                end)
                taskWait(4)
            end
        end
    end
end

spawn(function()
    while true do
        taskWait()
        pcall(TPReturnerWorld1)
    end
end)

-----------------------------
-- ESP SEA 1
-----------------------------
local IslandESP = true
local function UpdateIslandESPWorld1()
    local locations = Workspace:FindFirstChild("_WorldOrigin") and Workspace["_WorldOrigin"]:FindFirstChild("Locations")
    if not locations then return end
    for _, v in pairs(locations:GetChildren()) do
        pcall(function()
            if IslandESP and v.Name ~= "Sea" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'; bill.ExtentsOffset = Vector3.new(0,1,0)
                    bill.Size = UDim2.new(1,200,1,30); bill.Adornee = v; bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamBold; name.TextSize = 14; name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0); name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1; name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(7,236,240); name.Text = v.Name
                end
            elseif v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end

spawn(function()
    while true do
        UpdateIslandESPWorld1()
        taskWait(1)
    end
end)

-----------------------------
-- QUESTS, TELEPORT E ESP SEA 2
-----------------------------
local function CheckQuestWorld2()
    local MyLevel = LocalPlayer.Data.Level.Value
    -- Complete aqui da mesma forma que World1 (701 até 1500+)
end

spawn(function()
    while true do
        taskWait()
        CheckQuestWorld2()
    end
end)

local function TPReturnerWorld2()
    -- Mesma lógica do World1
end

spawn(function()
    while true do
        taskWait()
        pcall(TPReturnerWorld2)
    end
end)

local function UpdateIslandESPWorld2()
    -- Mesma lógica do World1
end

spawn(function()
    while true do
        UpdateIslandESPWorld2()
        taskWait(1)
    end
end)

-----------------------------
-- QUESTS, TELEPORT E ESP SEA 3
-----------------------------
local function CheckQuestWorld3()
    local MyLevel = LocalPlayer.Data.Level.Value
    -- Complete aqui da mesma forma que World1 (1501 até 2500+)
end

spawn(function()
    while true do
        taskWait()
        CheckQuestWorld3()
    end
end)

local function TPReturnerWorld3()
    -- Mesma lógica do World1
end

spawn(function()
    while true do
        taskWait()
        pcall(TPReturnerWorld3)
    end
end)

local function UpdateIslandESPWorld3()
    -- Mesma lógica do World1
end

spawn(function()
    while true do
        UpdateIslandESPWorld3()
        taskWait(1)
    end
end)

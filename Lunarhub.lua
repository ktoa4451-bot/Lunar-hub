-- ============================================
-- 🌙 LUNAR HUB v11.0 (FINAL - РАБОЧАЯ ВЕРСИЯ)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "11.0"
    local repoURL = "https://raw.githubusercontent.com/ktoa4451-bot/Lunar-hub/main/"
    
    local success, remoteVersion = pcall(function()
        return game:HttpGet(repoURL .. "version.txt")
    end)
    
    if not success then
        warn("⚠️ Не удалось проверить обновления. Загружаю текущую версию.")
        return false
    end
    
    remoteVersion = remoteVersion:gsub("%s+", "")
    
    if remoteVersion ~= currentVersion then
        print("🔄 Найдено обновление! (" .. currentVersion .. " → " .. remoteVersion .. ")")
        print("📥 Загрузка новой версии...")
        local newScript = game:HttpGet(repoURL .. "Lunarhub.lua")
        loadstring(newScript)()
        return true
    end
    
    print("✅ Версия актуальна (" .. currentVersion .. ")")
    return false
end

if selfUpdate() then
    return
end

-- ============================================
-- ⚡ ИГРЫ (С ИКОНКАМИ)
-- ============================================
local Games = {
    {name = "🔫 Forsaken", link = "https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB"},
    {name = "🔫 MM2", link = "https://raw.githubusercontent.com/pruzgar242-rgb/Update/refs/heads/main/out.lua%20(17).txt"},
    {name = "🔫 Rivals", link = "https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"},
    {name = "🔫 Slap Battles", link = "https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/File-Script/Slap_Battles.lua"},
    {name = "🎮 King Legacy", link = "https://pastefy.app/3xQp8vL9/raw"},
    {name = "🎮 1+ Speed Keyboard", link = "https://raw.githubusercontent.com/Gerreiro68/ShizaHub/refs/heads/main/loader.lua"},
    {name = "🎮 Merge Nuke", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/MergeaNuke"},
    {name = "🎮 MorphUp", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/MorphUp"},
    {name = "🎮 1 Magic Evolution", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/1MagicEvolution"},
    {name = "🎮 99 Nights in Forest", link = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {name = "🎮 Survive Zombie Arena", link = "https://raw.githubusercontent.com/caomod2077/Script/main/Foxname_SZA.lua"},
    {name = "🎮 Color or Die", link = "https://rawscripts.net/raw/Color-or-Die-Esp-12555"},
    {name = "💰 Rost Alpha Premium", link = "https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download"},
    {name = "💰 Prison Life Premium", link = "https://rawscripts.net/raw/Prison-Life-Override-Hub-Silent-Aim-and-More-242218"},
}

-- ============================================
-- ⭐ ИЗБРАННОЕ
-- ============================================
local Favorites = {}
local currentCategory = "Все игры"

-- ============================================
-- 🔧 УНИВЕРСАЛЬНЫЙ ЗАГРУЗЧИК
-- ============================================
local function loadScript(link)
    local success, result = pcall(function()
        local scriptContent = game:HttpGet(link)
        if scriptContent then
            return loadstring(scriptContent)
        end
        return nil
    end)
    
    if success and result then
        local execSuccess, execErr = pcall(result)
        if execSuccess then
            return true, "✅ Success"
        else
            return false, "Execute error: " .. tostring(execErr)
        end
    else
        return false, "Load error: " .. tostring(result)
    end
end

-- ============================================
-- 🔧 GUI (ПРОСТОЙ И НАДЁЖНЫЙ)
-- ============================================
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 450)
frame.Position = UDim2.new(0.5, -250, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌙 LUNAR HUB v11.0"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

-- СЧЁТЧИК ИЗБРАННОГО
local favCountLabel = Instance.new("TextLabel")
favCountLabel.Size = UDim2.new(0, 150, 0, 30)
favCountLabel.Position = UDim2.new(1, -160, 0, 10)
favCountLabel.Text = "⭐ 0"
favCountLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
favCountLabel.TextSize = 14
favCountLabel.Font = Enum.Font.GothamBold
favCountLabel.BackgroundTransparency = 1
favCountLabel.TextXAlignment = Enum.TextXAlignment.Right
favCountLabel.Parent = frame

-- ЗАКРЫТИЕ
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.BackgroundTransparency = 1
close.Parent = frame
close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ПОИСК
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 300, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 50)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
searchBox.BackgroundTransparency = 0.5
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "🔍 Search..."
searchBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 180)
searchBox.TextSize = 13
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.Parent = frame

-- КАТЕГОРИИ
local categoriesFrame = Instance.new("Frame")
categoriesFrame.Size = UDim2.new(0, 100, 0, 300)
categoriesFrame.Position = UDim2.new(0, 10, 0, 90)
categoriesFrame.BackgroundTransparency = 1
categoriesFrame.Parent = frame

local categoriesLayout = Instance.new("UIListLayout")
categoriesLayout.FillDirection = Enum.FillDirection.Vertical
categoriesLayout.Padding = UDim.new(0, 5)
categoriesLayout.Parent = categoriesFrame

-- СПИСОК ИГР
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(0, 350, 0, 300)
list.Position = UDim2.new(0, 125, 0, 90)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 4
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = list

-- ============================================
-- ⭐ ЛОГИКА ИЗБРАННОГО
-- ============================================
local function updateFavCount()
    local count = 0
    for _ in pairs(Favorites) do count = count + 1 end
    favCountLabel.Text = "⭐ " .. count
end

local function toggleFavorite(gameName)
    if Favorites[gameName] then
        Favorites[gameName] = nil
    else
        Favorites[gameName] = true
    end
    updateFavCount()
    updateContent(currentCategory)  -- Обновляем список, чтобы звёздочки обновились
end

-- ============================================
-- 📋 ОТРИСОВКА ИГР
-- ============================================
local function updateContent(category)
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local gamesToShow = {}
    local searchText = searchBox.Text:lower()
    
    if category == "Избранное" then
        for _, game in ipairs(Games) do
            if Favorites[game.name] then
                table.insert(gamesToShow, game)
            end
        end
    else
        for _, game in ipairs(Games) do
            table.insert(gamesToShow, game)
        end
    end
    
    if searchText ~= "" then
        local filtered = {}
        for _, game in ipairs(gamesToShow) do
            if string.find(string.lower(game.name), searchText) then
                table.insert(filtered, game)
            end
        end
        gamesToShow = filtered
    end
    
    table.sort(gamesToShow, function(a, b) return a.name < b.name end)
    
    for _, game in ipairs(gamesToShow) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 32)
        btn.Text = game.name
        btn.TextColor3 = Color3.fromRGB(230, 230, 255)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Font = Enum.Font.GothamBold
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        btn.BackgroundTransparency = 0.2
        btn.BorderSizePixel = 0
        btn.Parent = list
        btn.Name = game.name
        
        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 12)
        padding.Parent = btn
        
        -- КНОПКА ИЗБРАННОГО (ЗВЁЗДОЧКА)
        local favBtn = Instance.new("TextButton")
        favBtn.Size = UDim2.new(0, 25, 1, 0)
        favBtn.Position = UDim2.new(1, -30, 0, 0)
        favBtn.Text = Favorites[game.name] and "⭐" or "☆"
        favBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
        favBtn.TextSize = 16
        favBtn.BackgroundTransparency = 1
        favBtn.Parent = btn
        
        favBtn.MouseButton1Click:Connect(function()
            toggleFavorite(game.name)
            favBtn.Text = Favorites[game.name] and "⭐" or "☆"
            if currentCategory == "Избранное" then
                updateContent("Избранное")
            end
        end)
        
        -- НАВЕДЕНИЕ
        btn.MouseEnter:Connect(function()
            btn.BackgroundTransparency = 0
            btn.BackgroundColor3 = Color3.fromRGB(45, 35, 80)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundTransparency = 0.2
            btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        end)
        
        -- ЗАГРУЗКА СКРИПТА
        btn.MouseButton1Click:Connect(function()
            btn.Text = "⏳..."
            task.wait(0.15)
            local success, msg = loadScript(game.link)
            if success then
                btn.Text = "✅ " .. game.name
                btn.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
            else
                btn.Text = "❌ " .. game.name
                btn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
            end
            task.wait(1.5)
            btn.Text = game.name
            btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        end)
    end
    
    list.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 36 + 10)
end

-- ============================================
-- 📋 КАТЕГОРИИ
-- ============================================
local categories = {"Все игры", "Избранное"}
local categoryButtons = {}

for _, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Text = cat
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Parent = categoriesFrame
    btn.Name = cat
    
    btn.MouseButton1Click:Connect(function()
        currentCategory = cat
        for _, b in ipairs(categoriesFrame:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundTransparency = 0.3
            end
        end
        btn.BackgroundTransparency = 0
        updateContent(cat)
    end)
    categoryButtons[cat] = btn
end

if categoryButtons["Все игры"] then
    categoryButtons["Все игры"].BackgroundTransparency = 0
end

-- ============================================
-- 🔍 ПОИСК
-- ============================================
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateContent(currentCategory)
end)

-- ============================================
-- ⚡ ЗАПУСК
-- ============================================
updateFavCount()
updateContent(currentCategory)
print("✅ Lunar Hub v11.0 loaded! (" .. #Games .. " games)")

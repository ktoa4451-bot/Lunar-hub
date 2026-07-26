-- ============================================
-- 🌙 LUNAR HUB v30.0 (ULTIMATE EDITION)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "30.0"
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
-- ⚡ ИГРЫ (С ЧЁРНО-БЕЛЫМИ ИКОНКАМИ)
-- ============================================
local Games = {
    {name = "⚪ Forsaken", category = "PvP", link = "https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB"},
    {name = "⚪ MM2", category = "PvP", link = "https://raw.githubusercontent.com/pruzgar242-rgb/Update/refs/heads/main/out.lua%20(17).txt"},
    {name = "⚪ Rivals", category = "PvP", link = "https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"},
    {name = "⚪ Slap Battles", category = "PvP", link = "https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/File-Script/Slap_Battles.lua"},
    {name = "⚪ King Legacy", category = "Фарм", link = "https://pastefy.app/3xQp8vL9/raw"},
    {name = "⚪ 1+ Speed Keyboard", category = "Фарм", link = "https://raw.githubusercontent.com/Gerreiro68/ShizaHub/refs/heads/main/loader.lua"},
    {name = "⚪ Merge Nuke", category = "Фарм", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/MergeaNuke"},
    {name = "⚪ MorphUp", category = "Фарм", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/MorphUp"},
    {name = "⚪ 1 Magic Evolution", category = "Фарм", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/1MagicEvolution"},
    {name = "⚪ 99 Nights in Forest", category = "Эксплойты", link = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {name = "⚪ Survive Zombie Arena", category = "Эксплойты", link = "https://raw.githubusercontent.com/caomod2077/Script/main/Foxname_SZA.lua"},
    {name = "⚪ Color or Die", category = "Эксплойты", link = "https://rawscripts.net/raw/Color-or-Die-Esp-12555"},
    {name = "⚪ Rost Alpha Premium", category = "Эксплойты", link = "https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download"},
    {name = "⚪ Prison Life Premium", category = "Эксплойты", link = "https://rawscripts.net/raw/Prison-Life-Override-Hub-Silent-Aim-and-More-242218"},
}

-- ============================================
-- 🔧 НАСТРОЙКИ
-- ============================================
local Favorites = {}
local History = {}
local Settings = {
    Theme = "Dark",
    Sound = true,
    Animations = true,
    Notifications = true
}
local currentCategory = "Все игры"
local currentSort = "По умолчанию"

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
            return true
        else
            return false
        end
    else
        return false
    end
end

-- ============================================
-- 🔧 GUI
-- ============================================
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui

-- ============================================
-- 🎬 ЭКРАН ЗАГРУЗКИ
-- ============================================
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 350, 0, 200)
loadingFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
loadingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
loadingFrame.BackgroundTransparency = 0
loadingFrame.BorderSizePixel = 0
loadingFrame.ClipsDescendants = true
loadingFrame.Parent = screen

local loadingCorner = Instance.new("UICorner")
loadingCorner.CornerRadius = UDim.new(0, 16)
loadingCorner.Parent = loadingFrame

local loadingTitle = Instance.new("TextLabel")
loadingTitle.Size = UDim2.new(1, 0, 0, 50)
loadingTitle.Position = UDim2.new(0, 0, 0, 15)
loadingTitle.Text = "🌙 LUNAR HUB"
loadingTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
loadingTitle.TextSize = 28
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.BackgroundTransparency = 1
loadingTitle.Parent = loadingFrame

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0, 75)
loadingText.Text = "⏳ Загрузка... 0%"
loadingText.TextColor3 = Color3.fromRGB(200, 200, 255)
loadingText.TextSize = 16
loadingText.Font = Enum.Font.GothamBold
loadingText.BackgroundTransparency = 1
loadingText.Parent = loadingFrame

local loadingBarBg = Instance.new("Frame")
loadingBarBg.Size = UDim2.new(0.8, 0, 0, 8)
loadingBarBg.Position = UDim2.new(0.1, 0, 0, 120)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
loadingBarBg.BorderSizePixel = 0
loadingBarBg.Parent = loadingFrame

local loadingBarCorner = Instance.new("UICorner")
loadingBarCorner.CornerRadius = UDim.new(0, 4)
loadingBarCorner.Parent = loadingBarBg

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 0, 8)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarBg

local loadingBarCorner2 = Instance.new("UICorner")
loadingBarCorner2.CornerRadius = UDim.new(0, 4)
loadingBarCorner2.Parent = loadingBar

local function updateLoading(percent, text)
    loadingText.Text = "⏳ " .. text .. " " .. percent .. "%"
    loadingBar.Size = UDim2.new(percent / 100, 0, 0, 8)
end

-- ============================================
-- 🖼️ ОСНОВНОЕ ОКНО
-- ============================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 700, 0, 500)
frame.Position = UDim2.new(0.5, -350, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 30)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen
frame.Visible = false

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- ============================================
-- 🔧 ЗАГОЛОВОК
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(20, 15, 45)
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = frame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 250, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.Text = "🌙 LUNAR HUB"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- СЧЁТЧИКИ
local onlineLabel = Instance.new("TextLabel")
onlineLabel.Size = UDim2.new(0, 100, 1, 0)
onlineLabel.Position = UDim2.new(0, 250, 0, 0)
onlineLabel.Text = "🟢 0"
onlineLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
onlineLabel.TextSize = 14
onlineLabel.Font = Enum.Font.GothamBold
onlineLabel.BackgroundTransparency = 1
onlineLabel.TextXAlignment = Enum.TextXAlignment.Left
onlineLabel.Parent = header

local gameCountLabel = Instance.new("TextLabel")
gameCountLabel.Size = UDim2.new(0, 100, 1, 0)
gameCountLabel.Position = UDim2.new(0, 350, 0, 0)
gameCountLabel.Text = "🎮 0"
gameCountLabel.TextColor3 = Color3.fromRGB(150, 150, 200)
gameCountLabel.TextSize = 14
gameCountLabel.Font = Enum.Font.GothamBold
gameCountLabel.BackgroundTransparency = 1
gameCountLabel.TextXAlignment = Enum.TextXAlignment.Left
gameCountLabel.Parent = header

-- КНОПКА ЗАКРЫТИЯ
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -44, 0, 13)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.BackgroundTransparency = 1
close.Parent = header
close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ============================================
-- 📋 ПОИСК
-- ============================================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 300, 0, 32)
searchBox.Position = UDim2.new(0, 20, 0, 75)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
searchBox.BackgroundTransparency = 0.3
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "🔍 Поиск..."
searchBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 180)
searchBox.TextSize = 14
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClipsDescendants = true
searchBox.Parent = frame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBox

-- ============================================
-- 📂 КАТЕГОРИИ И СОРТИРОВКА
-- ============================================
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(0, 380, 0, 36)
topBar.Position = UDim2.new(0, 330, 0, 75)
topBar.BackgroundTransparency = 1
topBar.Parent = frame

local categoriesLayout = Instance.new("UIListLayout")
categoriesLayout.FillDirection = Enum.FillDirection.Horizontal
categoriesLayout.Padding = UDim.new(0, 8)
categoriesLayout.Parent = topBar

-- КНОПКИ КАТЕГОРИЙ
local categoryButtons = {}
local categories = {"Все", "PvP", "Фарм", "Эксплойты"}

for _, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 80, 1, 0)
    btn.Text = cat
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(80, 80, 120)
    btn.Parent = topBar
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        currentCategory = cat
        for _, b in pairs(categoryButtons) do
            b.BackgroundTransparency = 0.3
            b.BorderColor3 = Color3.fromRGB(80, 80, 120)
        end
        btn.BackgroundTransparency = 0
        btn.BorderColor3 = Color3.fromRGB(255, 215, 0)
        updateContent()
    end)
    categoryButtons[cat] = btn
end

if categoryButtons["Все"] then
    categoryButtons["Все"].BackgroundTransparency = 0
    categoryButtons["Все"].BorderColor3 = Color3.fromRGB(255, 215, 0)
end

-- КНОПКА ФИЛЬТР (СОРТИРОВКА)
local sortBtn = Instance.new("TextButton")
sortBtn.Size = UDim2.new(0, 60, 1, 0)
sortBtn.Text = "⇅"
sortBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
sortBtn.TextSize = 16
sortBtn.Font = Enum.Font.GothamBold
sortBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
sortBtn.BackgroundTransparency = 0.3
sortBtn.BorderSizePixel = 1
sortBtn.BorderColor3 = Color3.fromRGB(80, 80, 120)
sortBtn.Parent = topBar

local sortCorner = Instance.new("UICorner")
sortCorner.CornerRadius = UDim.new(0, 8)
sortCorner.Parent = sortBtn

local sortMenuOpen = false
local sortMenu = nil

sortBtn.MouseButton1Click:Connect(function()
    if sortMenuOpen then
        sortMenu:Destroy()
        sortMenuOpen = false
        return
    end
    
    sortMenuOpen = true
    sortMenu = Instance.new("Frame")
    sortMenu.Size = UDim2.new(0, 140, 0, 100)
    sortMenu.Position = UDim2.new(0, -80, 0, 40)
    sortMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
    sortMenu.BorderSizePixel = 1
    sortMenu.BorderColor3 = Color3.fromRGB(80, 80, 120)
    sortMenu.ClipsDescendants = true
    sortMenu.Parent = sortBtn
    
    local sortCorner2 = Instance.new("UICorner")
    sortCorner2.CornerRadius = UDim.new(0, 8)
    sortCorner2.Parent = sortMenu
    
    local sortOptions = {"По умолчанию", "По алфавиту", "По популярности"}
    local yPos = 5
    for _, option in ipairs(sortOptions) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, -10, 0, 28)
        optBtn.Position = UDim2.new(0, 5, 0, yPos)
        optBtn.Text = option
        optBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
        optBtn.TextSize = 13
        optBtn.Font = Enum.Font.GothamBold
        optBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        optBtn.BackgroundTransparency = 0.2
        optBtn.BorderSizePixel = 0
        optBtn.Parent = sortMenu
        
        local optCorner = Instance.new("UICorner")
        optCorner.CornerRadius = UDim.new(0, 6)
        optCorner.Parent = optBtn
        
        optBtn.MouseButton1Click:Connect(function()
            currentSort = option
            sortBtn.Text = "⇅ " .. option
            sortMenu:Destroy()
            sortMenuOpen = false
            updateContent()
        end)
        yPos = yPos + 30
    end
end)

-- ============================================
-- 📋 СПИСОК ИГР
-- ============================================
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -160)
list.Position = UDim2.new(0, 10, 0, 120)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 150)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 6)
listLayout.Parent = list

-- ============================================
-- 🔧 ЛОГИКА
-- ============================================
local function loadFavorites()
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(game:GetService("Players").LocalPlayer:GetAttribute("LunarFavorites") or "{}")
    end)
    if success and data then
        Favorites = data
    end
end

local function saveFavorites()
    pcall(function()
        game:GetService("Players").LocalPlayer:SetAttribute("LunarFavorites", game:GetService("HttpService"):JSONEncode(Favorites))
    end)
end

local function loadHistory()
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(game:GetService("Players").LocalPlayer:GetAttribute("LunarHistory") or "[]")
    end)
    if success and data then
        History = data
    end
end

local function saveHistory()
    pcall(function()
        game:GetService("Players").LocalPlayer:SetAttribute("LunarHistory", game:GetService("HttpService"):JSONEncode(History))
    end)
end

local function addHistory(gameName)
    table.insert(History, 1, gameName)
    if #History > 10 then table.remove(History) end
    saveHistory()
end

loadFavorites()
loadHistory()

local function toggleFavorite(gameName)
    if Favorites[gameName] then
        Favorites[gameName] = nil
    else
        Favorites[gameName] = true
    end
    saveFavorites()
    updateContent()
end

-- ============================================
-- 🎨 ОТРИСОВКА ИГР
-- ============================================
local function createGameButton(gameData, isFavorite, isHistory)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Text = gameData.name
    btn.TextColor3 = Color3.fromRGB(220, 220, 255)
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = isFavorite and Color3.fromRGB(40, 35, 70) or (isHistory and Color3.fromRGB(35, 30, 60) or Color3.fromRGB(20, 20, 50))
    btn.BackgroundTransparency = 0.1
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(60, 60, 90)
    btn.Parent = list
    btn.Name = gameData.name
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 15)
    padding.Parent = btn
    
    -- Категория
    local catLabel = Instance.new("TextLabel")
    catLabel.Size = UDim2.new(0, 80, 1, 0)
    catLabel.Position = UDim2.new(0, 120, 0, 0)
    catLabel.Text = gameData.category or ""
    catLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
    catLabel.TextSize = 11
    catLabel.Font = Enum.Font.Gotham
    catLabel.BackgroundTransparency = 1
    catLabel.Parent = btn
    
    -- Стрелка
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 25, 1, 0)
    arrow.Position = UDim2.new(1, -75, 0, 0)
    arrow.Text = "▶"
    arrow.TextColor3 = Color3.fromRGB(150, 150, 180)
    arrow.TextSize = 16
    arrow.BackgroundTransparency = 1
    arrow.Parent = btn
    
    -- Избранное
    local favBtn = Instance.new("TextButton")
    favBtn.Size = UDim2.new(0, 30, 1, 0)
    favBtn.Position = UDim2.new(1, -45, 0, 0)
    favBtn.Text = Favorites[gameData.name] and "⭐" or "☆"
    favBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    favBtn.TextSize = 18
    favBtn.BackgroundTransparency = 1
    favBtn.Parent = btn
    
    favBtn.MouseButton1Click:Connect(function()
        toggleFavorite(gameData.name)
        favBtn.Text = Favorites[gameData.name] and "⭐" or "☆"
    end)
    
    -- Hover
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(45, 35, 80)
        arrow.TextColor3 = Color3.fromRGB(255, 215, 0)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.1
        btn.BackgroundColor3 = isFavorite and Color3.fromRGB(40, 35, 70) or (isHistory and Color3.fromRGB(35, 30, 60) or Color3.fromRGB(20, 20, 50))
        arrow.TextColor3 = Color3.fromRGB(150, 150, 180)
    end)
    
    -- Клик
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳..."
        arrow.Text = "⏳"
        task.wait(0.15)
        
        local success = loadScript(gameData.link)
        addHistory(gameData.name)
        
        if success then
            btn.Text = "✅ " .. gameData.name
            btn.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
            arrow.Text = "✅"
        else
            btn.Text = "❌ " .. gameData.name
            btn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
            arrow.Text = "❌"
        end
        
        task.wait(1.5)
        btn.Text = gameData.name
        btn.BackgroundColor3 = isFavorite and Color3.fromRGB(40, 35, 70) or (isHistory and Color3.fromRGB(35, 30, 60) or Color3.fromRGB(20, 20, 50))
        arrow.Text = "▶"
        arrow.TextColor3 = Color3.fromRGB(150, 150, 180)
    end)
end

-- ============================================
-- 🔧 ОБНОВЛЕНИЕ КОНТЕНТА
-- ============================================
local function updateContent()
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local gamesToShow = {}
    local searchText = searchBox.Text:lower()
    
    -- Фильтр по категории
    for _, game in ipairs(Games) do
        if currentCategory == "Все" or game.category == currentCategory then
            table.insert(gamesToShow, game)
        end
    end
    
    -- Поиск
    if searchText ~= "" then
        local filtered = {}
        for _, game in ipairs(gamesToShow) do
            if string.find(string.lower(game.name), searchText) then
                table.insert(filtered, game)
            end
        end
        gamesToShow = filtered
    end
    
    -- Сортировка
    if currentSort == "По алфавиту" then
        table.sort(gamesToShow, function(a, b) return a.name < b.name end)
    elseif currentSort == "По популярности" then
        -- Простая имитация популярности (по избранным)
        table.sort(gamesToShow, function(a, b)
            local favA = Favorites[a.name] and 1 or 0
            local favB = Favorites[b.name] and 1 or 0
            if favA ~= favB then return favA > favB end
            return a.name < b.name
        end)
    end
    
    -- Избранные вверху
    table.sort(gamesToShow, function(a, b)
        local favA = Favorites[a.name] and 1 or 0
        local favB = Favorites[b.name] and 1 or 0
        if favA ~= favB then return favA > favB end
        return a.name < b.name
    end)
    
    -- История (недавние)
    local historyGames = {}
    for i, name in ipairs(History) do
        for _, game in ipairs(gamesToShow) do
            if game.name == name then
                table.insert(historyGames, game)
                break
            end
        end
    end
    
    -- Отрисовка
    local drawn = {}
    for _, game in ipairs(historyGames) do
        if not drawn[game.name] then
            createGameButton(game, Favorites[game.name], true)
            drawn[game.name] = true
        end
    end
    
    for _, game in ipairs(gamesToShow) do
        if not drawn[game.name] then
            createGameButton(game, Favorites[game.name], false)
            drawn[game.name] = true
        end
    end
    
    list.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 44 + 10)
    
    -- Обновление счётчиков
    gameCountLabel.Text = "🎮 " .. #Games
    onlineLabel.Text = "🟢 " .. #Players:GetPlayers()
end

-- ============================================
-- 🔍 ПОИСК
-- ============================================
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateContent()
end)

-- ============================================
-- ⌨️ ГОРЯЧАЯ КЛАВИША Ctrl+F
-- ============================================
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        searchBox:CaptureFocus()
    end
end)

-- ============================================
-- 🟢 ОБНОВЛЕНИЕ ОНЛАЙНА
-- ============================================
local function updateOnline()
    onlineLabel.Text = "🟢 " .. #Players:GetPlayers()
end

Players.PlayerAdded:Connect(updateOnline)
Players.PlayerRemoving:Connect(updateOnline)
updateOnline()

-- ============================================
-- 📢 ОКНО ОБНОВЛЕНИЙ
-- ============================================
local function showUpdateWindow()
    local updateFrame = Instance.new("Frame")
    updateFrame.Size = UDim2.new(0, 350, 0, 200)
    updateFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
    updateFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
    updateFrame.BackgroundTransparency = 0
    updateFrame.BorderSizePixel = 1
    updateFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    updateFrame.ClipsDescendants = true
    updateFrame.Parent = screen

    local updateCorner = Instance.new("UICorner")
    updateCorner.CornerRadius = UDim.new(0, 16)
    updateCorner.Parent = updateFrame

    local updateTitle = Instance.new("TextLabel")
    updateTitle.Size = UDim2.new(1, 0, 0, 45)
    updateTitle.Text = "📢 Обновления"
    updateTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    updateTitle.TextSize = 20
    updateTitle.Font = Enum.Font.GothamBold
    updateTitle.BackgroundTransparency = 1
    updateTitle.Parent = updateFrame

    local updateText = Instance.new("TextLabel")
    updateText.Size = UDim2.new(1, -20, 0, 90)
    updateText.Position = UDim2.new(0, 10, 0, 50)
    updateText.Text = "v30.0 — Ultimate Edition\n— Чёрно-белые иконки\n— Категории игр\n— История запусков\n— Сортировка\n— Избранное\n— ТГ: @lunarhub_script"
    updateText.TextColor3 = Color3.fromRGB(200, 200, 255)
    updateText.TextSize = 14
    updateText.Font = Enum.Font.Gotham
    updateText.BackgroundTransparency = 1
    updateText.TextWrapped = true
    updateText.Parent = updateFrame

    local closeUpdate = Instance.new("TextButton")
    closeUpdate.Size = UDim2.new(0, 30, 0, 30)
    closeUpdate.Position = UDim2.new(1, -35, 0, 5)
    closeUpdate.Text = "✕"
    closeUpdate.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeUpdate.TextSize = 18
    closeUpdate.Font = Enum.Font.GothamBold
    closeUpdate.BackgroundTransparency = 1
    closeUpdate.Parent = updateFrame
    closeUpdate.MouseButton1Click:Connect(function()
        updateFrame:Destroy()
    end)
end

-- Кнопка обновлений
local updateBtn = Instance.new("TextButton")
updateBtn.Size = UDim2.new(0, 120, 0, 36)
updateBtn.Position = UDim2.new(1, -140, 0, 75)
updateBtn.Text = "📢 Обновления"
updateBtn.TextColor3 = Color3.fromRGB(255, 200, 100)
updateBtn.TextSize = 13
updateBtn.Font = Enum.Font.GothamBold
updateBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
updateBtn.BackgroundTransparency = 0.3
updateBtn.BorderSizePixel = 0
updateBtn.Parent = frame

local updateBtnCorner = Instance.new("UICorner")
updateBtnCorner.CornerRadius = UDim.new(0, 8)
updateBtnCorner.Parent = updateBtn

updateBtn.MouseButton1Click:Connect(function()
    showUpdateWindow()
end)

-- ============================================
-- 🚀 ЗАПУСК
-- ============================================
local function finalStart()
    updateLoading(10, "Создание интерфейса")
    task.wait(0.2)
    
    updateLoading(30, "Загрузка игр")
    task.wait(0.2)
    
    updateLoading(50, "Настройка категорий")
    task.wait(0.2)
    
    updateLoading(70, "Создание кнопок")
    task.wait(0.2)
    
    frame.Visible = true
    task.wait(0.2)
    
    updateLoading(90, "Финальная настройка")
    task.wait(0.2)
    
    updateContent()
    task.wait(0.1)
    updateContent()
    
    updateLoading(100, "Готово!")
    task.wait(0.4)
    
    loadingFrame:Destroy()
    
    print("✅ Lunar Hub v30.0 loaded! (" .. #Games .. " games)")
    print("⭐ Избранное: " .. #Favorites)
    print("🟢 Online: " .. #Players:GetPlayers())
    print("📢 ТГ: @lunarhub_script")
end

task.wait(0.2)
finalStart()

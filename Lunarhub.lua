-- ============================================
-- 🌙 LUNAR HUB v25.1 (СТАБИЛЬНЫЙ ЗАПУСК)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "25.1"
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
-- ⚡ ИГРЫ
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
-- ⭐ ИЗБРАННОЕ (С СОХРАНЕНИЕМ)
-- ============================================
local Favorites = {}

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

loadFavorites()

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

local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui

-- ============================================
-- 🖼️ ОСНОВНОЕ ОКНО
-- ============================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 600, 0, 450)
frame.Position = UDim2.new(0.5, -300, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- ============================================
-- 🔧 ЗАГОЛОВОК
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(20, 15, 40)
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

local onlineLabel = Instance.new("TextLabel")
onlineLabel.Size = UDim2.new(0, 120, 1, 0)
onlineLabel.Position = UDim2.new(0, 270, 0, 0)
onlineLabel.Text = "🟢 Online: 0"
onlineLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
onlineLabel.TextSize = 14
onlineLabel.Font = Enum.Font.GothamBold
onlineLabel.BackgroundTransparency = 1
onlineLabel.TextXAlignment = Enum.TextXAlignment.Left
onlineLabel.Parent = header

local favLabel = Instance.new("TextLabel")
favLabel.Size = UDim2.new(0, 120, 1, 0)
favLabel.Position = UDim2.new(0, 390, 0, 0)
favLabel.Text = "⭐ Избранное: 0"
favLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
favLabel.TextSize = 14
favLabel.Font = Enum.Font.GothamBold
favLabel.BackgroundTransparency = 1
favLabel.TextXAlignment = Enum.TextXAlignment.Left
favLabel.Parent = header

-- ============================================
-- 🔧 КНОПКА ЗАКРЫТИЯ
-- ============================================
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(0.92, -12, 0, 13)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BackgroundTransparency = 0.2
close.BorderSizePixel = 0
close.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ============================================
-- 📋 ПОИСК
-- ============================================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -40, 0, 32)
searchBox.Position = UDim2.new(0, 20, 0, 75)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
searchBox.BackgroundTransparency = 0.3
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "🔍 Search game..."
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
-- 📢 КНОПКА ОБНОВЛЕНИЙ
-- ============================================
local updateBtn = Instance.new("TextButton")
updateBtn.Size = UDim2.new(0, 120, 0, 36)
updateBtn.Position = UDim2.new(0, 20, 0, 120)
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

local updateOpen = false
local updateFrame = nil

updateBtn.MouseButton1Click:Connect(function()
    if updateOpen then
        updateFrame:Destroy()
        updateOpen = false
        return
    end
    
    updateOpen = true
    updateFrame = Instance.new("Frame")
    updateFrame.Size = UDim2.new(0, 300, 0, 150)
    updateFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
    updateFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    updateFrame.BackgroundTransparency = 0.15
    updateFrame.BorderSizePixel = 0
    updateFrame.ClipsDescendants = true
    updateFrame.Parent = screen
    
    local updateCorner = Instance.new("UICorner")
    updateCorner.CornerRadius = UDim.new(0, 12)
    updateCorner.Parent = updateFrame
    
    local updateTitle = Instance.new("TextLabel")
    updateTitle.Size = UDim2.new(1, 0, 0, 40)
    updateTitle.Text = "📢 Обновления"
    updateTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    updateTitle.TextScaled = true
    updateTitle.Font = Enum.Font.GothamBold
    updateTitle.BackgroundTransparency = 1
    updateTitle.Parent = updateFrame
    
    local updateText = Instance.new("TextLabel")
    updateText.Size = UDim2.new(1, -20, 0, 80)
    updateText.Position = UDim2.new(0, 10, 0, 45)
    updateText.Text = "v25.1 — Стабильный запуск\n— Избранное вверху\n— Онлайн-счётчик"
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
        updateOpen = false
    end)
end)

-- ============================================
-- 📋 СПИСОК ИГР
-- ============================================
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(0, 430, 0, 300)
contentFrame.Position = UDim2.new(0, 155, 0, 120)
contentFrame.BackgroundTransparency = 1
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
contentFrame.ScrollBarThickness = 6
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 50, 200)
contentFrame.Parent = frame

local contentLayout = Instance.new("UIListLayout")
contentLayout.SortOrder = Enum.SortOrder.Name
contentLayout.Padding = UDim.new(0, 6)
contentLayout.Parent = contentFrame

-- ============================================
-- ⭐ ИЗБРАННОЕ
-- ============================================
local function toggleFavorite(gameName)
    if Favorites[gameName] then
        Favorites[gameName] = nil
    else
        Favorites[gameName] = true
    end
    saveFavorites()
    updateStats()
    updateContent()
end

local function updateStats()
    local favCount = 0
    for _ in pairs(Favorites) do
        favCount = favCount + 1
    end
    favLabel.Text = "⭐ Избранное: " .. favCount
    local online = #Players:GetPlayers()
    onlineLabel.Text = "🟢 Online: " .. online
end

-- ============================================
-- 🎨 КНОПКИ ИГР
-- ============================================
local function createGameButton(gameData, isFavorite)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Text = gameData.name
    btn.TextColor3 = Color3.fromRGB(230, 230, 255)
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = isFavorite and Color3.fromRGB(40, 30, 80) or Color3.fromRGB(20, 20, 50)
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 0
    btn.Parent = contentFrame
    btn.Name = gameData.name
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 15)
    padding.Parent = btn
    
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 30, 1, 0)
    arrow.Position = UDim2.new(1, -40, 0, 0)
    arrow.Text = "▶"
    arrow.TextColor3 = Color3.fromRGB(150, 100, 200)
    arrow.TextSize = 18
    arrow.BackgroundTransparency = 1
    arrow.Parent = btn
    
    local favBtn = Instance.new("TextButton")
    favBtn.Size = UDim2.new(0, 30, 1, 0)
    favBtn.Position = UDim2.new(1, -75, 0, 0)
    favBtn.Text = Favorites[gameData.name] and "⭐" or "☆"
    favBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    favBtn.TextSize = 18
    favBtn.BackgroundTransparency = 1
    favBtn.Parent = btn
    
    favBtn.MouseButton1Click:Connect(function()
        toggleFavorite(gameData.name)
        favBtn.Text = Favorites[gameData.name] and "⭐" or "☆"
    end)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(40, 30, 80)
        arrow.TextColor3 = Color3.fromRGB(255, 215, 0)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.2
        btn.BackgroundColor3 = isFavorite and Color3.fromRGB(40, 30, 80) or Color3.fromRGB(20, 20, 50)
        arrow.TextColor3 = Color3.fromRGB(150, 100, 200)
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳..."
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 30)
        arrow.Text = "⏳"
        task.wait(0.15)
        
        local success, msg = loadScript(gameData.link)
        
        if success then
            btn.Text = "✅ " .. gameData.name
            btn.BackgroundColor3 = Color3.fromRGB(30, 50, 30)
            arrow.Text = "✅"
        else
            btn.Text = "❌ " .. gameData.name
            btn.BackgroundColor3 = Color3.fromRGB(50, 30, 30)
            arrow.Text = "❌"
            warn("Error: " .. msg)
        end
        
        task.wait(1.5)
        btn.Text = gameData.name
        btn.BackgroundColor3 = isFavorite and Color3.fromRGB(40, 30, 80) or Color3.fromRGB(20, 20, 50)
        arrow.Text = "▶"
        arrow.TextColor3 = Color3.fromRGB(150, 100, 200)
    end)
end

-- ============================================
-- 🔧 ОБНОВЛЕНИЕ КОНТЕНТА
-- ============================================
local function updateContent()
    for _, child in ipairs(contentFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local gamesToShow = {}
    local searchText = searchBox.Text:lower()
    
    for _, game in ipairs(Games) do
        table.insert(gamesToShow, game)
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
    
    -- СОРТИРОВКА: ИЗБРАННЫЕ ВВЕРХУ
    table.sort(gamesToShow, function(a, b)
        local favA = Favorites[a.name] and 1 or 0
        local favB = Favorites[b.name] and 1 or 0
        if favA ~= favB then
            return favA > favB
        end
        return a.name < b.name
    end)
    
    for _, game in ipairs(gamesToShow) do
        local isFavorite = Favorites[game.name] and true or false
        createGameButton(game, isFavorite)
    end
    
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 44 + 10)
    updateStats()
end

-- ============================================
-- 🔧 ПОИСК
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
    local count = #Players:GetPlayers()
    onlineLabel.Text = "🟢 Online: " .. count
end

Players.PlayerAdded:Connect(updateOnline)
Players.PlayerRemoving:Connect(updateOnline)
updateOnline()

-- ============================================
-- ⚡ ЗАПУСК (ПРОСТОЙ И НАДЁЖНЫЙ)
-- ============================================
updateContent()

print("✅ LUNAR HUB loaded! (" .. #Games .. " games)")
print("⭐ Избранное: " .. #Favorites)
print("🟢 Online: " .. #Players:GetPlayers())

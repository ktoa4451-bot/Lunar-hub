-- ============================================
-- 🌙 LUNAR HUB v13.2 (ФИНАЛЬНЫЙ ФИКС)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "13.2"
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
local currentCategory = "Все игры"

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
            return true, "✅ Success"
        else
            return false, "Execute error: " .. tostring(execErr)
        end
    else
        return false, "Load error: " .. tostring(result)
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
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ============================================
-- 🎬 ЭКРАН ЗАГРУЗКИ
-- ============================================
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 320, 0, 140)
loadingFrame.Position = UDim2.new(0.5, -160, 0.5, -70)
loadingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
loadingFrame.BackgroundTransparency = 0
loadingFrame.BorderSizePixel = 0
loadingFrame.ClipsDescendants = true
loadingFrame.Parent = screen

local loadingCorner = Instance.new("UICorner")
loadingCorner.CornerRadius = UDim.new(0, 16)
loadingCorner.Parent = loadingFrame

local loadingTitle = Instance.new("TextLabel")
loadingTitle.Size = UDim2.new(1, 0, 0, 40)
loadingTitle.Position = UDim2.new(0, 0, 0, 10)
loadingTitle.Text = "🌙 LUNAR HUB"
loadingTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
loadingTitle.TextSize = 24
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.BackgroundTransparency = 1
loadingTitle.Parent = loadingFrame

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0, 55)
loadingText.Text = "⏳ Загрузка... 0%"
loadingText.TextColor3 = Color3.fromRGB(200, 200, 255)
loadingText.TextSize = 16
loadingText.Font = Enum.Font.GothamBold
loadingText.BackgroundTransparency = 1
loadingText.Parent = loadingFrame

local loadingBarBg = Instance.new("Frame")
loadingBarBg.Size = UDim2.new(0.9, 0, 0, 6)
loadingBarBg.Position = UDim2.new(0.05, 0, 0, 100)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
loadingBarBg.BorderSizePixel = 0
loadingBarBg.Parent = loadingFrame

local loadingBarCorner = Instance.new("UICorner")
loadingBarCorner.CornerRadius = UDim.new(0, 3)
loadingBarCorner.Parent = loadingBarBg

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 0, 6)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarBg

local loadingBarCorner2 = Instance.new("UICorner")
loadingBarCorner2.CornerRadius = UDim.new(0, 3)
loadingBarCorner2.Parent = loadingBar

local function updateLoading(percent, text)
    loadingText.Text = "⏳ " .. text .. " " .. percent .. "%"
    loadingBar.Size = UDim2.new(percent / 100, 0, 0, 6)
end

-- ============================================
-- 🖼️ ОСНОВНОЕ ОКНО
-- ============================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 550, 0, 470)
frame.Position = UDim2.new(0.5, -275, 0.5, -235)
frame.BackgroundColor3 = Color3.fromRGB(8, 8, 25)
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

-- НЕОНОВАЯ РАМКА
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 6, 1, 6)
glow.Position = UDim2.new(0, -3, 0, -3)
glow.BackgroundColor3 = Color3.fromRGB(180, 50, 220)
glow.BackgroundTransparency = 0.15
glow.BorderSizePixel = 0
glow.Parent = frame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 20)
glowCorner.Parent = glow

-- ============================================
-- 🔹 ЗАГОЛОВОК
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(20, 15, 45)
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = frame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 280, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.Text = "🌙 LUNAR HUB v13.2"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local favCountLabel = Instance.new("TextLabel")
favCountLabel.Size = UDim2.new(0, 150, 1, 0)
favCountLabel.Position = UDim2.new(1, -160, 0, 0)
favCountLabel.Text = "⭐ 0"
favCountLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
favCountLabel.TextSize = 15
favCountLabel.Font = Enum.Font.GothamBold
favCountLabel.BackgroundTransparency = 1
favCountLabel.TextXAlignment = Enum.TextXAlignment.Right
favCountLabel.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -40, 0, 10)
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

close.MouseEnter:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.15), {BackgroundTransparency = 0, TextColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)
close.MouseLeave:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.15), {BackgroundTransparency = 0.2, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ============================================
-- 🔍 ПОИСК
-- ============================================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 300, 0, 32)
searchBox.Position = UDim2.new(0, 20, 0, 68)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 25, 60)
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

-- ГОРЯЧАЯ КЛАВИША Ctrl+F
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        searchBox:CaptureFocus()
    end
end)

-- ============================================
-- 📂 КАТЕГОРИИ (С ПРИНУДИТЕЛЬНЫМ ОБНОВЛЕНИЕМ)
-- ============================================
local categoriesFrame = Instance.new("Frame")
categoriesFrame.Size = UDim2.new(0, 110, 0, 300)
categoriesFrame.Position = UDim2.new(0, 20, 0, 115)
categoriesFrame.BackgroundTransparency = 1
categoriesFrame.Parent = frame

local categoriesLayout = Instance.new("UIListLayout")
categoriesLayout.FillDirection = Enum.FillDirection.Vertical
categoriesLayout.Padding = UDim.new(0, 8)
categoriesLayout.Parent = categoriesFrame

local categories = {"Все игры", "⭐ Избранное"}
local categoryButtons = {}

for _, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.Text = cat
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(30, 25, 60)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(100, 50, 200)
    btn.Parent = categoriesFrame
    btn.Name = cat
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        if currentCategory ~= cat then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(50, 35, 100)}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if currentCategory ~= cat then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.3, BackgroundColor3 = Color3.fromRGB(30, 25, 60)}):Play()
        end
    end)
    
    btn.MouseButton1Click:Connect(function()
        currentCategory = cat
        for _, b in ipairs(categoriesFrame:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundTransparency = 0.3
                b.BorderColor3 = Color3.fromRGB(100, 50, 200)
            end
        end
        btn.BackgroundTransparency = 0
        btn.BorderColor3 = Color3.fromRGB(255, 215, 0)
        
        -- ============================================
        -- 🔥 ГЛАВНЫЙ ФИКС: ПРИНУДИТЕЛЬНОЕ ОБНОВЛЕНИЕ
        -- ============================================
        -- Очищаем список
        for _, child in ipairs(list:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Пересоздаём кнопки с задержкой
        task.wait(0.05)
        renderGames(cat)
        updateFavCount()
        -- ============================================
    end)
    categoryButtons[cat] = btn
end

if categoryButtons["Все игры"] then
    categoryButtons["Все игры"].BackgroundTransparency = 0
    categoryButtons["Все игры"].BorderColor3 = Color3.fromRGB(255, 215, 0)
end

-- ============================================
-- 📋 СПИСОК ИГР
-- ============================================
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(0, 380, 0, 300)
list.Position = UDim2.new(0, 145, 0, 115)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = Color3.fromRGB(150, 50, 200)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 5)
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
    saveFavorites()
    updateFavCount()
    if currentCategory == "⭐ Избранное" then
        renderGames("⭐ Избранное")
    else
        renderGames(currentCategory)
    end
end

-- ============================================
-- 🎨 ОТРИСОВКА ИГР (ОСНОВНАЯ ФУНКЦИЯ)
-- ============================================
local function renderGames(category)
    -- Очищаем список
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    local gamesToShow = {}
    local searchText = searchBox.Text:lower()
    
    if category == "⭐ Избранное" then
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
        btn.Size = UDim2.new(1, 0, 0, 38)
        btn.Text = game.name
        btn.TextColor3 = Color3.fromRGB(230, 230, 255)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Font = Enum.Font.GothamBold
        btn.BackgroundColor3 = Color3.fromRGB(20, 18, 50)
        btn.BackgroundTransparency = 0.2
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Color3.fromRGB(60, 40, 150)
        btn.Parent = list
        btn.Name = game.name
        
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
        favBtn.Text = Favorites[game.name] and "⭐" or "☆"
        favBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
        favBtn.TextSize = 18
        favBtn.BackgroundTransparency = 1
        favBtn.Parent = btn
        
        favBtn.MouseButton1Click:Connect(function()
            toggleFavorite(game.name)
            favBtn.Text = Favorites[game.name] and "⭐" or "☆"
        end)
        
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(45, 30, 90)}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 215, 0)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.2, BackgroundColor3 = Color3.fromRGB(20, 18, 50)}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(150, 100, 200)}):Play()
        end)
        
        btn.MouseButton1Click:Connect(function()
            btn.Text = "⏳..."
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 30)
            arrow.Text = "⏳"
            task.wait(0.15)
            
            local success, msg = loadScript(game.link)
            
            if success then
                btn.Text = "✅ " .. game.name
                btn.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
                arrow.Text = "✅"
            else
                btn.Text = "❌ " .. game.name
                btn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
                arrow.Text = "❌"
            end
            
            task.wait(1.5)
            btn.Text = game.name
            btn.BackgroundColor3 = Color3.fromRGB(20, 18, 50)
            arrow.Text = "▶"
        end)
    end
    
    list.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 43 + 10)
end

-- ============================================
-- 🔍 ПОИСК
-- ============================================
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    renderGames(currentCategory)
end)

-- ============================================
-- 🚀 ЗАПУСК
-- ============================================
local function finalStart()
    updateLoading(10, "Создание интерфейса")
    task.wait(0.1)
    
    updateLoading(30, "Загрузка игр")
    task.wait(0.1)
    
    updateLoading(50, "Настройка категорий")
    task.wait(0.1)
    
    updateLoading(70, "Создание кнопок")
    task.wait(0.1)
    
    frame.Visible = true
    task.wait(0.15)
    
    updateLoading(90, "Финальная настройка")
    task.wait(0.1)
    
    -- Принудительный запуск
    task.wait(0.2)
    renderGames(currentCategory)
    updateFavCount()
    
    updateLoading(100, "Готово!")
    task.wait(0.3)
    
    loadingFrame:Destroy()
    
    print("✅ Lunar Hub v13.2 loaded! (" .. #Games .. " games)")
    print("💾 Избранное сохраняется!")
    print("⌨️ Горячая клавиша: Ctrl+F")
    print("🔥 Финальный фикс категорий активирован!")
end

task.wait(0.1)
finalStart()

-- ============================================
-- 🔄 STEPPED-ФИКС
-- ============================================
local connection
connection = game:GetService("RunService").Stepped:Connect(function()
    if not loadingFrame.Parent then
        connection:Disconnect()
        return
    end
    
    local hasButtons = false
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then
            hasButtons = true
            break
        end
    end
    
    if not hasButtons and frame.Visible then
        print("🔄 Принудительное обновление через Stepped")
        renderGames(currentCategory)
        updateFavCount()
    end
end)

-- ============================================
-- 🔧 ДОПОЛНИТЕЛЬНЫЕ ТАЙМЕРЫ
-- ============================================
task.wait(1)
if #list:GetChildren() == 0 then
    print("🔄 Таймер 1: Принудительное обновление")
    renderGames(currentCategory)
    updateFavCount()
end

task.wait(2)
if #list:GetChildren() == 0 then
    print("🔄 Таймер 2: Аварийное обновление")
    renderGames(currentCategory)
    updateFavCount()
end

task.wait(3)
if #list:GetChildren() == 0 then
    print("🔄 Таймер 3: Экстренное обновление")
    renderGames(currentCategory)
    updateFavCount()
end

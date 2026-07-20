-- ============================================
-- 🌙 LUNAR HUB v20.0 (СТИЛЬ FOXNAME)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "20.0"
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
-- 🔧 GUI (СТИЛЬ FOXNAME)
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
-- 🖼️ ОСНОВНОЕ ОКНО
-- ============================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 450)
frame.Position = UDim2.new(0.5, -250, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(8, 8, 20)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- ============================================
-- 🔹 ЗАГОЛОВОК
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(20, 15, 45)
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = frame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 280, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "🌙 LUNAR HUB v20.0"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -40, 0, 10)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.BackgroundTransparency = 1
close.Parent = header
close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ============================================
-- 🔍 ПОИСК (В СТИЛЕ FOXNAME)
-- ============================================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 280, 0, 30)
searchBox.Position = UDim2.new(0, 15, 0, 60)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 25, 60)
searchBox.BackgroundTransparency = 0.2
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "🔍 Поиск..."
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 140, 200)
searchBox.TextSize = 13
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClipsDescendants = true
searchBox.Parent = frame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBox

-- ============================================
-- 📂 КАТЕГОРИИ (ВЕРТИКАЛЬНЫЕ, СТИЛЬ FOXNAME)
-- ============================================
local categoriesFrame = Instance.new("Frame")
categoriesFrame.Size = UDim2.new(0, 110, 0, 320)
categoriesFrame.Position = UDim2.new(0, 15, 0, 100)
categoriesFrame.BackgroundTransparency = 1
categoriesFrame.Parent = frame

local categoriesLayout = Instance.new("UIListLayout")
categoriesLayout.FillDirection = Enum.FillDirection.Vertical
categoriesLayout.Padding = UDim.new(0, 6)
categoriesLayout.Parent = categoriesFrame

-- ============================================
-- 📋 СПИСОК ИГР (В СТИЛЕ FOXNAME)
-- ============================================
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(0, 340, 0, 320)
list.Position = UDim2.new(0, 135, 0, 100)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = Color3.fromRGB(150, 100, 200)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 6)
listLayout.Parent = list

-- ============================================
-- ⭐ КАТЕГОРИИ И ЛОГИКА
-- ============================================
local currentCategory = "Игры"
local categoryButtons = {}

-- ============================================
-- 🔧 ФУНКЦИЯ ОТРИСОВКИ ИГР
-- ============================================
local function updateContent(category)
    for _, child in ipairs(list:GetChildren()) do
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
    
    table.sort(gamesToShow, function(a, b) return a.name < b.name end)
    
    for _, game in ipairs(gamesToShow) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 34)
        btn.Text = game.name
        btn.TextColor3 = Color3.fromRGB(220, 220, 255)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Font = Enum.Font.GothamBold
        btn.BackgroundColor3 = Color3.fromRGB(25, 22, 55)
        btn.BackgroundTransparency = 0.1
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Color3.fromRGB(80, 60, 180)
        btn.Parent = list
        btn.Name = game.name
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        
        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 12)
        padding.Parent = btn
        
        -- СТРЕЛКА
        local arrow = Instance.new("TextLabel")
        arrow.Size = UDim2.new(0, 25, 1, 0)
        arrow.Position = UDim2.new(1, -35, 0, 0)
        arrow.Text = "▶"
        arrow.TextColor3 = Color3.fromRGB(150, 100, 200)
        arrow.TextSize = 16
        arrow.BackgroundTransparency = 1
        arrow.Parent = btn
        
        -- АНИМАЦИИ (ЛЁГКИЕ)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(45, 35, 90)}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 215, 0)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.1, BackgroundColor3 = Color3.fromRGB(25, 22, 55)}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(150, 100, 200)}):Play()
        end)
        
        btn.MouseButton1Click:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 32)}):Play()
            task.wait(0.1)
            TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 34)}):Play()
            
            btn.Text = "⏳..."
            arrow.Text = "⏳"
            task.wait(0.15)
            
            local success = loadScript(game.link)
            
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
            btn.BackgroundColor3 = Color3.fromRGB(25, 22, 55)
            arrow.Text = "▶"
        end)
    end
    
    list.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 40 + 10)
end

-- ============================================
-- 🔧 СОЗДАНИЕ КНОПОК КАТЕГОРИЙ (СТИЛЬ FOXNAME)
-- ============================================
local categories = {"Игры", "Обновления"}

for _, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.Text = cat
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(25, 22, 55)
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 0
    btn.Parent = categoriesFrame
    btn.Name = cat
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        if currentCategory ~= cat then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(45, 35, 90)}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if currentCategory ~= cat then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.2, BackgroundColor3 = Color3.fromRGB(25, 22, 55)}):Play()
        end
    end)
    
    btn.MouseButton1Click:Connect(function()
        currentCategory = cat
        for _, b in ipairs(categoriesFrame:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundTransparency = 0.2
                b.BackgroundColor3 = Color3.fromRGB(25, 22, 55)
            end
        end
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(60, 40, 150)
        
        if cat == "Обновления" then
            showUpdateWindow()
        else
            updateContent(cat)
        end
    end)
    categoryButtons[cat] = btn
end

if categoryButtons["Игры"] then
    categoryButtons["Игры"].BackgroundTransparency = 0
    categoryButtons["Игры"].BackgroundColor3 = Color3.fromRGB(60, 40, 150)
end

-- ============================================
-- 📢 ОКНО ОБНОВЛЕНИЙ
-- ============================================
local function showUpdateWindow()
    local updateFrame = Instance.new("Frame")
    updateFrame.Size = UDim2.new(0, 320, 0, 160)
    updateFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
    updateFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
    updateFrame.BackgroundTransparency = 0
    updateFrame.BorderSizePixel = 1
    updateFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    updateFrame.ClipsDescendants = true
    updateFrame.Parent = screen
    
    local updateCorner = Instance.new("UICorner")
    updateCorner.CornerRadius = UDim.new(0, 12)
    updateCorner.Parent = updateFrame
    
    local updateTitle = Instance.new("TextLabel")
    updateTitle.Size = UDim2.new(1, 0, 0, 40)
    updateTitle.Text = "📢 Обновления"
    updateTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    updateTitle.TextSize = 20
    updateTitle.Font = Enum.Font.GothamBold
    updateTitle.BackgroundTransparency = 1
    updateTitle.Parent = updateFrame
    
    local updateText = Instance.new("TextLabel")
    updateText.Size = UDim2.new(1, -20, 0, 80)
    updateText.Position = UDim2.new(0, 10, 0, 45)
    updateText.Text = "v20.0 — Стиль Foxname\n— Красивые анимации\n— Горячая клавиша Ctrl+F\n— Чистый дизайн"
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

-- ============================================
-- 🔍 ПОИСК
-- ============================================
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateContent(currentCategory)
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
-- ⚡ ЗАПУСК
-- ============================================
updateContent("Игры")

-- ПРИНУДИТЕЛЬНЫЙ ЗАПУСК (СЕКРЕТНЫЙ ФИКС)
task.wait(0.2)
searchBox.Text = ""
searchBox:GetPropertyChangedSignal("Text"):Fire()

print("✅ Lunar Hub v20.0 loaded! (" .. #Games .. " games)")
print("🎨 Стиль Foxname активирован!")
print("⌨️ Горячая клавиша: Ctrl+F")

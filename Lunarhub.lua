-- ============================================
-- 🌙 LUNAR HUB v17.0 (ФИНАЛЬНЫЙ)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "17.0"
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

-- Градиент на загрузке
local loadingGradient = Instance.new("UIGradient")
loadingGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 5, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 10, 50))
})
loadingGradient.Parent = loadingFrame

-- Стекло на загрузке
local loadingGlass = Instance.new("Frame")
loadingGlass.Size = UDim2.new(1, 0, 1, 0)
loadingGlass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingGlass.BackgroundTransparency = 0.05
loadingGlass.BorderSizePixel = 0
loadingGlass.Parent = loadingFrame

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
loadingBar.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
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
-- 🖼️ ОСНОВНОЕ ОКНО (БЕЗ НЕОНА)
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

-- Градиентный фон
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 5, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 10, 50))
})
gradient.Parent = frame

-- Стекло (Glassmorphism)
local glass = Instance.new("Frame")
glass.Size = UDim2.new(1, 0, 1, 0)
glass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glass.BackgroundTransparency = 0.05
glass.BorderSizePixel = 0
glass.Parent = frame

-- ============================================
-- 🔹 ЗАГОЛОВОК
-- ============================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(20, 15, 45)
header.BackgroundTransparency = 0.3
header.BorderSizePixel = 0
header.Parent = frame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 280, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.Text = "🌙 LUNAR HUB v17.0"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Пульсация заголовка
local titlePulse = TweenService:Create(
    title,
    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {TextTransparency = 0.1}
)
titlePulse:Play()

-- КНОПКА ЗАКРЫТИЯ
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
-- 📂 КАТЕГОРИИ (ВЕРТИКАЛЬНЫЕ)
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

local categories = {"🎮 Игры", "📢 Обновления"}
local currentCategory = "🎮 Игры"
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
        
        if cat == "📢 Обновления" then
            showUpdateWindow()
        else
            updateContent(cat)
        end
    end)
    categoryButtons[cat] = btn
end

if categoryButtons["🎮 Игры"] then
    categoryButtons["🎮 Игры"].BackgroundTransparency = 0
    categoryButtons["🎮 Игры"].BorderColor3 = Color3.fromRGB(255, 215, 0)
end

-- ============================================
-- 📢 ОКНО ОБНОВЛЕНИЙ
-- ============================================
local function showUpdateWindow()
    local updateFrame = Instance.new("Frame")
    updateFrame.Size = UDim2.new(0, 350, 0, 180)
    updateFrame.Position = UDim2.new(0.5, -175, 0.5, -90)
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
    updateText.Text = "v17.0 — Финальная версия\n— Красивый градиентный фон\n— Стеклянный эффект\n— Горячая клавиша Ctrl+F"
    updateText.TextColor3 = Color3.fromRGB(200, 200, 255)
    updateText.TextSize = 14
    updateText.Font = Enum.Font.Gotham
    updateText.BackgroundTransparency = 1
    updateText.TextWrapped = true
    updateText.Parent = updateFrame

    local closeUpdate = Instance.new("TextButton")
    closeUpdate.Size = UDim2.new(0, 34, 0, 34)
    closeUpdate.Position = UDim2.new(1, -10, 0, 5)
    closeUpdate.Text = "✕"
    closeUpdate.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeUpdate.TextSize = 18
    closeUpdate.Font = Enum.Font.GothamBold
    closeUpdate.BackgroundTransparency = 1
    closeUpdate.Parent = updateFrame
    closeUpdate.MouseButton1Click:Connect(function()
        updateFrame:Destroy()
        switchCategory("🎮 Игры")
    end)
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
-- 🎨 ОТРИСОВКА ИГР
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
    updateContent(currentCategory)
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
    
    -- 🔥 СЕКРЕТНЫЙ ФИКС
    task.wait(0.2)
    searchBox.Text = ""
    searchBox:GetPropertyChangedSignal("Text"):Fire()
    
    updateContent(currentCategory)
    
    updateLoading(100, "Готово!")
    task.wait(0.3)
    
    loadingFrame:Destroy()
    
    print("✅ Lunar Hub v17.0 loaded! (" .. #Games .. " games)")
    print("⌨️ Горячая клавиша: Ctrl+F")
    print("🎨 Финальная версия активирована!")
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
        searchBox.Text = ""
        searchBox:GetPropertyChangedSignal("Text"):Fire()
        updateContent(currentCategory)
    end
end)

-- ============================================
-- 🔧 ДОПОЛНИТЕЛЬНЫЕ ТАЙМЕРЫ
-- ============================================
task.wait(1)
if #list:GetChildren() == 0 then
    print("🔄 Таймер 1: Принудительное обновление")
    searchBox.Text = ""
    searchBox:GetPropertyChangedSignal("Text"):Fire()
    updateContent(currentCategory)
end

task.wait(2)
if #list:GetChildren() == 0 then
    print("🔄 Таймер 2: Аварийное обновление")
    searchBox.Text = ""
    searchBox:GetPropertyChangedSignal("Text"):Fire()
    updateContent(currentCategory)
end

task.wait(3)
if #list:GetChildren() == 0 then
    print("🔄 Таймер 3: Экстренное обновление")
    searchBox.Text = ""
    searchBox:GetPropertyChangedSignal("Text"):Fire()
    updateContent(currentCategory)
end

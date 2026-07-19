-- ============================================
-- 🌙 LUNAR HUB v9.7 (КРАСИВЫЙ ДИЗАЙН)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "9.7"
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
    {name = "Forsaken", link = "https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB"},
    {name = "MM2", link = "https://raw.githubusercontent.com/pruzgar242-rgb/Update/refs/heads/main/out.lua%20(17).txt"},
    {name = "Rivals", link = "https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"},
    {name = "Slap Battles", link = "https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/File-Script/Slap_Battles.lua"},
    {name = "King Legacy", link = "https://pastefy.app/3xQp8vL9/raw"},
    {name = "1+ Speed Keyboard", link = "https://raw.githubusercontent.com/Gerreiro68/ShizaHub/refs/heads/main/loader.lua"},
    {name = "Merge Nuke", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/MergeaNuke"},
    {name = "MorphUp", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/MorphUp"},
    {name = "1 Magic Evolution", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/1MagicEvolution"},
    {name = "99 Nights in Forest", link = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {name = "Survive Zombie Arena", link = "https://raw.githubusercontent.com/caomod2077/Script/main/Foxname_SZA.lua"},
    {name = "Color or Die", link = "https://rawscripts.net/raw/Color-or-Die-Esp-12555"},
    {name = "Rost Alpha Premium", link = "https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download"},
    {name = "Prison Life Premium", link = "https://rawscripts.net/raw/Prison-Life-Override-Hub-Silent-Aim-and-More-242218"},
}

-- ============================================
-- ⚙️ НАСТРОЙКИ
-- ============================================
local Favorites = {}

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

local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ============================================
-- 🌙 ПРИВЕТСТВЕННЫЙ ЭКРАН
-- ============================================
local splash = Instance.new("Frame")
splash.Size = UDim2.new(0, 550, 0, 480)
splash.Position = UDim2.new(0.5, -275, 0.5, -240)
splash.BackgroundColor3 = Color3.fromRGB(8, 8, 20)
splash.BackgroundTransparency = 0
splash.BorderSizePixel = 0
splash.Parent = screen

local splashCorner = Instance.new("UICorner")
splashCorner.CornerRadius = UDim.new(0, 16)
splashCorner.Parent = splash

local splashTitle = Instance.new("TextLabel")
splashTitle.Size = UDim2.new(1, 0, 1, 0)
splashTitle.Text = "🌙 LUNAR HUB"
splashTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
splashTitle.TextScaled = true
splashTitle.Font = Enum.Font.GothamBold
splashTitle.BackgroundTransparency = 1
splashTitle.Parent = splash

local splashSub = Instance.new("TextLabel")
splashSub.Size = UDim2.new(1, 0, 0, 30)
splashSub.Position = UDim2.new(0, 0, 0, 420)
splashSub.Text = "Загрузка..."
splashSub.TextColor3 = Color3.fromRGB(200, 200, 255)
splashSub.TextSize = 16
splashSub.Font = Enum.Font.Gotham
splashSub.BackgroundTransparency = 1
splashSub.Parent = splash

task.wait(1.5)
TweenService:Create(splash, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
task.wait(0.5)
splash:Destroy()

-- ============================================
-- 🎨 ОСНОВНОЙ ФРЕЙМ
-- ============================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 550, 0, 480)
frame.Position = UDim2.new(0.5, -275, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- СКРУГЛЁННЫЕ УГЛЫ
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- ТЕНЬ
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://13188751145"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.4
shadow.Parent = frame

-- НЕОНОВАЯ РАМКА
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 6, 1, 6)
glow.Position = UDim2.new(0, -3, 0, -3)
glow.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
glow.BackgroundTransparency = 0.2
glow.BorderSizePixel = 0
glow.Parent = frame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 18)
glowCorner.Parent = glow

-- ПУЛЬСАЦИЯ РАМКИ
local glowPulse = TweenService:Create(
    glow,
    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {BackgroundTransparency = 0.05}
)
glowPulse:Play()

-- АНИМАЦИЯ ПОЯВЛЕНИЯ
frame.BackgroundTransparency = 1
local appearTween = TweenService:Create(
    frame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0}
)
appearTween:Play()

-- ============================================
-- 🏷️ ЗАГОЛОВОК
-- ============================================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌙 LUNAR HUB"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

-- ============================================
-- 🔧 ЗАКРЫТИЕ
-- ============================================
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -12, 0, 10)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BackgroundTransparency = 0.2
close.BorderSizePixel = 0
close.Parent = frame

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
searchBox.Size = UDim2.new(0, 320, 0, 32)
searchBox.Position = UDim2.new(0, 15, 0, 60)
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
-- 📋 КАТЕГОРИИ
-- ============================================
local categoriesFrame = Instance.new("Frame")
categoriesFrame.Size = UDim2.new(0, 120, 0, 340)
categoriesFrame.Position = UDim2.new(0, 15, 0, 105)
categoriesFrame.BackgroundTransparency = 1
categoriesFrame.Parent = frame

local categoriesLayout = Instance.new("UIListLayout")
categoriesLayout.FillDirection = Enum.FillDirection.Vertical
categoriesLayout.Padding = UDim.new(0, 6)
categoriesLayout.Parent = categoriesFrame

local currentCategory = "Все игры"
local categoryButtons = {}

local categories = {"Все игры", "Избранное"}

for _, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Text = cat
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Parent = categoriesFrame
    btn.Name = cat
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(45, 35, 80)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if currentCategory ~= cat then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.3, BackgroundColor3 = Color3.fromRGB(25, 25, 55)}):Play()
        end
    end)
    
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
-- 📋 СПИСОК ИГР (КРАСИВЫЙ СКРОЛЛ)
-- ============================================
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(0, 370, 0, 340)
list.Position = UDim2.new(0, 155, 0, 105)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 6
list.ScrollBarImageColor3 = Color3.fromRGB(100, 50, 200)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = list

-- ============================================
-- 🔧 ФУНКЦИЯ ОБНОВЛЕНИЯ КОНТЕНТА
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
        btn.Size = UDim2.new(1, 0, 0, 36)
        btn.Text = game.name
        btn.TextColor3 = Color3.fromRGB(230, 230, 255)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Font = Enum.Font.GothamBold
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        btn.BackgroundTransparency = 0.2
        btn.BorderSizePixel = 0
        btn.Parent = list
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        
        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 15)
        padding.Parent = btn
        
        local arrow = Instance.new("TextLabel")
        arrow.Size = UDim2.new(0, 25, 1, 0)
        arrow.Position = UDim2.new(1, -35, 0, 0)
        arrow.Text = "▶"
        arrow.TextColor3 = Color3.fromRGB(150, 100, 200)
        arrow.TextSize = 16
        arrow.BackgroundTransparency = 1
        arrow.Parent = btn
        
        local favBtn = Instance.new("TextButton")
        favBtn.Size = UDim2.new(0, 30, 1, 0)
        favBtn.Position = UDim2.new(1, -70, 0, 0)
        favBtn.Text = Favorites[game.name] and "⭐" or "☆"
        favBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
        favBtn.TextSize = 18
        favBtn.BackgroundTransparency = 1
        favBtn.Parent = btn
        
        favBtn.MouseButton1Click:Connect(function()
            if Favorites[game.name] then
                Favorites[game.name] = nil
            else
                Favorites[game.name] = true
            end
            favBtn.Text = Favorites[game.name] and "⭐" or "☆"
            if currentCategory == "Избранное" then
                updateContent("Избранное")
            end
        end)
        
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(45, 35, 80)}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 215, 0)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.2, BackgroundColor3 = Color3.fromRGB(25, 25, 55)}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(150, 100, 200)}):Play()
        end)
        
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
    
    list.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 41 + 10)
end

-- ============================================
-- 🔧 ПОИСК
-- ============================================
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateContent(currentCategory)
end)

-- ============================================
-- ⚡ ЗАПУСК
-- ============================================
task.wait(0.2)
searchBox:GetPropertyChangedSignal("Text"):Fire()

print("✅ Lunar Hub v9.7 loaded! (" .. #Games .. " games)")
print("🌙 Красивый дизайн с анимациями активирован!")

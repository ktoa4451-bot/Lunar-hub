-- ============================================
-- 🌙 LUNAR HUB v5.3 (РАБОЧИЕ НАСТРОЙКИ)
-- by Ryzen | ПРОСТО И СТАБИЛЬНО
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "5.4"
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
-- ⚡ ИГРЫ (RAW-ССЫЛКИ)
-- ============================================
local Games = {
    {name = "Arena 1.8", link = "https://raw.githubusercontent.com/Lutosys/1.8arena/refs/heads/main/1.8arena.lua"},
    {name = "Forsaken", link = "https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB"},
    {name = "Rivals", link = "https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"},
    {name = "MM2", link = "https://raw.githubusercontent.com/pruzgar242-rgb/Update/refs/heads/main/out.lua%20(17).txt"},
    {name = "Prison Life", link = "https://rawscripts.net/raw/Prison-Life-serk4rx-script-239866"},
    {name = "Rost Alpha", link = "https://pastefy.app/JNOgCLi6/raw?part="},
    {name = "Ink Game", link = "https://rawscripts.net/raw/Universal-Script-RINGTA-best-script-for-ink-game-206674"},
    {name = "Wallhop V4", link = "https://rawscripts.net/raw/Universal-Script-Nova-Wallhop-V4-206099"},
    {name = "Color or Die", link = "https://rawscripts.net/raw/Color-or-Die-Esp-12555"},
    {name = "Rost Alpha Premium", link = "https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download"},
    {name = "Prison Life Premium", link = "https://rawscripts.net/raw/Prison-Life-Override-Hub-Silent-Aim-and-More-242218"},
    {name = "Slap Battles", link = "https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/File-Script/Slap_Battles.lua"},
    {name = "Drain the Lake", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/DraintheLake"},
    {name = "Chameleon", link = "https://raw.githubusercontent.com/tawxm/NgThanhTam/refs/heads/main/Chameleon.lua"},
    {name = "Sell Limons", link = "https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"},
    {name = "Mine Per Click", link = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/1MinePerClick"},
}

-- ============================================
-- 🔧 УНИВЕРСАЛЬНЫЙ ЗАГРУЗЧИК
-- ============================================
local function loadScript(link)
    local success, result = pcall(function()
        local scriptContent = game:HttpGet(link)
        return loadstring(scriptContent)
    end)
    
    if success and result then
        local execSuccess, execErr = pcall(result)
        if execSuccess then
            return true, "✅ Успешно"
        else
            return false, "Ошибка выполнения: " .. tostring(execErr)
        end
    else
        return false, "Ошибка загрузки: " .. tostring(result)
    end
end

-- ============================================
-- ⚙️ НАСТРОЙКИ (ПО УМОЛЧАНИЮ)
-- ============================================
local Settings = {
    WindowSize = 380,
    MenuColor = {0, 0, 0},
    Transparency = 0.15,
}

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

local function updateWindowSize(newSize)
    Settings.WindowSize = newSize
    frame.Size = UDim2.new(0, newSize, 0, newSize * 1.2)
    frame.Position = UDim2.new(0.5, -newSize/2, 0.5, -newSize * 0.6)
end

-- ОСНОВНОЙ ФРЕЙМ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -Settings.WindowSize/2, 0.5, -Settings.WindowSize * 0.6)
frame.BackgroundColor3 = Color3.fromRGB(Settings.MenuColor[1], Settings.MenuColor[2], Settings.MenuColor[3])
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- АНИМАЦИЯ ПОЯВЛЕНИЯ
local appearTween = TweenService:Create(
    frame,
    TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, Settings.WindowSize, 0, Settings.WindowSize * 1.2), BackgroundTransparency = Settings.Transparency}
)

-- ТОНКАЯ БЕЛАЯ РАМКА
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 2, 1, 2)
border.Position = UDim2.new(0, -1, 0, -1)
border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
border.BackgroundTransparency = 0.9
border.BorderSizePixel = 0
border.Parent = frame

-- ============================================
-- 🏷️ ВЕРХНЯЯ ЧАСТЬ
-- ============================================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 8)
title.Text = "🌙 LUNAR HUB"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

local social = Instance.new("TextLabel")
social.Size = UDim2.new(1, 0, 0, 18)
social.Position = UDim2.new(0, 0, 0, 45)
social.Text = "📱 TG: @LunarHub | TT: @LunarHub"
social.TextColor3 = Color3.fromRGB(200, 200, 255)
social.TextSize = 12
social.Font = Enum.Font.Gotham
social.BackgroundTransparency = 1
social.Parent = frame

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 18)
sub.Position = UDim2.new(0, 0, 0, 63)
sub.Text = "📊 " .. #Games .. " игр | by Ryzen"
sub.TextColor3 = Color3.fromRGB(180, 180, 220)
sub.TextSize = 12
sub.Font = Enum.Font.Gotham
sub.BackgroundTransparency = 1
sub.Parent = frame

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 28)
searchBox.Position = UDim2.new(0, 10, 0, 84)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
searchBox.BackgroundTransparency = 0.5
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "🔍 Поиск..."
searchBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 180)
searchBox.TextSize = 13
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClipsDescendants = true
searchBox.Parent = frame

-- ============================================
-- 🔧 КАТЕГОРИИ (ВКЛАДКИ)
-- ============================================
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -20, 0, 30)
tabsFrame.Position = UDim2.new(0, 10, 0, 116)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = frame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
tabLayout.Parent = tabsFrame

local currentCategory = "Games"
local tabButtons = {}

local function updateCategory(category)
    currentCategory = category
    for _, child in ipairs(tabsFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.BackgroundTransparency = 0.5
        end
    end
    for _, btn in ipairs(tabButtons) do
        if btn.Name == category then
            btn.BackgroundTransparency = 0
        end
    end
    updateContent(category)
end

local categories = {
    {name = "🎮 Игры", key = "Games"},
    {name = "⚙️ Настройки", key = "Settings"},
}

for _, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 100, 1, 0)
    btn.Text = cat.name
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 0
    btn.Parent = tabsFrame
    btn.Name = cat.key
    btn.MouseButton1Click:Connect(function()
        updateCategory(cat.key)
    end)
    tabButtons[cat.key] = btn
end

if tabButtons["Games"] then
    tabButtons["Games"].BackgroundTransparency = 0
end

-- ============================================
-- 📋 КОНТЕНТ
-- ============================================
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -20, 1, -180)
contentFrame.Position = UDim2.new(0, 10, 0, 150)
contentFrame.BackgroundTransparency = 1
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
contentFrame.ScrollBarThickness = 4
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
contentFrame.Parent = frame

local contentLayout = Instance.new("UIListLayout")
contentLayout.SortOrder = Enum.SortOrder.Name
contentLayout.Padding = UDim.new(0, 4)
contentLayout.Parent = contentFrame

-- ============================================
-- 🔧 ОБНОВЛЕНИЕ КОНТЕНТА
-- ============================================
local function updateContent(category)
    for _, child in ipairs(contentFrame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    if category == "Games" then
        for _, gameData in ipairs(Games) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 32)
            btn.Text = gameData.name
            btn.TextColor3 = Color3.fromRGB(230, 230, 255)
            btn.TextSize = 13
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Font = Enum.Font.GothamBold
            btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            btn.BackgroundTransparency = 0.2
            btn.BorderSizePixel = 0
            btn.Parent = contentFrame
            
            local padding = Instance.new("UIPadding")
            padding.PaddingLeft = UDim.new(0, 12)
            padding.Parent = btn
            
            local arrow = Instance.new("TextLabel")
            arrow.Size = UDim2.new(0, 25, 1, 0)
            arrow.Position = UDim2.new(1, -30, 0, 0)
            arrow.Text = "▶"
            arrow.TextColor3 = Color3.fromRGB(150, 150, 150)
            arrow.TextSize = 16
            arrow.BackgroundTransparency = 1
            arrow.Parent = btn
            
            btn.MouseEnter:Connect(function()
                TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
                TweenService:Create(arrow, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(255, 215, 0)}):Play()
            end)
            btn.MouseLeave:Connect(function()
                TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.2, BackgroundColor3 = Color3.fromRGB(15, 15, 15)}):Play()
                TweenService:Create(arrow, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
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
                    warn("Ошибка: " .. msg)
                end
                
                task.wait(1)
                btn.Text = gameData.name
                btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                arrow.Text = "▶"
            end)
        end
        
    elseif category == "Settings" then
        -- РАЗМЕР ОКНА (ГОТОВЫЕ ЗНАЧЕНИЯ)
        local sizeLabel = Instance.new("TextLabel")
        sizeLabel.Size = UDim2.new(1, 0, 0, 20)
        sizeLabel.Text = "📐 Размер окна:"
        sizeLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
        sizeLabel.TextSize = 13
        sizeLabel.BackgroundTransparency = 1
        sizeLabel.Parent = contentFrame
        
        local sizeFrame = Instance.new("Frame")
        sizeFrame.Size = UDim2.new(1, 0, 0, 30)
        sizeFrame.BackgroundTransparency = 1
        sizeFrame.Parent = contentFrame
        
        local sizeLayout = Instance.new("UIListLayout")
        sizeLayout.FillDirection = Enum.FillDirection.Horizontal
        sizeLayout.Padding = UDim.new(0, 4)
        sizeLayout.Parent = sizeFrame
        
        local sizes = {320, 380, 440, 500, 560}
        for _, s in ipairs(sizes) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 50, 1, 0)
            btn.Text = tostring(s)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextSize = 12
            btn.Font = Enum.Font.GothamBold
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            btn.BackgroundTransparency = 0.2
            btn.BorderSizePixel = 0
            btn.Parent = sizeFrame
            btn.MouseButton1Click:Connect(function()
                updateWindowSize(s)
                for _, child in ipairs(sizeFrame:GetChildren()) do
                    if child:IsA("TextButton") then
                        child.BackgroundTransparency = 0.5
                    end
                end
                btn.BackgroundTransparency = 0
            end)
        end
        
        -- ЦВЕТ МЕНЮ (ГОТОВЫЕ ЦВЕТА)
        local colorLabel = Instance.new("TextLabel")
        colorLabel.Size = UDim2.new(1, 0, 0, 20)
        colorLabel.Text = "🎨 Цвет меню:"
        colorLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
        colorLabel.TextSize = 13
        colorLabel.BackgroundTransparency = 1
        colorLabel.Parent = contentFrame
        
        local colorFrame = Instance.new("Frame")
        colorFrame.Size = UDim2.new(1, 0, 0, 30)
        colorFrame.BackgroundTransparency = 1
        colorFrame.Parent = contentFrame
        
        local colorLayout = Instance.new("UIListLayout")
        colorLayout.FillDirection = Enum.FillDirection.Horizontal
        colorLayout.Padding = UDim.new(0, 4)
        colorLayout.Parent = colorFrame
        
        local colorList = {
            {name = "Черный", r = 0, g = 0, b = 0},
            {name = "Белый", r = 255, g = 255, b = 255},
            {name = "Красный", r = 255, g = 0, b = 0},
            {name = "Синий", r = 0, g = 0, b = 255},
            {name = "Зеленый", r = 0, g = 255, b = 0},
            {name = "Фиолетовый", r = 128, g = 0, b = 255},
        }
        
        for _, c in ipairs(colorList) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 60, 1, 0)
            btn.Text = c.name
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextSize = 11
            btn.Font = Enum.Font.GothamBold
            btn.BackgroundColor3 = Color3.fromRGB(c.r, c.g, c.b)
            btn.BackgroundTransparency = 0.2
            btn.BorderSizePixel = 0
            btn.Parent = colorFrame
            btn.MouseButton1Click:Connect(function()
                Settings.MenuColor = {c.r, c.g, c.b}
                frame.BackgroundColor3 = Color3.fromRGB(c.r, c.g, c.b)
                for _, child in ipairs(colorFrame:GetChildren()) do
                    if child:IsA("TextButton") then
                        child.BackgroundTransparency = 0.2
                    end
                end
                btn.BackgroundTransparency = 0
            end)
        end
        
        -- ПРОЗРАЧНОСТЬ (ГОТОВЫЕ ЗНАЧЕНИЯ)
        local transLabel = Instance.new("TextLabel")
        transLabel.Size = UDim2.new(1, 0, 0, 20)
        transLabel.Text = "🔲 Прозрачность:"
        transLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
        transLabel.TextSize = 13
        transLabel.BackgroundTransparency = 1
        transLabel.Parent = contentFrame
        
        local transFrame = Instance.new("Frame")
        transFrame.Size = UDim2.new(1, 0, 0, 30)
        transFrame.BackgroundTransparency = 1
        transFrame.Parent = contentFrame
        
        local transLayout = Instance.new("UIListLayout")
        transLayout.FillDirection = Enum.FillDirection.Horizontal
        transLayout.Padding = UDim.new(0, 4)
        transLayout.Parent = transFrame
        
        local transValues = {0, 0.1, 0.15, 0.3, 0.5, 0.7}
        for _, t in ipairs(transValues) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 50, 1, 0)
            btn.Text = tostring(t)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextSize = 11
            btn.Font = Enum.Font.GothamBold
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            btn.BackgroundTransparency = 0.2
            btn.BorderSizePixel = 0
            btn.Parent = transFrame
            btn.MouseButton1Click:Connect(function()
                Settings.Transparency = t
                frame.BackgroundTransparency = t
                for _, child in ipairs(transFrame:GetChildren()) do
                    if child:IsA("TextButton") then
                        child.BackgroundTransparency = 0.2
                    end
                end
                btn.BackgroundTransparency = 0
            end)
        end
        
        -- СБРОС
        local resetBtn = Instance.new("TextButton")
        resetBtn.Size = UDim2.new(0, 150, 0, 35)
        resetBtn.Text = "🔄 Сбросить настройки"
        resetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        resetBtn.TextSize = 14
        resetBtn.Font = Enum.Font.GothamBold
        resetBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 30)
        resetBtn.BackgroundTransparency = 0.2
        resetBtn.BorderSizePixel = 0
        resetBtn.Parent = contentFrame
        
        resetBtn.MouseEnter:Connect(function()
            resetBtn.BackgroundTransparency = 0
        end)
        resetBtn.MouseLeave:Connect(function()
            resetBtn.BackgroundTransparency = 0.2
        end)
        
        resetBtn.MouseButton1Click:Connect(function()
            Settings.WindowSize = 380
            Settings.MenuColor = {0, 0, 0}
            Settings.Transparency = 0.15
            
            updateWindowSize(380)
            frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            frame.BackgroundTransparency = 0.15
            
            for _, child in ipairs(sizeFrame:GetChildren()) do
                if child:IsA("TextButton") and child.Text == "380" then
                    child.BackgroundTransparency = 0
                else
                    child.BackgroundTransparency = 0.2
                end
            end
            for _, child in ipairs(colorFrame:GetChildren()) do
                if child:IsA("TextButton") and child.Text == "Черный" then
                    child.BackgroundTransparency = 0
                else
                    child.BackgroundTransparency = 0.2
                end
            end
            for _, child in ipairs(transFrame:GetChildren()) do
          

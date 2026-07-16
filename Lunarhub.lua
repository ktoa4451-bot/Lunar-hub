-- ============================================
-- 🌙 LUNAR HUB v5.5 (ПОЛНЫЕ НАСТРОЙКИ)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "5.5"
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
-- 🎨 ЦВЕТА
-- ============================================
local Colors = {
    ["Красный"] = Color3.fromRGB(255, 0, 0),
    ["Оранжевый"] = Color3.fromRGB(255, 165, 0),
    ["Жёлтый"] = Color3.fromRGB(255, 255, 0),
    ["Зелёный"] = Color3.fromRGB(0, 255, 0),
    ["Голубой"] = Color3.fromRGB(0, 255, 255),
    ["Синий"] = Color3.fromRGB(0, 0, 255),
    ["Фиолетовый"] = Color3.fromRGB(128, 0, 255),
    ["Чёрный"] = Color3.fromRGB(0, 0, 0),
    ["Серый"] = Color3.fromRGB(128, 128, 128),
}

-- ============================================
-- ⚙️ НАСТРОЙКИ (ПО УМОЛЧАНИЮ)
-- ============================================
local Settings = {
    WindowSize = 380,
    MenuColor = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255, 215, 0),
    Transparency = 0.15,
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
    Settings.WindowSize = math.clamp(newSize, 300, 600)
    frame.Size = UDim2.new(0, Settings.WindowSize, 0, Settings.WindowSize * 1.2)
    frame.Position = UDim2.new(0.5, -Settings.WindowSize/2, 0.5, -Settings.WindowSize * 0.6)
end

-- ОСНОВНОЙ ФРЕЙМ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -Settings.WindowSize/2, 0.5, -Settings.WindowSize * 0.6)
frame.BackgroundColor3 = Settings.MenuColor
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
title.TextColor3 = Settings.TextColor
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

local social = Instance.new("TextLabel")
social.Size = UDim2.new(1, 0, 0, 18)
social.Position = UDim2.new(0, 0, 0, 45)
social.Text = "📱 TG: @LunarHub | TT: @LunarHub"
social.TextColor3 = Settings.TextColor
social.TextSize = 12
social.Font = Enum.Font.Gotham
social.BackgroundTransparency = 1
social.Parent = frame

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 18)
sub.Position = UDim2.new(0, 0, 0, 63)
sub.Text = "📊 " .. #Games .. " игр | by Ryzen"
sub.TextColor3 = Settings.TextColor
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
-- 🔧 ФУНКЦИЯ ДЛЯ КНОПОК ЦВЕТА
-- ============================================
local function createColorButton(colorName, colorValue, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 70, 0, 28)
    btn.Text = colorName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = colorValue
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 0
    btn.Parent = contentFrame
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.2
    end)
    
    btn.MouseButton1Click:Connect(function()
        callback(colorValue)
        btn.BackgroundTransparency = 0.5
        task.wait(0.2)
        btn.BackgroundTransparency = 0.2
    end)
end

-- ============================================
-- 🔧 ОБНОВЛЕНИЕ КОНТЕНТА
-- ============================================
local function updateContent(category)
    for _, child in ipairs(contentFrame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("Frame") then
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
        -- РАЗМЕР ОКНА
        local sizeLabel = Instance.new("TextLabel")
        sizeLabel.Size = UDim2.new(1, 0, 0, 20)
        sizeLabel.Text = "📐 Размер окна: " .. Settings.WindowSize
        sizeLabel.TextColor3 = Settings.TextColor
        sizeLabel.TextSize = 13
        sizeLabel.BackgroundTransparency = 1
        sizeLabel.Parent = contentFrame
        
        local sizeSlider = Instance.new("TextBox")
        sizeSlider.Size = UDim2.new(0, 150, 0, 28)
        sizeSlider.Text = tostring(Settings.WindowSize)
        sizeSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        sizeSlider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        sizeSlider.BackgroundTransparency = 0.5
        sizeSlider.BorderSizePixel = 0
        sizeSlider.Parent = contentFrame
        
        sizeSlider.FocusLost:Connect(function()
            local val = tonumber(sizeSlider.Text)
            if val and val >= 300 and val <= 600 then
                updateWindowSize(val)
                sizeLabel.Text = "📐 Размер окна: " .. val
            else
                sizeSlider.Text = tostring(Settings.WindowSize)
            end
        end)
        
        -- ЦВЕТ МЕНЮ
        local menuLabel = Instance.new("TextLabel")
        menuLabel.Size = UDim2.new(1, 0, 0, 20)
        menuLabel.Text = "🎨 Цвет меню:"
        menuLabel.TextColor3 = Settings.TextColor
        menuLabel.TextSize = 13
        menuLabel.BackgroundTransparency = 1
        menuLabel.Parent = contentFrame
        
        local menuColorsFrame = Instance.new("Frame")
        menuColorsFrame.Size = UDim2.new(1, 0, 0, 32)
        menuColorsFrame.BackgroundTransparency = 1
        menuColorsFrame.Parent = contentFrame
        
        local menuLayout = Instance.new("UIListLayout")
        menuLayout.FillDirection = Enum.FillDirection.Horizontal
        menuLayout.Padding = UDim.new(0, 4)
        menuLayout.Parent = menuColorsFrame
        
        for name, color in pairs(Colors) do
            createColorButton(name, color, function(c)
                Settings.MenuColor = c
                frame.BackgroundColor3 = c
            end)
        end
        
        -- ЦВЕТ ТЕКСТА
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 0, 20)
        textLabel.Text = "📝 Цвет текста:"
        textLabel.TextColor3 = Settings.TextColor
        textLabel.TextSize = 13
        textLabel.BackgroundTransparency = 1
        textLabel.Parent = contentFrame
        
        local textColorsFrame = Instance.new("Frame")
        textColorsFrame.Size = UDim2.new(1, 0, 0, 32)
        textColorsFrame.BackgroundTransparency = 1
        textColorsFrame.Parent = contentFrame
        
        local textLayout = Instance.new("UIListLayout")
        textLayout.FillDirection = Enum.FillDirection.Horizontal
        textLayout.Padding = UDim.new(0, 4)
        textLayout.Parent = textColorsFrame
        
        for name, color in pairs(Colors) do
            createColorButton(name, color, function(c)
                Settings.TextColor = c
                title.TextColor3 = c
                social.TextColor3 = c
                sub.TextColor3 = c
                for _, btn in ipairs(tabsFrame:GetChildren()) do
                    if btn:IsA("TextButton") then
                        btn.TextColor3 = c
                    end
                end
                for _, child in ipairs(contentFrame:GetChildren()) do
                    if child:IsA("TextLabel") then
                        child.TextColor3 = c
                    end
                end
            end)
        end
        
        -- ПРОЗРАЧНОСТЬ
        local transLabel = Instance.new("TextLabel")
        transLabel.Size = UDim2.new(1, 0, 0, 20)
        transLabel.Text = "🔲 Прозрачность: " .. Settings.Transparency
        transLabel.TextColor3 = Settings.TextColor
        transLabel.TextSize = 13
        transLabel.BackgroundTransparency = 1
        transLabel.Parent = contentFrame
        
        local transSlider = Instance.new("TextBox")
        transSlider.Size = UDim2.new(0, 150, 0, 28)
        transSlider.Text = tostring(Settings.Transparency)
        transSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        transSlider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        transSlider.BackgroundTransparency = 0.5
        transSlider.BorderSizePixel = 0
        transSlider.Parent = contentFrame
        
        transSlider.FocusLost:Connect(function()
            local val = tonumber(transSlider.Text)
            if val and val >= 0 and val <= 1 then
                Settings.Transparency = val
                frame.BackgroundTransparency = val
                transLabel.Text = "🔲 Прозрачность: " .. val
                transSlider.Text = tostring(val)
            else
                transSlider.Text = tostring(Settings.Transparency)
            end
        end)
        
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
            Settings.MenuColor = Color3.fromRGB(0, 0, 0)
            Settings.TextColor = Color3.fromRGB(255, 215, 0)
            Settings.Transparency = 0.15
      ку

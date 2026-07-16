-- ============================================
-- 🌙 LUNAR HUB v6.0 (ВСЕ ЦВЕТА РАДУГИ)
-- by Ryzen | МЕНЯЕМ РАЗМЕР | 3 КАТЕГОРИИ | НАСТРОЙКИ
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "6.0"
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
-- ⚡ ИГРЫ (ДОБАВЛЯЙ СЮДА)
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
    {name = "Blox Fruits", link = "https://raw.githubusercontent.com/UCT-hub/main/refs/heads/main/redz-v2"},
    {name = "Grow a Garden 2 Premium", link = "https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"},
    {name = "Animal Hospital", link = "https://raw.githubusercontent.com/HexHubX/Games/refs/heads/main/Script%20Games.lua"},
    {name = "Drain the Lake", link = "https://raw.githubusercontent.com/gumanba/Scripts/main/DraintheLake"},
    {name = "Doors", link = "https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Loader.luau"},
    {name = "Speed Keyboard Escape", link = "https://api.luarmor.net/files/v4/loaders/385c6d8937bfc4ef284dc8c27b50e1c5.lua"},
    {name = "Chameleon", link = "https://raw.githubusercontent.com/tawxm/NgThanhTam/refs/heads/main/Chameleon.lua"},
    {name = "Sell Limons", link = "https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"},
    {name = "Mine Per Click", link = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/1MinePerClick"},
}

-- ============================================
-- 🔧 ЦВЕТА РАДУГИ
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
-- 🔧 КАТЕГОРИИ
-- ============================================
local Categories = {
    ["🎮 Игры"] = "Games",
    ["⚙️ Настройки"] = "Settings",
    ["👤 Игрок"] = "Player",
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
-- 🔧 НАСТРОЙКИ
-- ============================================
local Settings = {
    MenuColor = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255, 215, 0),
    Transparency = 0.15,
}

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

-- ОСНОВНОЙ ФРЕЙМ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -190, 0.5, -230)
frame.BackgroundColor3 = Settings.MenuColor
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- ============================================
-- 🔧 РЕСАЙЗ
-- ============================================
local isResizing = false
local resizeStartPos = nil
local resizeStartSize = nil

local function startResizing()
    isResizing = true
    resizeStartPos = UserInputService:GetMouseLocation()
    resizeStartSize = frame.Size
end

local function updateResize()
    if not isResizing then return end
    local currentMouse = UserInputService:GetMouseLocation()
    local delta = currentMouse - resizeStartPos
    local newWidth = math.max(300, resizeStartSize.X.Offset + delta.X)
    local newHeight = math.max(300, resizeStartSize.Y.Offset + delta.Y)
    frame.Size = UDim2.new(0, newWidth, 0, newHeight)
end

local function stopResizing()
    isResizing = false
end

local resizeArea = Instance.new("Frame")
resizeArea.Size = UDim2.new(0, 20, 0, 20)
resizeArea.Position = UDim2.new(1, -20, 1, -20)
resizeArea.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
resizeArea.BackgroundTransparency = 0.5
resizeArea.BorderSizePixel = 0
resizeArea.Parent = frame
resizeArea.MouseButton1Down:Connect(startResizing)
resizeArea.MouseEnter:Connect(function() resizeArea.BackgroundTransparency = 0.3 end)
resizeArea.MouseLeave:Connect(function() resizeArea.BackgroundTransparency = 0.5 end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        stopResizing()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        updateResize()
    end
end)

-- ============================================
-- 🎨 АНИМАЦИЯ ПОЯВЛЕНИЯ
-- ============================================
local appearTween = TweenService:Create(
    frame,
    TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 380, 0, 460), BackgroundTransparency = Settings.Transparency}
)

-- РАМКА
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 2, 1, 2)
border.Position = UDim2.new(0, -1, 0, -1)
border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
border.BackgroundTransparency = 0.9
border.BorderSizePixel = 0
border.Parent = frame

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Position = UDim2.new(0, 0, 0, 10)
title.Text = "🌙 LUNAR HUB"
title.TextColor3 = Settings.TextColor
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

-- СОЦИАЛЬНЫЕ СЕТИ
local social = Instance.new("TextLabel")
social.Size = UDim2.new(1, 0, 0, 20)
social.Position = UDim2.new(0, 0, 0, 52)
social.Text = "📱 TG: @LunarHub | TT: @LunarHub"
social.TextColor3 = Settings.TextColor
social.TextSize = 12
social.Font = Enum.Font.Gotham
social.BackgroundTransparency = 1
social.Parent = frame

-- СЧЁТЧИК
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 20)
sub.Position = UDim2.new(0, 0, 0, 72)
sub.Text = "📊 " .. #Games .. " игр | by Ryzen"
sub.TextColor3 = Settings.TextColor
sub.TextSize = 12
sub.Font = Enum.Font.Gotham
sub.BackgroundTransparency = 1
sub.Parent = frame

-- ============================================
-- 🔧 ЗАКРЫТИЕ
-- ============================================
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 32, 0, 32)
close.Position = UDim2.new(1, -40, 0, 8)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.BackgroundTransparency = 1
close.Parent = frame

close.MouseEnter:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)
close.MouseLeave:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

close.MouseButton1Click:Connect(function()
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    screen:Destroy()
end)

-- ============================================
-- 🔧 ВКЛАДКИ
-- ============================================
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -20, 0, 30)
tabsFrame.Position = UDim2.new(0, 10, 0, 95)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = frame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
tabLayout.Parent = tabsFrame

local currentCategory = "Games"
local buttons = {}

for catName, catKey in pairs(Categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 100, 1, 0)
    btn.Text = catName
    btn.TextColor3 = Settings.TextColor
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 0
    btn.Parent = tabsFrame
    btn.Name = catKey
    btn.MouseButton1Click:Connect(function()
        currentCategory = catKey
        for _, b in ipairs(tabsFrame:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundTransparency = 0.5
            end
        end
        btn.BackgroundTransparency = 0
        updateContent(currentCategory)
    end)
    buttons[catKey] = btn
end

if buttons["Games"] then
    buttons["Games"].BackgroundTransparency = 0
end

-- ============================================
-- 📋 КОНТЕНТ
-- ============================================
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -20, 1, -160)
contentFrame.Position = UDim2.new(0, 10, 0, 130)
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
-- 🔧 ФУНКЦИЯ ЦВЕТОВ
-- ============================================
local function createColorButton(colorName, colorValue, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 80, 0, 30)
    btn.Text = colorName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
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
-- 🔧 ФУНКЦИЯ ОБНОВЛЕНИЯ
-- ============================================
local function updateContent(category)
    for _, child in ipairs(contentFrame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") or child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    if category == "Games" then
        for _, gameData in ipairs(Games) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 32)
            btn.Text = gameData.name
            btn.TextColor3 = Settings.TextColor
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
        -- ЦВЕТ МЕНЮ
        local menuLabel = Instance.new("TextLabel")
        menuLabel.Size = UDim2.new(1, 0, 0, 25)
        menuLabel.Text = "🎨 Цвет меню:"
        menuLabel.TextColor3 = Settings.TextColor
        menuLabel.TextSize = 14
        menuLabel.Font = Enum.Font.GothamBold
        menuLabel.BackgroundTransparency = 1
        menuLabel.Parent = contentFrame
        
        local menuColorsFrame = Instance.new("Frame")
        menuColorsFrame.Size = UDim2.new(1, 0, 0, 35)
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
        textLabel.Size = UDim2.new(1, 0, 0, 25)
        textLabel.Text = "📝 Цвет текста:"
        textLabel.TextColor3 = Settings.TextColor
        textLabel.TextSize = 14
        textLabel.Font = Enum.Font.GothamBold
        textLabel.BackgroundTransparency = 1
        textLabel.Parent = contentFrame
        
        local textColorsFrame = Instance.new("Frame")
        textColorsFrame.Size = UDim2.new(1, 0, 0, 35)
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
        transLabel.Size = UDim2.new(1, 0, 0, 25)
        transLabel.Text = "🔲 Прозрачность фона:"
        transLabel.TextColor3 = Settings.TextColor
        transLabel.TextSize = 14
        transLabel.Font = Enum.Font.GothamBold
        transLabel.BackgroundTransparency = 1
        transLabel.Parent = contentFrame
        
        local transSlider = Instance.new("TextBox")
        transSlider.Size = UDim2.new(0, 150, 0, 30)
        transSlider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        transSlider.BackgroundTransparency = 0.5
        transSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        transSlider.Text = tostring(Settings.Transparency)
        transSlider.TextSize = 14
        transSlider.Font = Enum.Font.GothamBold
        transSlider.BorderSizePixel = 0
        transSlider.Parent = contentFrame
        
        transSlider.FocusLost:Connect(function()
            local val = tonumber(transSlider.Text)
            if val and val >= 0 and val <= 1 then
    

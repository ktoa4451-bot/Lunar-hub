-- ============================================
-- 🌙 LUNAR HUB v6.2 (ФИНАЛ)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "6.2"
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
-- ⚙️ НАСТРОЙКИ
-- ============================================
local Settings = {
    WindowSize = 380,
    MenuColor = {0, 0, 0},
    Transparency = 0.15,
    IsMinimized = false,
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
local UserInputService = game:GetService("UserInputService")

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
frame.Size = UDim2.new(0, 380, 0, 460)
frame.Position = UDim2.new(0.5, -190, 0.5, -230)
frame.BackgroundColor3 = Color3.fromRGB(Settings.MenuColor[1], Settings.MenuColor[2], Settings.MenuColor[3])
frame.BackgroundTransparency = Settings.Transparency
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

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
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌙 LUNAR HUB"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

local social = Instance.new("TextLabel")
social.Size = UDim2.new(1, 0, 0, 16)
social.Position = UDim2.new(0, 0, 0, 40)
social.Text = "📱 TT: @lunar_hub1 | TG: @LunarHub_script"
social.TextColor3 = Color3.fromRGB(200, 200, 255)
social.TextSize = 11
social.Font = Enum.Font.Gotham
social.BackgroundTransparency = 1
social.Parent = frame

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 16)
sub.Position = UDim2.new(0, 0, 0, 56)
sub.Text = "📊 " .. #Games .. " игр | by Ryzen"
sub.TextColor3 = Color3.fromRGB(180, 180, 220)
sub.TextSize = 11
sub.Font = Enum.Font.Gotham
sub.BackgroundTransparency = 1
sub.Parent = frame

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 26)
searchBox.Position = UDim2.new(0, 10, 0, 74)
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
-- 🌙 ОТДЕЛЬНАЯ КРУГЛАЯ КНОПКА ДЛЯ СВОРАЧИВАНИЯ
-- ============================================
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -40, 0, 5)
minimizeBtn.Text = "🌙"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
minimizeBtn.TextSize = 20
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.Parent = frame

local isMinimized = false
local moonButton = nil

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        frame.ClipsDescendants = true
        title.Visible = false
        social.Visible = false
        sub.Visible = false
        searchBox.Visible = false
        list.Visible = false
        settingsBtn.Visible = false
        close.Visible = false
        minimizeBtn.Visible = false
        border.Visible = false
        
        -- СОЗДАЁМ КРУГЛУЮ КНОПКУ С ЛУНОЙ
        if not moonButton then
            moonButton = Instance.new("TextButton")
            moonButton.Size = UDim2.new(0, 60, 0, 60)
            moonButton.Position = UDim2.new(1, -70, 0, 10)
            moonButton.Text = "🌕"
            moonButton.TextColor3 = Color3.fromRGB(255, 255, 200)
            moonButton.TextSize = 32
            moonButton.Font = Enum.Font.GothamBold
            moonButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            moonButton.BackgroundTransparency = 0.3
            moonButton.BorderSizePixel = 0
            moonButton.ClipsDescendants = true
            moonButton.Parent = screen
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = moonButton
            
            moonButton.MouseButton1Click:Connect(function()
                isMinimized = false
                TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                    Size = UDim2.new(0, Settings.WindowSize, 0, Settings.WindowSize * 1.2),
                    Position = UDim2.new(0.5, -Settings.WindowSize/2, 0.5, -Settings.WindowSize * 0.6),
                    BackgroundTransparency = Settings.Transparency
                }):Play()
                title.Visible = true
                social.Visible = true
                sub.Visible = true
                searchBox.Visible = true
                list.Visible = true
                settingsBtn.Visible = true
                close.Visible = true
                minimizeBtn.Visible = true
                border.Visible = true
                moonButton:Destroy()
                moonButton = nil
            end)
        end
    else
        TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, Settings.WindowSize, 0, Settings.WindowSize * 1.2),
            Position = UDim2.new(0.5, -Settings.WindowSize/2, 0.5, -Settings.WindowSize * 0.6),
            BackgroundTransparency = Settings.Transparency
        }):Play()
        title.Visible = true
        social.Visible = true
        sub.Visible = true
        searchBox.Visible = true
        list.Visible = true
        settingsBtn.Visible = true
        close.Visible = true
        minimizeBtn.Visible = true
        border.Visible = true
        if moonButton then
            moonButton:Destroy()
            moonButton = nil
        end
    end
end)

-- ============================================
-- ⚙️ КНОПКА НАСТРОЕК
-- ============================================
local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(1, -80, 0, 5)
settingsBtn.Text = "⚙️"
settingsBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
settingsBtn.TextSize = 18
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.BackgroundTransparency = 1
settingsBtn.Parent = frame

local settingsOpen = false
local settingsFrame = nil

settingsBtn.MouseEnter:Connect(function()
    TweenService:Create(settingsBtn, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)
settingsBtn.MouseLeave:Connect(function()
    TweenService:Create(settingsBtn, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(200, 200, 255)}):Play()
end)

settingsBtn.MouseButton1Click:Connect(function()
    if settingsOpen then
        settingsFrame:Destroy()
        settingsOpen = false
        return
    end
    
    settingsOpen = true
    settingsFrame = Instance.new("Frame")
    settingsFrame.Size = UDim2.new(0, 350, 0, 380)
    settingsFrame.Position = UDim2.new(0.5, -175, 0.5, -190)
    settingsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    settingsFrame.BackgroundTransparency = 0.15
    settingsFrame.BorderSizePixel = 0
    settingsFrame.ClipsDescendants = true
    settingsFrame.Active = true
    settingsFrame.Draggable = true
    settingsFrame.Parent = screen
    
    local settingsBorder = Instance.new("Frame")
    settingsBorder.Size = UDim2.new(1, 2, 1, 2)
    settingsBorder.Position = UDim2.new(0, -1, 0, -1)
    settingsBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    settingsBorder.BackgroundTransparency = 0.9
    settingsBorder.BorderSizePixel = 0
    settingsBorder.Parent = settingsFrame
    
    local settingsTitle = Instance.new("TextLabel")
    settingsTitle.Size = UDim2.new(1, 0, 0, 40)
    settingsTitle.Position = UDim2.new(0, 0, 0, 5)
    settingsTitle.Text = "⚙️ НАСТРОЙКИ"
    settingsTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    settingsTitle.TextScaled = true
    settingsTitle.Font = Enum.Font.GothamBold
    settingsTitle.BackgroundTransparency = 1
    settingsTitle.Parent = settingsFrame
    
    local closeSettings = Instance.new("TextButton")
    closeSettings.Size = UDim2.new(0, 30, 0, 30)
    closeSettings.Position = UDim2.new(0, 5, 0, 5)
    closeSettings.Text = "✕"
    closeSettings.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeSettings.TextSize = 18
    closeSettings.Font = Enum.Font.GothamBold
    closeSettings.BackgroundTransparency = 1
    closeSettings.Parent = settingsFrame
    closeSettings.MouseButton1Click:Connect(function()
        settingsFrame:Destroy()
        settingsOpen = false
    end)
    
    -- СКРОЛЛ
    local settingsScroll = Instance.new("ScrollingFrame")
    settingsScroll.Size = UDim2.new(1, -10, 1, -50)
    settingsScroll.Position = UDim2.new(0, 5, 0, 45)
    settingsScroll.BackgroundTransparency = 1
    settingsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    settingsScroll.ScrollBarThickness = 4
    settingsScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    settingsScroll.Parent = settingsFrame
    
    local settingsLayout = Instance.new("UIListLayout")
    settingsLayout.Padding = UDim.new(0, 10)
    settingsLayout.Parent = settingsScroll
    
    -- РАЗМЕР (КРАСИВЫЙ ПОЛЗУНОК)
    local sizeLabel = Instance.new("TextLabel")
    sizeLabel.Size = UDim2.new(1, -20, 0, 20)
    sizeLabel.Text = "📐 Размер: " .. Settings.WindowSize
    sizeLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    sizeLabel.TextSize = 13
    sizeLabel.BackgroundTransparency = 1
    sizeLabel.Parent = settingsScroll
    
    local sizeSlider = Instance.new("Frame")
    sizeSlider.Size = UDim2.new(1, -20, 0, 20)
    sizeSlider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    sizeSlider.BackgroundTransparency = 0.5
    sizeSlider.BorderSizePixel = 0
    sizeSlider.Parent = settingsScroll
    
    local sizeFill = Instance.new("Frame")
    sizeFill.Size = UDim2.new((Settings.WindowSize - 300) / 300, 0, 1, 0)
    sizeFill.BackgroundColor3 = Color3.fromRGB(100, 70, 255)
    sizeFill.BorderSizePixel = 0
    sizeFill.Parent = sizeSlider
    
    local sizeHandle = Instance.new("TextButton")
    sizeHandle.Size = UDim2.new(0, 20, 1.5, 0)
    sizeHandle.Position = UDim2.new((Settings.WindowSize - 300) / 300, -10, 0, 0)
    sizeHandle.Text = ""
    sizeHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sizeHandle.BorderSizePixel = 0
    sizeHandle.Parent = sizeSlider
    sizeHandle.BackgroundTransparency = 0.2
    
    local sizeDragging = false
    sizeHandle.MouseButton1Down:Connect(function()
        sizeDragging = true
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sizeDragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and sizeDragging then
            local mouse = UserInputService:GetMouseLocation()
            local sliderPos = sizeSlider.AbsolutePosition
            local sliderSize = sizeSlider.AbsoluteSize
            local percent = math.clamp((mouse.X - sliderPos.X) / sliderSize.X, 0, 1)
            local newSize = math.round(300 + percent * 300)
            newSize = math.clamp(newSize, 300, 600)
            updateWindowSize(newSize)
            sizeFill.Size = UDim2.new(percent, 0, 1, 0)
            sizeHandle.Position = UDim2.new(percent, -10, 0, 0)
            sizeLabel.Text = "📐 Размер: " .. newSize
        end
    end)
    
    -- ЦВЕТ (ГОРИЗОНТАЛЬНЫЙ СКРОЛЛ)
    local colorLabel = Instance.new("TextLabel")
    colorLabel.Size = UDim2.new(1, -20, 0, 20)
    colorLabel.Text = "🎨 Цвет:"
    colorLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    colorLabel.TextSize = 13
    colorLabel.BackgroundTransparency = 1
    colorLabel.Parent = settingsScroll
    
    local colorScroll = Instance.new("ScrollingFrame")
    colorScroll.Size = UDim2.new(1, -20, 0, 40)
    colorScroll.BackgroundTransparency = 1
    colorScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    colorScroll.HorizontalScrollBarInset = Enum.ScrollBarInset.None
    colorScroll.ScrollBarThickness = 4
    colorScroll.Parent = settingsScroll
    
    local colorLayout = Instance.new("UIListLayout")
    colorLayout.FillDirection = Enum.FillDirection.Horizontal
    colorLayout.Padding = UDim.new(0, 4)
    colorLayout.Parent = colorScroll
    
    local colorList = {
        {name = "Черный", r = 0, g = 0, b = 0},
        {name = "Белый", r = 255, g = 255, b = 255},
        {name = "Красный", r = 255, g = 0, b = 0},
        {name = "Оранжевый", r = 255, g = 165, b = 0},
        {name = "Желтый", r = 255, g = 255, b = 0},
        {name = "Зеленый", r = 0, g = 255, b = 0},
        {name = "Голубой", r = 0, g = 255, b = 255},
        {name = "Синий", r = 0, g = 0, b = 255},
        {name = "Фиолетовый", r = 128, g = 0, b = 255},
        {name = "Розовый", r = 255, g = 192, b = 203},
    }
    
    for _, c in ipairs(colorList) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 55, 1, 0)
        btn.Text = c.name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamBold
        btn.BackgroundColor3 = Color3.fromRGB(c.r, c.g, c.b)
        btn.BackgroundTransparency = 0.2
        btn.BorderSizePixel = 0
        btn.Parent = colorScroll
        btn.MouseButton1Click:Connect(function()
            Settings.MenuColor = {c.r, c.g, c.b}
            frame.BackgroundColor3 = Color3.fromRGB(c.r, c.g, c.b)
            for _, child in ipairs(colorScroll:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundTransparency = 0.2
                end
            end
            btn.BackgroundTransparency = 0
        end)
        local cur = Settings.MenuColor
        if btn.BackgroundColor3 == Color3.fromRGB(cur[1], cur[2], cur[3]) then
            btn.BackgroundTransparency = 0
        end
    end
    colorScroll.CanvasSize = UDim2.new(0, #colorList * 60, 0, 0)
    
    -- ПРОЗРАЧНОСТЬ (КРАСИВЫЙ ПОЛЗУНОК)
    local transLabel = Instance.new("TextLabel")
    transLabel.Size = UDim2.new(1, -20, 0, 20)
    transLabel.Text = "🔲 Прозрачность: " .. Settings.Transparency
    transLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    transLabel.TextSize = 13
    transLabel.BackgroundTransparency = 1
    transLabel.Parent = settingsScroll
    
    local transSlider = Instance.new("Frame")
    transSlider.Size = UDim2.new(1, -20, 0, 20)
    transSlider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    transSlider.BackgroundTransparency = 0.5
    transSlider.BorderSizePixel = 0
    transSlider.Parent = settingsScroll
    
    local transFill = Instance.new("Frame")
    transFill.Size = UDim2.new(Settings.Transparency, 0, 1, 0)
    transFill.BackgroundColor3 = Color3.fromRGB(100, 70, 255)
    transFill.BorderSizePixel = 0
    transFill.Parent = transSlider
    
    local transHandle = Instance.new("TextButton")
    transHandle.Size = UDim2.new(0, 20, 1.5, 0)
    transHandle.Position = UDim2.new(Settings.Transparency, -10, 0, 0)
    transHandle.Text = ""
    transHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    transHandle.BorderSizePixel = 0
    transHandle.Parent = transSlider
    transHandle.BackgroundTransparency = 0.2
    
    local transDragging = false
    transHandle.MouseButton1Down:Connect(function()
        transDragging = true
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            transDragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and transDragging then
            local mouse = UserInputService:GetMouseLocation()
            local sliderPos = transSlider.AbsolutePosition
            local sliderSize = transSlider.AbsoluteSize
            local percent = math.clamp((mouse.X - sliderPos.X) / sliderSize.X, 0, 1)
            local newTrans = math.round(percent * 10) / 10
            newTrans = math.clamp(newTrans, 0, 1)
            Settings.Transparency = newTrans
            frame.BackgroundTransparency = newTrans
            transFill.Size = UDim2.new(newTrans, 0, 1, 0)
            transHandle.Position = UDim2.new(newTrans, -10, 0, 0)
            transLabel.Text = "🔲 Прозрачность: " .. newTrans
        end
    end)
end)

-- ============================================
-- 📋 СПИСОК ИГР
-- ============================================
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -120)
list.Position = UDim2.new(0, 10, 0, 104)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = list

-- КНОПКИ ИГР
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
    btn.Parent = list
    
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

task.wait(0.1)
local count = 0
for _, child in ipairs(list:GetChildren()) do
    if child:IsA("TextButton") then
        count = count + 1
    end
end
list.CanvasSize = UDim2.new(0, 0, 0, count * 36 + 10)

-- ПОИСК
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local search = string.lower(searchBox.Text)
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then
            local name = string.lower(child.Text)
            child.Visible = (search == "" or string.find(name, search))
        end
    end
end)

-- ============================================
-- 🔧 ЗАКРЫТИЕ ХАБА (КРЕСТИК СЛЕВА)
-- ============================================
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(0, 8, 0, 5)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.BackgroundTransparency = 1
close.Parent = frame

close.MouseEnter:Connect(function()
    close.TextColor3 = Color3.fromRGB(255, 50, 50)
end)
close.MouseLeave:Connect(function()
    close.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

close.MouseButton1Click:Connect(function()
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    screen:Destroy()
end)

print("✅ Lunar Hub v6.2 загружен! (" .. #Games .. " игр)")
print("🌙 Финальная версия с отдельной кнопкой луны!")

-- ============================================
-- 🌙 LUNAR HUB (С АВТО-ОБНОВЛЕНИЕМ V5.1)
-- by Ryzen
-- ============================================

-- ============================================
-- 🔄 АВТО-ОБНОВЛЕНИЕ
-- ============================================
local function selfUpdate()
    local currentVersion = "5.1"
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
    ["🔫 Шутеры"] = {
        {name = "Arena 1.8", link = "https://raw.githubusercontent.com/Lutosys/1.8arena/refs/heads/main/1.8arena.lua"},
        {name = "Forsaken", link = "https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB"},
        {name = "Rivals", link = "https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"},
        {name = "MM2", link = "https://raw.githubusercontent.com/pruzgar242-rgb/Update/refs/heads/main/out.lua%20(17).txt"},
        {name = "Prison Life", link = "https://rawscripts.net/raw/Prison-Life-serk4rx-script-239866"},
    },
    ["🌋 Приключения"] = {
        {name = "Rost Alpha", link = "https://pastefy.app/JNOgCLi6/raw?part="},
        {name = "Ink Game", link = "https://rawscripts.net/raw/Universal-Script-RINGTA-best-script-for-ink-game-206674"},
        {name = "Wallhop V4", link = "https://rawscripts.net/raw/Universal-Script-Nova-Wallhop-V4-206099"},
        {name = "Color or Die", link = "https://rawscripts.net/raw/Color-or-Die-Esp-12555"},
    },
    ["🔑 Премиум"] = {
        {name = "Rost Alpha Premium", link = "https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download"},
        {name = "Prison Life Premium", link = "https://rawscripts.net/raw/Prison-Life-Override-Hub-Silent-Aim-and-More-242218"},
    }
}

-- ============================================
-- 🔧 GUI С КОСМИЧЕСКИМ ЛОГОТИПОМ
-- ============================================
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ОСНОВНОЙ ФРЕЙМ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -210, 0.5, -280)
frame.BackgroundColor3 = Color3.fromRGB(8, 8, 20)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- ГРАДИЕНТ
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 20, 60)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18, 18, 48)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 20))
})
frame.UIGradient = gradient

-- НЕОНОВАЯ РАМКА
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 8, 1, 8)
glow.Position = UDim2.new(0, -4, 0, -4)
glow.BackgroundColor3 = Color3.fromRGB(180, 80, 255)
glow.BackgroundTransparency = 0.3
glow.BorderSizePixel = 0
glow.Parent = frame

local glowGradient = Instance.new("UIGradient")
glowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 50, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 255))
})
glow.UIGradient = glowGradient

local glowPulse = TweenService:Create(
    glow,
    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {BackgroundTransparency = 0.05}
)

local appearTween = TweenService:Create(
    frame,
    TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 420, 0, 580), BackgroundTransparency = 0}
)

-- ============================================
-- 🌙 ЛОГОТИП (КАРТИНКА)
-- ============================================
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 380, 0, 120)
logo.Position = UDim2.new(0.5, -190, 0, 10)
logo.BackgroundTransparency = 1
logo.Image = "https://i.imgur.com/YourImage.png" -- ВСТАВЬ СВОЮ ССЫЛКУ НА ЛОГОТИП
logo.ScaleType = Enum.ScaleType.Fit
logo.Parent = frame

-- НАЗВАНИЕ БЕЗ ВЕРСИИ
local logoTitle = Instance.new("TextLabel")
logoTitle.Size = UDim2.new(0, 380, 0, 50)
logoTitle.Position = UDim2.new(0.5, -190, 0, 45)
logoTitle.Text = "LUNAR HUB"
logoTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
logoTitle.TextSize = 28
logoTitle.Font = Enum.Font.GothamBold
logoTitle.BackgroundTransparency = 1
logoTitle.TextStrokeTransparency = 0.5
logoTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
logoTitle.Parent = frame

local subTitle = Instance.new("TextLabel")
subTitle.Size = UDim2.new(0, 380, 0, 25)
subTitle.Position = UDim2.new(0.5, -190, 0, 80)
subTitle.Text = "by Ryzen"
subTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
subTitle.TextSize = 14
subTitle.Font = Enum.Font.Gotham
subTitle.BackgroundTransparency = 1
subTitle.TextStrokeTransparency = 0.5
subTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
subTitle.Parent = frame

-- ============================================
-- 🔧 СЧЁТЧИК ИГР
-- ============================================
local totalGames = 0
for _, list in pairs(Games) do
    totalGames = totalGames + #list
end

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(0, 380, 0, 22)
sub.Position = UDim2.new(0.5, -190, 0, 135)
sub.Text = "📊 " .. totalGames .. " игр | by Ryzen"
sub.TextColor3 = Color3.fromRGB(190, 190, 240)
sub.TextSize = 13
sub.Font = Enum.Font.Gotham
sub.BackgroundTransparency = 1
sub.Parent = frame

-- ============================================
-- 🔧 ЗАКРЫТИЕ
-- ============================================
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 36, 0, 36)
close.Position = UDim2.new(1, -44, 0, 10)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 22
close.Font = Enum.Font.GothamBold
close.BackgroundTransparency = 1
close.Parent = frame

close.MouseEnter:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)
close.MouseLeave:Connect(function()
    TweenService:Create(close, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

close.MouseButton1Click:Connect(function()
    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    task.wait(0.4)
    screen:Destroy()
end)

-- ============================================
-- 🔧 ПОИСК И ВКЛАДКИ
-- ============================================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 32)
searchBox.Position = UDim2.new(0, 10, 0, 145)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
searchBox.BackgroundTransparency = 0.5
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "🔍 Поиск..."
searchBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 180)
searchBox.TextSize = 14
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClipsDescendants = true
searchBox.Parent = frame

local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -16, 0, 36)
tabsFrame.Position = UDim2.new(0, 8, 0, 182)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = frame

local tabList = Instance.new("ScrollingFrame")
tabList.Size = UDim2.new(1, 0, 1, 0)
tabList.BackgroundTransparency = 1
tabList.CanvasSize = UDim2.new(2, 0, 0, 0)
tabList.ScrollBarThickness = 3
tabList.HorizontalScrollBarInset = Enum.ScrollBarInset.None
tabList.Parent = tabsFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
tabLayout.Parent = tabList

-- СПИСОК ИГР
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -210)
list.Position = UDim2.new(0, 10, 0, 222)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 5
list.ScrollBarImageColor3 = Color3.fromRGB(120, 80, 200)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 6)
listLayout.Parent = list

local currentCategory = nil
local lastSearch = ""

-- КНОПКИ ИГР
local function createGameButton(data)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Text = data.name
    btn.TextColor3 = Color3.fromRGB(235, 235, 255)
    btn.TextSize = 15
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 0
    btn.Parent = list
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 15)
    padding.Parent = btn
    
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 30, 1, 0)
    arrow.Position = UDim2.new(1, -35, 0, 0)
    arrow.Text = "▶"
    arrow.TextColor3 = Color3.fromRGB(150, 100, 220)
    arrow.TextSize = 18
    arrow.BackgroundTransparency = 1
    arrow.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(70, 45, 115)}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(230, 150, 255)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2, BackgroundColor3 = Color3.fromRGB(25, 25, 55)}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 100, 220)}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳ Загрузка..."
        btn.BackgroundColor3 = Color3.fromRGB(70, 50, 30)
        arrow.Text = "⏳"
        task.wait(0.2)
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(data.link))()
        end)
        
        if success then
            btn.Text = "✅ " .. data.name
            btn.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
            arrow.Text = "✅"
        else
            btn.Text = "❌ " .. data.name
            btn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
            arrow.Text = "❌"
        end
        
        task.wait(1.5)
        btn.Text = data.name
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        arrow.Text = "▶"
    end)
end

local function updateList(category, search)
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local gamesToShow = {}
    
    if category and Games[category] then
        for _, game in ipairs(Games[category]) do
            table.insert(gamesToShow, game)
        end
    else
        for _, gameList in pairs(Games) do
            for _, game in ipairs(gameList) do
                table.insert(gamesToShow, game)
            end
        end
    end
    
    if search and search ~= "" then
        local filtered = {}
        local lower = string.lower(search)
        for _, game in ipairs(gamesToShow) do
            if string.find(string.lower(game.name), lower, 1, true) then
                table.insert(filtered, game)
            end
        end
        gamesToShow = filtered
    end
    
    table.sort(gamesToShow, function(a, b)
        return a.name < b.name
    end)
    
    for _, game in ipairs(gamesToShow) do
        createGameButton(game)
    end
    
    list.CanvasSize = UDim2.new(0, 0, 0, #gamesToShow * 44 + 10)
end

-- ВКЛАДКИ
for cat, _ in pairs(Games) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 130, 1, 0)
    btn.Text = cat
    btn.TextColor3 = Color3.fromRGB(200, 200, 240)
    btn.TextSize = 13
    btn.Font = Enum.Font.Gotham
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Parent = tabList
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(55, 40, 90)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if currentCategory ~= cat then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.3, BackgroundColor3 = Color3.fromRGB(25, 25, 50)}):Play()
        end
    end)
    
    btn.MouseButton1Click:Connect(function()
        currentCategory = cat
        for _, child in ipairs(tabList:GetChildren()) do
            if child:IsA("TextButton") then
                if child == btn then
                    child.BackgroundTransparency = 0
                    child.BackgroundColor3 = Color3.fromRGB(80, 50, 140)
                else
                    child.BackgroundTransparency = 0.3
                    child.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
                end
            end
        end
        updateList(currentCategory, lastSearch)
    end)
end

local first = next(Games)
if first then
    currentCategory = first
    for _, child in ipairs(tabList:GetChildren()) do
        if child:IsA("TextButton") and child.Text == first then
            child.BackgroundTransparency = 0
            child.BackgroundColor3 = Color3.fromRGB(80, 50, 140)
            break
        end
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    lastSearch = searchBox.Text
    updateList(currentCategory, lastSearch)
end)

-- ============================================
-- 🚀 ЗАПУСК
-- ============================================
updateList(currentCategory, "")
appearTween:Play()
glowPulse:Play()

print("✅ Lunar Hub v5.1 загружен! (" .. totalGames .. " игр)")
print("🌙 Космический логотип активирован!")

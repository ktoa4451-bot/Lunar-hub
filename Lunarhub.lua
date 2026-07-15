-- ============================================
-- 🌙 LUNAR HUB v5.0 (ИСПРАВЛЕННАЯ ВЕРСИЯ)
-- by Ryzen | СТАБИЛЬНОСТЬ + СТИЛЬ
-- ============================================

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

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
}

-- ============================================
-- 🔧 GUI (КРАСИВЫЙ И СТАБИЛЬНЫЙ)
-- ============================================
local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.ResetOnSpawn = false
screen.Parent = PlayerGui

-- ОСНОВНОЙ ФРЕЙМ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 500)
frame.Position = UDim2.new(0.5, -210, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 30)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- КРАСИВЫЙ ГРАДИЕНТ
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 20, 60)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18, 18, 48)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 35))
})
frame.UIGradient = gradient

-- НЕОНОВАЯ РАМКА
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 6, 1, 6)
glow.Position = UDim2.new(0, -3, 0, -3)
glow.BackgroundColor3 = Color3.fromRGB(180, 80, 255)
glow.BackgroundTransparency = 0.15
glow.BorderSizePixel = 0
glow.Parent = frame

local glowGradient = Instance.new("UIGradient")
glowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 50, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 255))
})
glow.UIGradient = glowGradient

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 55)
title.Position = UDim2.new(0, 0, 0, 8)
title.Text = "🌙 LUNAR HUB v5.0"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

-- СЧЁТЧИК
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 22)
sub.Position = UDim2.new(0, 0, 0, 55)
sub.Text = "📊 " .. #Games .. " игр | by Ryzen"
sub.TextColor3 = Color3.fromRGB(190, 190, 240)
sub.TextSize = 13
sub.Font = Enum.Font.Gotham
sub.BackgroundTransparency = 1
sub.Parent = frame

-- ЗАКРЫТИЕ
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 36, 0, 36)
close.Position = UDim2.new(1, -44, 0, 6)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 22
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
    screen:Destroy()
end)

-- СПИСОК ИГР
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -120)
list.Position = UDim2.new(0, 10, 0, 85)
list.BackgroundTransparency = 1
list.ScrollBarThickness = 6
list.ScrollBarImageColor3 = Color3.fromRGB(120, 80, 200)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 6)
listLayout.Parent = list

-- Автоматическое обновление размера Canvas
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    list.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

-- КРАСИВЫЕ КНОПКИ
for _, gameData in ipairs(Games) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Text = gameData.name
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
    
    -- СТРЕЛКА
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 30, 1, 0)
    arrow.Position = UDim2.new(1, -35, 0, 0)
    arrow.Text = "▶"
    arrow.TextColor3 = Color3.fromRGB(150, 100, 220)
    arrow.TextSize = 18
    arrow.BackgroundTransparency = 1
    arrow.Parent = btn
    
    -- ЭФФЕКТ НАВЕДЕНИЯ
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(70, 45, 115)
        arrow.TextColor3 = Color3.fromRGB(230, 150, 255)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.2
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        arrow.TextColor3 = Color3.fromRGB(150, 100, 220)
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳ Загрузка..."
        btn.BackgroundColor3 = Color3.fromRGB(70, 50, 30)
        arrow.Text = "⏳"
        task.wait(0.2)
        
        -- Используем глобальный объект game для загрузки
        local success, err = pcall(function()
            loadstring(game:HttpGet(gameData.link))()
        end)
        
        if success then
            btn.Text = "✅ " .. gameData.name
            btn.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
            arrow.Text = "✅"
        else
            btn.Text = "❌ " .. gameData.name
            btn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
            arrow.Text = "❌"
            warn("Ошибка загрузки скрипта для " .. gameData.name .. ": " .. tostring(err))
        end
        
        task.wait(1.5)
        btn.Text = gameData.name
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
        arrow.Text = "▶"
    end)
end

print("✅ Lunar Hub v5.0 загружен! (" .. #Games .. " игр)")
print("🌙 Финальная стабильная версия активирована!")

-- ============================================
-- 🌙 LUNAR HUB v4.8 (С АНИМАЦИЯМИ)
-- by Ryzen | СТАБИЛЬНОСТЬ + КРАСОТА
-- ============================================

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

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
-- 🔧 GUI С АНИМАЦИЯМИ
-- ============================================
local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ОСНОВНОЙ ФРЕЙМ (СКРЫТ ПРИ СТАРТЕ)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, -190, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(16, 16, 36)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- АНИМАЦИЯ ПОЯВЛЕНИЯ
local appearTween = TweenService:Create(
    frame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 380, 0, 480), BackgroundTransparency = 0}
)

-- НЕОНОВАЯ РАМКА (ПУЛЬСИРУЕТ)
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 6, 1, 6)
glow.Position = UDim2.new(0, -3, 0, -3)
glow.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
glow.BackgroundTransparency = 0.3
glow.BorderSizePixel = 0
glow.Parent = frame

local glowGradient = Instance.new("UIGradient")
glowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 80, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 120, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 80, 255))
})
glow.UIGradient = glowGradient

local glowPulse = TweenService:Create(
    glow,
    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {BackgroundTransparency = 0.05}
)

-- ГРАДИЕНТ
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 20, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 36))
})
frame.UIGradient = gradient

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌙 LUNAR HUB v4.8"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = frame

-- СЧЁТЧИК
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 20)
sub.Position = UDim2.new(0, 0, 0, 50)
sub.Text = "📊 " .. #Games .. " игр | by Ryzen"
sub.TextColor3 = Color3.fromRGB(180, 180, 220)
sub.TextSize = 13
sub.Font = Enum.Font.Gotham
sub.BackgroundTransparency = 1
sub.Parent = frame

-- ЗАКРЫТИЕ
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -40, 0, 5)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 20
close.Font = Enum.Font.Gotham
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

-- СПИСОК ИГР
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -100)
list.Position = UDim2.new(0, 10, 0, 75)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 5
list.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 140)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = list

-- КНОПКИ С АНИМАЦИЕЙ
for _, game in ipairs(Games) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.Text = game.name
    btn.TextColor3 = Color3.fromRGB(230, 230, 255)
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.Gotham
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 0
    btn.Parent = list
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 12)
    padding.Parent = btn
    
    -- СТРЕЛКА
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 30, 1, 0)
    arrow.Position = UDim2.new(1, -35, 0, 0)
    arrow.Text = "▶"
    arrow.TextColor3 = Color3.fromRGB(100, 100, 200)
    arrow.TextSize = 16
    arrow.BackgroundTransparency = 1
    arrow.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(55, 40, 85)}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 150, 255)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2, BackgroundColor3 = Color3.fromRGB(30, 30, 55)}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(100, 100, 200)}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳ Загрузка..."
        btn.BackgroundColor3 = Color3.fromRGB(70, 50, 30)
        arrow.Text = "⏳"
        task.wait(0.2)
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(game.link))()
        end)
        
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
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
        arrow.Text = "▶"
    end)
end

-- ОБНОВЛЯЕМ РАЗМЕР СПИСКА
task.wait(0.1)
local count = 0
for _, child in ipairs(list:GetChildren()) do
    if child:IsA("TextButton") then
        count = count + 1
    end
end
list.CanvasSize = UDim2.new(0, 0, 0, count * 39 + 10)

-- ЗАПУСК АНИМАЦИЙ
appearTween:Play()
glowPulse:Play()

print("✅ Lunar Hub v4.8 загружен! (" .. #Games .. " игр)")
print("🌙 Анимации активированы!")

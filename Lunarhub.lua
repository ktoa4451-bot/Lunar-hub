-- ============================================
-- 🌙 LUNAR HUB
-- by Ryzen | ГАРАНТИРОВАННО РАБОТАЕТ
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
-- 🔧 ПРОСТОЙ И КРАСИВЫЙ GUI
-- ============================================
local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 480)
frame.Position = UDim2.new(0.5, -200, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Active = true
frame.Draggable = true
frame.Parent = screen

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.Text = "🌙 LUNAR HUB"
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
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -42, 0, 8)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.BackgroundTransparency = 1
close.Parent = frame
close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ПОИСК
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 30)
searchBox.Position = UDim2.new(0, 10, 0, 85)
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

-- СПИСОК ИГР
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -110)
list.Position = UDim2.new(0, 10, 0, 120)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 5
list.ScrollBarImageColor3 = Color3.fromRGB(120, 80, 200)
list.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = list

-- КНОПКИ
for _, game in ipairs(Games) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.Text = game.name
    btn.TextColor3 = Color3.fromRGB(230, 230, 255)
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
    btn.BackgroundTransparency = 0.2
    btn.BorderSizePixel = 0
    btn.Parent = list
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 15)
    padding.Parent = btn
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Color3.fromRGB(55, 40, 85)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.2
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 55)
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "⏳ Загрузка..."
        btn.BackgroundColor3 = Color3.fromRGB(70, 50, 30)
        task.wait(0.2)
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(game.link))()
        end)
        
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

-- ОБНОВЛЯЕМ РАЗМЕР СПИСКА
task.wait(0.1)
local count = 0
for _, child in ipairs(list:GetChildren()) do
    if child:IsA("TextButton") then
        count = count + 1
    end
end
list.CanvasSize = UDim2.new(0, 0, 0, count * 39 + 10)

-- ПОИСК (РАБОТАЕТ)
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local search = string.lower(searchBox.Text)
    for _, child in ipairs(list:GetChildren()) do
        if child:IsA("TextButton") then
            local name = string.lower(child.Text)
            if search == "" or string.find(name, search) then
                child.Visible = true
            else
                child.Visible = false
            end
        end
    end
end)

print("✅ Lunar Hub загружен! (" .. #Games .. " игр)")

local scrollingFrame = script.Parent
local ui = scrollingFrame:FindFirstAncestorWhichIsA("ScreenGui")
local weapons = {}

local myPlayer = game.Players.LocalPlayer

for _, v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
	if v:IsA("Tool") and v:GetAttribute("Cost") and tonumber(v:GetAttribute("Cost")) then
		table.insert(weapons, v)
	end
end

local function refresh()
	for _, v in pairs(scrollingFrame:GetChildren()) do
		if v:IsA("ViewportFrame") then
			v:Destroy()
		end
	end

	for _, tool: Tool in pairs(weapons) do
		local owned = (myPlayer.Backpack:FindFirstChild(tool.Name) or myPlayer.Character:FindFirstChild(tool.Name)) ~= nil
		
		local item = script.Template:Clone()
		item.Parent = scrollingFrame
		item.Name = tool.Name
		item.Price.Text = tool:GetAttribute("Cost")
		item.Price.Size = UDim2.new(0, item.Price.TextBounds.X, 0, 20)
		item.Title.Text = string.upper(tool.Name)
		
		item.Price.Visible = not owned
		item.OwnedLabel.Visible = owned
    
		if not owned then
			item.Background.MouseButton1Click:Connect(function()
				ui.Click:Play()
				
				ui.ToolSelected.Value = tool
			end)
		end
	end
end

refresh()
ui.Refresh.Event:Connect(refresh)

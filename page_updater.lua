local frame = script.Parent
local ui = frame.Parent
local toolSelected = ui.ToolSelected

local myPlayer = game.Players.LocalPlayer
local myCharacter = myPlayer.Character or myPlayer.CharacterAdded:Wait()

local descriptionFrame = frame.Description
local infoFrame = frame.Info

local function changed()
	local tool = toolSelected.Value
	
	descriptionFrame.Visible = tool ~= nil
	infoFrame.Visible = tool ~= nil
	
	if tool then
		local isOwned = (myPlayer.StarterGear:FindFirstChild(tool.Name) or myPlayer.Backpack:FindFirstChild(tool.Name) or myCharacter:FindFirstChild(tool.Name)) ~= nil

		descriptionFrame.Buy.Visible = not isOwned
		descriptionFrame.OwnedLabel.Visible = isOwned
		
		descriptionFrame.Description.Text = tool:GetAttribute("Description") or "No description provided."
		infoFrame.Price.Text = tool:GetAttribute("Cost")
		infoFrame.Price.Size = UDim2.new(0, infoFrame.Price.TextBounds.X, 0, 20)
		
		infoFrame.Title.Text = string.upper(tool.Name)
	end
end

changed()
toolSelected.Changed:Connect(changed)

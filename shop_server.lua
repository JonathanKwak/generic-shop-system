local function addToInventory(tool: Tool, parent)
	local cloned = tool:Clone()
	cloned.Parent = parent
end

local function onItemBuy(player: Player, tool: Tool)
	if not tool then
		return "error"
	end
	
	if not tool:IsDescendantOf(game.ReplicatedStorage.Tools) then
		return "error"
	end
	
	local coins = player:WaitForChild("Coins")
	local cost = tool:GetAttribute("Cost")
	
	if coins.Value < cost then
		return "Not enough salt"
	end
	
	coins.Value -= cost
	
	addToInventory(tool, player.StarterGear)
	addToInventory(tool, player.Backpack)
	
	return "Success"
end

game.ReplicatedStorage.Remotes.Shop.BuyItem.OnServerInvoke = onItemBuy

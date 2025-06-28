local button = script.Parent
local buyRemote = game.ReplicatedStorage.Remotes.Shop.BuyItem
local ui = script:FindFirstAncestorWhichIsA("ScreenGui")

local debounce = false

local function onClick()
  if debounce then
    return
  end

  if ui.ToolSelected.Value == nil then
		return
	end
  
	debounce = true
	
	local result = buyRemote:InvokeServer(ui.ToolSelected.Value)
	if result then
		_G.Notification(result..".")
	end
	
	debounce = false
	
	if result == "Success" then
		ui.ToolSelected.Value = nil
		ui.Refresh:Fire()
	end
end

button.MouseButton1Click:Connect(onClick)

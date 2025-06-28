# Generic shop system

In most of the games I make, there includes a shop system that works similarly to what I include here. Consists of the client end that deals with UI generation and user inputs, and the server end that deals with verification and response to client input. 

## Gotchas
- A 'Tools' folder in ReplicatedStorage, that contains `Tool` objects
- Each `Tool` should have the attribute `Cost`, otherwise the tool will not be displayed as on-sale
- All .lua files are client-sided, except for `shop_server.lua`
- There exists an `ObjectValue` called `ToolSelected`. Its value is set whenever the player wants to load the page for that specific item to see more information about it.

## Features
- Generic, requires only minor modification to code to adapt to a game system
- Secure, malicious clients cannot manipulate prices or get items for free
- Easy to implement new features, simply state the price in the item's attributes or in a ModuleScript somewhere else
- Clicking on an item will load its description/stats onto a page, allowing the user to see further into the item
- Debounce to prevent issues with lag 'overlapping' client inputs
- Adds tools to the player's backpack but also their StarterGear, which will prevent items from destroying themselves if the player respawns

## Design
- Instead of manually creating each item cell to display them on sale, the system gets a list of all on-sale items and procedurally creates the cells
- ROBLOX features a built-in UI padding system that allows you to simply drag and drop UI elements, where it will be automatically put into a grid
- Developer input is designed to be minimal after full installation; all you need to do is create the tool, set its price and you're set!

## Known Issues
- Not compatible externally from ROBLOX Studio
- Must use the .rbxm provided, OR make sure the `RemoteEvent`s and `RemoteFunction`s are in place and referenced properly
- Dynamic adjustments to price (if there exists such a feature in your game) does not exist; rather they are fixed in place and set by the developer

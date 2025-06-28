# Generic shop system

In most of the games I make, there includes a shop system that works similarly to what I include here. Consists of the client end that deals with UI generation and user inputs, and the server end that deals with verification and response to client input. 

## Features
- Generic, requires only minor modification to code to adapt to a game system
- Secure, malicious clients cannot manipulate prices or get items for free
- Easy to implement new features, simply state the price in the item's attributes or in a ModuleScript somewhere else

## Design
- Instead of manually creating each item cell to display them on sale, the system gets a list of all on-sale items and procedurally creates the cells
- ROBLOX features a built-in UI padding system that allows you to simply drag and drop UI elements, where it will be automatically put into a grid
- Developer input is designed to be minimal after full installation; all you need to do is create the tool, set its price and you're set!

## Known Issues
- Not compatible externally from ROBLOX Studio
- Dynamic adjustments to price (if there exists such a feature in your game) does not exist; rather they are fixed in place and set by the developer

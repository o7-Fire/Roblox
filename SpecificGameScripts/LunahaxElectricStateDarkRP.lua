-- https://v3rmillion.net/showthread.php?tid=1102948
-- good script

--[[
	-> don't waste your money on athena, or any other script. <-
	Lunahax (Electric State DarkRP script) source release
	
	now there'll be no point in buying any ES script. 
	-> don't waste your money on athena, or any other script. <-
	every feature athena has/had is in here, including MANY more athena doesnt have
	car teleportation, wishbot (item selling bot), a working node copy (lolo), nodekill, item sniper (not too sure if athena has an item sniper tbh). just to name a few
	
	athena doesnt even have a nodecopy that can do resizable walls (at the time of posting this)
	they probably will do soon tho! wonder why :troll:
	
	athena/abena devs/mods or whatever spent a full 24 hours cracking this LMFAO, backstory:
	
	harry got salty because i said "i'd rather not sell to an athena mod" or something,
	but then he bought it on an alt (after i told him no on his main), but was using a roblox account he had walmart + cajun etc friends on LMFAO
	called him out for it, removed his key
	and then called me a scammer for not giving him a refund after i told him, before he used an alt to purchase, i am not selling to you.
	
	so, i decided, best course of action? to release my script, fully open source, give everyone a reason not to purchase ANY es script
	it'd affect their sales than it would mine, since i honestly do not care about money LMFAO
	hope this gets some of the stuff patched soon, since at that point, it'd affect every es script.
	
	this script is so messy, it will probably be pretty painful to read, dont expect it to be neat + organized, or even incredibly efficient
	my primary programming language is c# lol, bear that in mind when going thru this
	anywho i'd appreciate if yall could take the time to neg rep walmart and any of the other people involved in contributing to this
	
	auth/whitelist has been removed, to the average person: just paste this script into your executor and away you go.
	my discord: vyzia#2791
	
--]]

local ScreenGui = Instance.new("ScreenGui")
local mainMenuFrame = Instance.new("Frame")
local playerEspButton = Instance.new("TextButton")
local disableNlrButton = Instance.new("TextButton")
local mainHeaderText = Instance.new("TextLabel")
local mainDividerText = Instance.new("TextLabel")
local mainMenuCloseButton = Instance.new("TextButton")
local miscButton = Instance.new("TextButton")
local poweredText = Instance.new("TextLabel")
local playerListFrame = Instance.new("Frame")
local playerListScrollingFrame = Instance.new("ScrollingFrame")
local TextButtonPlaceholder = Instance.new("TextButton")
local TextButtonPlaceholder_2 = Instance.new("TextButton")
local TextButtonPlaceholder_3 = Instance.new("TextButton")
local playerListCloseButton = Instance.new("TextButton")
local playerListHeaderText = Instance.new("TextLabel")
local playerListDividerText = Instance.new("TextLabel")
local playerInfoFrame = Instance.new("Frame")
local playerInfoHeaderText = Instance.new("TextLabel")
local playerInfoDividerText = Instance.new("TextLabel")
local usernameInfoText = Instance.new("TextLabel")
local roleplayNameInfoText = Instance.new("TextLabel")
local hungerInfoText = Instance.new("TextLabel")
local karmaInfoText = Instance.new("TextLabel")
local playtimeInfoText = Instance.new("TextLabel")
local sChargesInfoText = Instance.new("TextLabel")
local moneyAmtInfoText = Instance.new("TextLabel")
local aureusInfoText = Instance.new("TextLabel")
local tpToPlayerButton = Instance.new("TextButton")
local excludeFromEspButton = Instance.new("TextButton")
local bankInfoText = Instance.new("TextLabel")
local inventoryInfoText = Instance.new("TextLabel")
local killPlayer = Instance.new("TextButton")
local spectatePlayerButton = Instance.new("TextButton")
local jobInfoText = Instance.new("TextLabel")
local friendButton = Instance.new("TextButton")
local enemyButton = Instance.new("TextButton")
local stealOutfitButton = Instance.new("TextButton")
local copyOutfitButton = Instance.new("TextButton")
local copyNodeSongButton = Instance.new("TextButton")
local specificEspButton = Instance.new("TextButton")
local flaggedInfoText = Instance.new("TextLabel")
local specificEarRapeButton = Instance.new("TextButton")
local copyNodeButton = Instance.new("TextButton")
local viewBackpackButton = Instance.new("TextButton")
local viewPermsButton = Instance.new("TextButton")
local heldItemInfoText = Instance.new("TextLabel")
local teleportVehicleTextButton = Instance.new("TextButton")
local playerListButton = Instance.new("TextButton")
local printerEspButton = Instance.new("TextButton")
local combatFrame = Instance.new("Frame")
local combatCloseButton = Instance.new("TextButton")
local combatHeaderText = Instance.new("TextLabel")
local combatDividerText = Instance.new("TextLabel")
local combatScrollingFrame = Instance.new("ScrollingFrame")
local aimbotButton = Instance.new("TextButton")
local autoDrinkButton = Instance.new("TextButton")
local infiniteClipButton = Instance.new("TextButton")
local onlyTargetFlaggedButton = Instance.new("TextButton")
local weaponMultiplierButton = Instance.new("TextButton")
local hitboxExpandButton = Instance.new("TextButton")
local rageAuraRedButton = Instance.new("TextButton")
local yellowRageAuraRedButton = Instance.new("TextButton")
local autoReloadButton = Instance.new("TextButton")
local flyJumpButton = Instance.new("TextButton")
local combatButton = Instance.new("TextButton")
local infiniteAmmoButton = Instance.new("TextButton")
local miscFrame = Instance.new("Frame")
local miscHeaderText = Instance.new("TextLabel")
local miscDividerText = Instance.new("TextLabel")
local miscCloseButton = Instance.new("TextButton")
local miscScrollingFrame = Instance.new("ScrollingFrame")
local clientJPButton = Instance.new("TextButton")
local deathReturnButton = Instance.new("TextButton")
local getInNearestCarButton = Instance.new("TextButton")
local itemSniperButton = Instance.new("TextButton")
local globalChatButton = Instance.new("TextButton")
local spywatchBypassButton = Instance.new("TextButton")
local unlockDoorsButton = Instance.new("TextButton")
local unlockPassengerButton = Instance.new("TextButton")
local nodeKillButton = Instance.new("TextButton")
local saveConfigButton = Instance.new("TextButton")
local loadConfigButton = Instance.new("TextButton")
local joinGameButton = Instance.new("TextButton")
local joinGameUserTextbox = Instance.new("TextBox")
local deathBarrierBypassButton = Instance.new("TextButton")
local speedHackButton = Instance.new("TextButton")
local stealOutfitFromTextButton = Instance.new("TextButton")
local friendEspButton = Instance.new("TextButton")
local enemyEspButton = Instance.new("TextButton")
local tpToBaseplateButton = Instance.new("TextButton")
local autoPrinterButton = Instance.new("TextButton")
local antiAfkButton = Instance.new("TextButton")
local autoCornFarmButton = Instance.new("TextButton")
local autoScavButton = Instance.new("TextButton")
local earRapePlayersButton = Instance.new("TextButton")
local wishBotButton = Instance.new("TextButton")
local autoAureusButton = Instance.new("TextButton")
local makeInvisibleButton = Instance.new("TextButton")
local assignHotkeyButton = Instance.new("TextButton")
local infiniteHungerButton = Instance.new("TextButton")
local scrollingNameButton = Instance.new("TextButton")
local textSpeedTextBox = Instance.new("TextBox")
local kickOnModJoinButton = Instance.new("TextButton")
local autoScrapFarmButton = Instance.new("TextButton")
local weatherFrame = Instance.new("Frame")
local weatherCloseButton = Instance.new("TextButton")
local weatherHeaderText = Instance.new("TextLabel")
local weatherDividerText = Instance.new("TextLabel")
local dayButton = Instance.new("TextButton")
local nightButton = Instance.new("TextButton")
local sandstormButton = Instance.new("TextButton")
local rainButton = Instance.new("TextButton")
local morningButton = Instance.new("TextButton")
local nuclearWinterButton = Instance.new("TextButton")
local warButton = Instance.new("TextButton")
local eveningButton = Instance.new("TextButton")
local weatherButton = Instance.new("TextButton")
local noclipButton = Instance.new("TextButton")
local crateEspButton = Instance.new("TextButton")
local entityEspButton = Instance.new("TextButton")
local clickTpButton = Instance.new("TextButton")
local storeAllItemsButton = Instance.new("TextButton")
local dispenserButton = Instance.new("TextButton")
local dispenserFrame = Instance.new("Frame")
local dispenserCloseButton = Instance.new("TextButton")
local dispenserHeaderText = Instance.new("TextLabel")
local dispenserDividerText = Instance.new("TextLabel")
local dispenserListScrollingFrame = Instance.new("ScrollingFrame")
local dTextButtonPlaceholder = Instance.new("TextButton")
local dTextButtonPlaceholder_2 = Instance.new("TextButton")
local dTextButtonPlaceholder_3 = Instance.new("TextButton")
local dispenserItemNameText = Instance.new("TextLabel")
local dispenserItemPriceText = Instance.new("TextLabel")
local dispenserItemCountText = Instance.new("TextLabel")
local teleportToDispenserButton = Instance.new("TextButton")
local notificationFrame = Instance.new("Frame")
local okNotificationButton = Instance.new("TextButton")
local notificationText = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

mainMenuFrame.Name = "mainMenuFrame"
mainMenuFrame.Parent = ScreenGui
mainMenuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainMenuFrame.BorderColor3 = Color3.fromRGB(239, 5, 255)
mainMenuFrame.BorderSizePixel = 3
mainMenuFrame.Position = UDim2.new(0.0170876663, 0, 0.542997539, 0)
mainMenuFrame.Size = UDim2.new(0, 267, 0, 349)
mainMenuFrame.Style = Enum.FrameStyle.ChatGreen

playerEspButton.Name = "playerEspButton"
playerEspButton.Parent = mainMenuFrame
playerEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerEspButton.Position = UDim2.new(-0.00806450844, 0, 0.126074508, 0)
playerEspButton.Size = UDim2.new(0, 119, 0, 34)
playerEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
playerEspButton.Font = Enum.Font.Ubuntu
playerEspButton.Text = "[OFF] Player ESP"
playerEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
playerEspButton.TextSize = 14.000

disableNlrButton.Name = "disableNlrButton"
disableNlrButton.Parent = mainMenuFrame
disableNlrButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
disableNlrButton.Position = UDim2.new(-0.00858050771, 0, 0.341555864, 0)
disableNlrButton.Size = UDim2.new(0, 119, 0, 34)
disableNlrButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
disableNlrButton.Font = Enum.Font.Ubuntu
disableNlrButton.Text = "[OFF] Disable NLR"
disableNlrButton.TextColor3 = Color3.fromRGB(0, 0, 0)
disableNlrButton.TextSize = 14.000

mainHeaderText.Name = "mainHeaderText"
mainHeaderText.Parent = mainMenuFrame
mainHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainHeaderText.BackgroundTransparency = 1.000
mainHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
mainHeaderText.Position = UDim2.new(0.0582546815, 0, -0.0580773652, 0)
mainHeaderText.Selectable = true
mainHeaderText.Size = UDim2.new(0, 200, 0, 50)
mainHeaderText.Font = Enum.Font.SourceSans
mainHeaderText.Text = "lunahax"
mainHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
mainHeaderText.TextSize = 50.000

mainDividerText.Name = "mainDividerText"
mainDividerText.Parent = mainMenuFrame
mainDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
mainDividerText.Position = UDim2.new(0.0847078636, 0, 0.100057304, 0)
mainDividerText.Size = UDim2.new(0, 189, 0, 0)
mainDividerText.Font = Enum.Font.SourceSans
mainDividerText.Text = ""
mainDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
mainDividerText.TextSize = 14.000

mainMenuCloseButton.Name = "mainMenuCloseButton"
mainMenuCloseButton.Parent = mainMenuFrame
mainMenuCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainMenuCloseButton.BackgroundTransparency = 1.000
mainMenuCloseButton.Position = UDim2.new(0.953999996, 0, -0.0599999987, 0)
mainMenuCloseButton.Size = UDim2.new(0, 29, 0, 30)
mainMenuCloseButton.Font = Enum.Font.SourceSans
mainMenuCloseButton.Text = "X"
mainMenuCloseButton.TextColor3 = Color3.fromRGB(255, 0, 4)
mainMenuCloseButton.TextSize = 21.000

miscButton.Name = "miscButton"
miscButton.Parent = mainMenuFrame
miscButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
miscButton.Position = UDim2.new(0.497553468, 0, 0.805157721, 0)
miscButton.Size = UDim2.new(0, 119, 0, 34)
miscButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
miscButton.Font = Enum.Font.Ubuntu
miscButton.Text = "Misc Options"
miscButton.TextColor3 = Color3.fromRGB(0, 0, 0)
miscButton.TextSize = 14.000

poweredText.Name = "poweredText"
poweredText.Parent = mainMenuFrame
poweredText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
poweredText.BackgroundTransparency = 1.000
poweredText.Position = UDim2.new(0.620000005, 0, 0.819000006, 0)
poweredText.Rotation = 90.000
poweredText.Size = UDim2.new(0, 200, 0, 50)
poweredText.Font = Enum.Font.SourceSans
poweredText.Text = "Powered by Luna™"
poweredText.TextColor3 = Color3.fromRGB(0, 0, 0)
poweredText.TextSize = 14.000

playerListFrame.Name = "playerListFrame"
playerListFrame.Parent = mainMenuFrame
playerListFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerListFrame.Position = UDim2.new(1.09671855, 0, -0.054441262, 0)
playerListFrame.Size = UDim2.new(0, 223, 0, 348)
playerListFrame.Style = Enum.FrameStyle.ChatBlue

playerListScrollingFrame.Name = "playerListScrollingFrame"
playerListScrollingFrame.Parent = playerListFrame
playerListScrollingFrame.Active = true
playerListScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerListScrollingFrame.BorderSizePixel = 0
playerListScrollingFrame.Position = UDim2.new(-0.0410000011, 0, 0.123999998, 0)
playerListScrollingFrame.Size = UDim2.new(0, 210, 0, 284)
playerListScrollingFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
playerListScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 10000)

TextButtonPlaceholder.Name = "TextButtonPlaceholder"
TextButtonPlaceholder.Parent = playerListScrollingFrame
TextButtonPlaceholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButtonPlaceholder.Size = UDim2.new(0, 200, 0, 50)
TextButtonPlaceholder.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
TextButtonPlaceholder.Font = Enum.Font.SourceSans
TextButtonPlaceholder.Text = "placeholder for name"
TextButtonPlaceholder.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButtonPlaceholder.TextSize = 17.000

TextButtonPlaceholder_2.Name = "TextButtonPlaceholder"
TextButtonPlaceholder_2.Parent = playerListScrollingFrame
TextButtonPlaceholder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButtonPlaceholder_2.Position = UDim2.new(0, 0, 0.0718390793, 0)
TextButtonPlaceholder_2.Size = UDim2.new(0, 200, 0, 50)
TextButtonPlaceholder_2.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
TextButtonPlaceholder_2.Font = Enum.Font.SourceSans
TextButtonPlaceholder_2.Text = "placeholder for name"
TextButtonPlaceholder_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButtonPlaceholder_2.TextSize = 17.000

TextButtonPlaceholder_3.Name = "TextButtonPlaceholder"
TextButtonPlaceholder_3.Parent = playerListScrollingFrame
TextButtonPlaceholder_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButtonPlaceholder_3.Position = UDim2.new(0, 0, 0.143678159, 0)
TextButtonPlaceholder_3.Size = UDim2.new(0, 200, 0, 50)
TextButtonPlaceholder_3.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
TextButtonPlaceholder_3.Font = Enum.Font.SourceSans
TextButtonPlaceholder_3.Text = "placeholder for name"
TextButtonPlaceholder_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButtonPlaceholder_3.TextSize = 17.000

playerListCloseButton.Name = "playerListCloseButton"
playerListCloseButton.Parent = playerListFrame
playerListCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerListCloseButton.BackgroundTransparency = 1.000
playerListCloseButton.Position = UDim2.new(0.968191862, 0, -0.0657471269, 0)
playerListCloseButton.Size = UDim2.new(0, 29, 0, 30)
playerListCloseButton.Font = Enum.Font.SourceSans
playerListCloseButton.Text = "X"
playerListCloseButton.TextColor3 = Color3.fromRGB(255, 0, 4)
playerListCloseButton.TextSize = 21.000

playerListHeaderText.Name = "playerListHeaderText"
playerListHeaderText.Parent = playerListFrame
playerListHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerListHeaderText.BackgroundTransparency = 1.000
playerListHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
playerListHeaderText.Position = UDim2.new(-0.0312298182, 0, -0.0580608957, 0)
playerListHeaderText.Selectable = true
playerListHeaderText.Size = UDim2.new(0, 200, 0, 50)
playerListHeaderText.Font = Enum.Font.SourceSans
playerListHeaderText.Text = "player list"
playerListHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
playerListHeaderText.TextSize = 50.000

playerListDividerText.Name = "playerListDividerText"
playerListDividerText.Parent = playerListFrame
playerListDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerListDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
playerListDividerText.Position = UDim2.new(-0.00477668084, 0, 0.10007377, 0)
playerListDividerText.Size = UDim2.new(0, 189, 0, 0)
playerListDividerText.Font = Enum.Font.SourceSans
playerListDividerText.Text = ""
playerListDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
playerListDividerText.TextSize = 14.000

playerInfoFrame.Name = "playerInfoFrame"
playerInfoFrame.Parent = playerListFrame
playerInfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerInfoFrame.Position = UDim2.new(1.11733031, 0, -0.0534218997, 0)
playerInfoFrame.Size = UDim2.new(0, 680, 0, 348)
playerInfoFrame.Style = Enum.FrameStyle.ChatRed

playerInfoHeaderText.Name = "playerInfoHeaderText"
playerInfoHeaderText.Parent = playerInfoFrame
playerInfoHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerInfoHeaderText.BackgroundTransparency = 1.000
playerInfoHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
playerInfoHeaderText.Position = UDim2.new(0.248507544, 0, -0.0551873296, 0)
playerInfoHeaderText.Selectable = true
playerInfoHeaderText.Size = UDim2.new(0, 200, 0, 50)
playerInfoHeaderText.Font = Enum.Font.SourceSans
playerInfoHeaderText.Text = "info"
playerInfoHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
playerInfoHeaderText.TextSize = 50.000

playerInfoDividerText.Name = "playerInfoDividerText"
playerInfoDividerText.Parent = playerInfoFrame
playerInfoDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerInfoDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
playerInfoDividerText.Position = UDim2.new(0.274960667, 0, 0.102947332, 0)
playerInfoDividerText.Size = UDim2.new(0, 189, 0, 0)
playerInfoDividerText.Font = Enum.Font.SourceSans
playerInfoDividerText.Text = ""
playerInfoDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
playerInfoDividerText.TextSize = 14.000

usernameInfoText.Name = "usernameInfoText"
usernameInfoText.Parent = playerInfoFrame
usernameInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
usernameInfoText.BackgroundTransparency = 1.000
usernameInfoText.Position = UDim2.new(-0.00966932438, 0, 0.118262619, 0)
usernameInfoText.Size = UDim2.new(0, 276, 0, 27)
usernameInfoText.Font = Enum.Font.SourceSans
usernameInfoText.Text = "Username:"
usernameInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
usernameInfoText.TextSize = 20.000
usernameInfoText.TextXAlignment = Enum.TextXAlignment.Left

roleplayNameInfoText.Name = "roleplayNameInfoText"
roleplayNameInfoText.Parent = playerInfoFrame
roleplayNameInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
roleplayNameInfoText.BackgroundTransparency = 1.000
roleplayNameInfoText.Position = UDim2.new(-0.00782035198, 0, 0.213778615, 0)
roleplayNameInfoText.Size = UDim2.new(0, 277, 0, 27)
roleplayNameInfoText.Font = Enum.Font.SourceSans
roleplayNameInfoText.Text = "Roleplay Name:"
roleplayNameInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
roleplayNameInfoText.TextSize = 20.000
roleplayNameInfoText.TextXAlignment = Enum.TextXAlignment.Left

hungerInfoText.Name = "hungerInfoText"
hungerInfoText.Parent = playerInfoFrame
hungerInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hungerInfoText.BackgroundTransparency = 1.000
hungerInfoText.Position = UDim2.new(-0.00657543354, 0, 0.413517207, 0)
hungerInfoText.Size = UDim2.new(0, 107, 0, 27)
hungerInfoText.Font = Enum.Font.SourceSans
hungerInfoText.Text = "Hunger:"
hungerInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
hungerInfoText.TextSize = 20.000
hungerInfoText.TextXAlignment = Enum.TextXAlignment.Left

karmaInfoText.Name = "karmaInfoText"
karmaInfoText.Parent = playerInfoFrame
karmaInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
karmaInfoText.BackgroundTransparency = 1.000
karmaInfoText.Position = UDim2.new(0.257005781, 0, 0.413011491, 0)
karmaInfoText.Size = UDim2.new(0, 105, 0, 27)
karmaInfoText.Font = Enum.Font.SourceSans
karmaInfoText.Text = "Karma:"
karmaInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
karmaInfoText.TextSize = 20.000
karmaInfoText.TextXAlignment = Enum.TextXAlignment.Left

playtimeInfoText.Name = "playtimeInfoText"
playtimeInfoText.Parent = playerInfoFrame
playtimeInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playtimeInfoText.BackgroundTransparency = 1.000
playtimeInfoText.Position = UDim2.new(0.257233232, 0, 0.515885115, 0)
playtimeInfoText.Size = UDim2.new(0, 105, 0, 27)
playtimeInfoText.Font = Enum.Font.SourceSans
playtimeInfoText.Text = "Playtime:"
playtimeInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
playtimeInfoText.TextSize = 20.000
playtimeInfoText.TextXAlignment = Enum.TextXAlignment.Left

sChargesInfoText.Name = "sChargesInfoText"
sChargesInfoText.Parent = playerInfoFrame
sChargesInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sChargesInfoText.BackgroundTransparency = 1.000
sChargesInfoText.Position = UDim2.new(-0.00682860427, 0, 0.515885115, 0)
sChargesInfoText.Size = UDim2.new(0, 107, 0, 27)
sChargesInfoText.Font = Enum.Font.SourceSans
sChargesInfoText.Text = "S Charges:"
sChargesInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
sChargesInfoText.TextSize = 20.000
sChargesInfoText.TextXAlignment = Enum.TextXAlignment.Left

moneyAmtInfoText.Name = "moneyAmtInfoText"
moneyAmtInfoText.Parent = playerInfoFrame
moneyAmtInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
moneyAmtInfoText.BackgroundTransparency = 1.000
moneyAmtInfoText.Position = UDim2.new(-0.00682860427, 0, 0.613586247, 0)
moneyAmtInfoText.Size = UDim2.new(0, 107, 0, 27)
moneyAmtInfoText.Font = Enum.Font.SourceSans
moneyAmtInfoText.Text = "$: "
moneyAmtInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
moneyAmtInfoText.TextSize = 20.000
moneyAmtInfoText.TextXAlignment = Enum.TextXAlignment.Left

aureusInfoText.Name = "aureusInfoText"
aureusInfoText.Parent = playerInfoFrame
aureusInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
aureusInfoText.BackgroundTransparency = 1.000
aureusInfoText.Position = UDim2.new(0.257233202, 0, 0.613586247, 0)
aureusInfoText.Size = UDim2.new(0, 105, 0, 27)
aureusInfoText.Font = Enum.Font.SourceSans
aureusInfoText.Text = "A$: "
aureusInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
aureusInfoText.TextSize = 20.000
aureusInfoText.TextXAlignment = Enum.TextXAlignment.Left

tpToPlayerButton.Name = "tpToPlayerButton"
tpToPlayerButton.Parent = playerInfoFrame
tpToPlayerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpToPlayerButton.Position = UDim2.new(0.657253444, 0, 0.111706704, 0)
tpToPlayerButton.Size = UDim2.new(0, 119, 0, 34)
tpToPlayerButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
tpToPlayerButton.Font = Enum.Font.Ubuntu
tpToPlayerButton.Text = "Teleport to Player"
tpToPlayerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
tpToPlayerButton.TextSize = 14.000

excludeFromEspButton.Name = "excludeFromEspButton"
excludeFromEspButton.Parent = playerInfoFrame
excludeFromEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
excludeFromEspButton.Position = UDim2.new(0.657253444, 0, 0.21802856, 0)
excludeFromEspButton.Size = UDim2.new(0, 119, 0, 34)
excludeFromEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
excludeFromEspButton.Font = Enum.Font.Ubuntu
excludeFromEspButton.Text = "Exclude from ESP"
excludeFromEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
excludeFromEspButton.TextSize = 14.000

bankInfoText.Name = "bankInfoText"
bankInfoText.Parent = playerInfoFrame
bankInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bankInfoText.BackgroundTransparency = 1.000
bankInfoText.Position = UDim2.new(-0.00728356838, 0, 0.842880726, 0)
bankInfoText.Size = UDim2.new(0, 423, 0, 40)
bankInfoText.Font = Enum.Font.SourceSans
bankInfoText.LineHeight = 2.000
bankInfoText.Text = "Bank:"
bankInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
bankInfoText.TextSize = 13.000
bankInfoText.TextWrapped = true
bankInfoText.TextXAlignment = Enum.TextXAlignment.Left

inventoryInfoText.Name = "inventoryInfoText"
inventoryInfoText.Parent = playerInfoFrame
inventoryInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inventoryInfoText.BackgroundTransparency = 1.000
inventoryInfoText.Position = UDim2.new(-0.00728356838, 0, 0.699202597, 0)
inventoryInfoText.Size = UDim2.new(0, 423, 0, 40)
inventoryInfoText.Font = Enum.Font.SourceSans
inventoryInfoText.LineHeight = 2.000
inventoryInfoText.Text = "Inventory: "
inventoryInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
inventoryInfoText.TextSize = 13.000
inventoryInfoText.TextWrapped = true
inventoryInfoText.TextXAlignment = Enum.TextXAlignment.Left

killPlayer.Name = "killPlayer"
killPlayer.Parent = playerInfoFrame
killPlayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
killPlayer.Position = UDim2.new(0.657253444, 0, 0.327223957, 0)
killPlayer.Size = UDim2.new(0, 119, 0, 34)
killPlayer.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
killPlayer.Font = Enum.Font.Ubuntu
killPlayer.Text = "Kill Player"
killPlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
killPlayer.TextSize = 15.000

spectatePlayerButton.Name = "spectatePlayerButton"
spectatePlayerButton.Parent = playerInfoFrame
spectatePlayerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
spectatePlayerButton.Position = UDim2.new(0.657253504, 0, 0.433545828, 0)
spectatePlayerButton.Size = UDim2.new(0, 119, 0, 34)
spectatePlayerButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
spectatePlayerButton.Font = Enum.Font.Ubuntu
spectatePlayerButton.Text = "[OFF] Spectate Player"
spectatePlayerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
spectatePlayerButton.TextSize = 11.000

jobInfoText.Name = "jobInfoText"
jobInfoText.Parent = playerInfoFrame
jobInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jobInfoText.BackgroundTransparency = 1.000
jobInfoText.Position = UDim2.new(-0.00782860629, 0, 0.315885067, 0)
jobInfoText.Size = UDim2.new(0, 216, 0, 27)
jobInfoText.Font = Enum.Font.SourceSans
jobInfoText.Text = "Job:"
jobInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
jobInfoText.TextSize = 20.000
jobInfoText.TextXAlignment = Enum.TextXAlignment.Left

friendButton.Name = "friendButton"
friendButton.Parent = playerInfoFrame
friendButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
friendButton.Position = UDim2.new(0.656059206, 0, 0.540136039, 0)
friendButton.Size = UDim2.new(0, 55, 0, 34)
friendButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
friendButton.Font = Enum.Font.Ubuntu
friendButton.Text = "Friend"
friendButton.TextColor3 = Color3.fromRGB(0, 0, 0)
friendButton.TextSize = 11.000

enemyButton.Name = "enemyButton"
enemyButton.Parent = playerInfoFrame
enemyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
enemyButton.Position = UDim2.new(0.755435884, 0, 0.540136039, 0)
enemyButton.Size = UDim2.new(0, 55, 0, 34)
enemyButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
enemyButton.Font = Enum.Font.Ubuntu
enemyButton.Text = "Enemy"
enemyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
enemyButton.TextSize = 11.000

stealOutfitButton.Name = "stealOutfitButton"
stealOutfitButton.Parent = playerInfoFrame
stealOutfitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stealOutfitButton.Position = UDim2.new(0.656436145, 0, 0.644616127, 0)
stealOutfitButton.Size = UDim2.new(0, 120, 0, 34)
stealOutfitButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
stealOutfitButton.Font = Enum.Font.Ubuntu
stealOutfitButton.Text = "Steal Outfit"
stealOutfitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
stealOutfitButton.TextSize = 16.000

copyOutfitButton.Name = "copyOutfitButton"
copyOutfitButton.Parent = playerInfoFrame
copyOutfitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
copyOutfitButton.Position = UDim2.new(0.656362534, 0, 0.750450075, 0)
copyOutfitButton.Size = UDim2.new(0, 119, 0, 34)
copyOutfitButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
copyOutfitButton.Font = Enum.Font.Ubuntu
copyOutfitButton.Text = "Copy outfit id's"
copyOutfitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
copyOutfitButton.TextSize = 15.000

copyNodeSongButton.Name = "copyNodeSongButton"
copyNodeSongButton.Parent = playerInfoFrame
copyNodeSongButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
copyNodeSongButton.Position = UDim2.new(0.657253444, 0, 0.858833194, 0)
copyNodeSongButton.Size = UDim2.new(0, 119, 0, 34)
copyNodeSongButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
copyNodeSongButton.Font = Enum.Font.Ubuntu
copyNodeSongButton.Text = "Copy node song"
copyNodeSongButton.TextColor3 = Color3.fromRGB(0, 0, 0)
copyNodeSongButton.TextSize = 14.000

specificEspButton.Name = "specificEspButton"
specificEspButton.Parent = playerInfoFrame
specificEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
specificEspButton.Position = UDim2.new(0.84107697, 0, 0.111706741, 0)
specificEspButton.Size = UDim2.new(0, 119, 0, 34)
specificEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
specificEspButton.Font = Enum.Font.Ubuntu
specificEspButton.Text = "ESP"
specificEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
specificEspButton.TextSize = 14.000

flaggedInfoText.Name = "flaggedInfoText"
flaggedInfoText.Parent = playerInfoFrame
flaggedInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flaggedInfoText.BackgroundTransparency = 1.000
flaggedInfoText.Position = UDim2.new(0.468770504, 0, 0.413011491, 0)
flaggedInfoText.Size = UDim2.new(0, 105, 0, 27)
flaggedInfoText.Font = Enum.Font.SourceSans
flaggedInfoText.Text = "Flagged?:"
flaggedInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
flaggedInfoText.TextSize = 20.000
flaggedInfoText.TextXAlignment = Enum.TextXAlignment.Left

specificEarRapeButton.Name = "specificEarRapeButton"
specificEarRapeButton.Parent = playerInfoFrame
specificEarRapeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
specificEarRapeButton.Position = UDim2.new(0.84107697, 0, 0.21802859, 0)
specificEarRapeButton.Size = UDim2.new(0, 119, 0, 34)
specificEarRapeButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
specificEarRapeButton.Font = Enum.Font.Ubuntu
specificEarRapeButton.Text = "Earrape Player"
specificEarRapeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
specificEarRapeButton.TextSize = 14.000

copyNodeButton.Name = "copyNodeButton"
copyNodeButton.Parent = playerInfoFrame
copyNodeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
copyNodeButton.Position = UDim2.new(0.838135779, 0, 0.327223986, 0)
copyNodeButton.Size = UDim2.new(0, 119, 0, 34)
copyNodeButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
copyNodeButton.Font = Enum.Font.Ubuntu
copyNodeButton.Text = "Copy Node"
copyNodeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
copyNodeButton.TextSize = 14.000

viewBackpackButton.Name = "viewBackpackButton"
viewBackpackButton.Parent = playerInfoFrame
viewBackpackButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
viewBackpackButton.Position = UDim2.new(0.838135779, 0, 0.433545828, 0)
viewBackpackButton.Size = UDim2.new(0, 119, 0, 34)
viewBackpackButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
viewBackpackButton.Font = Enum.Font.Ubuntu
viewBackpackButton.Text = "View Backpack"
viewBackpackButton.TextColor3 = Color3.fromRGB(0, 0, 0)
viewBackpackButton.TextSize = 14.000

viewPermsButton.Name = "viewPermsButton"
viewPermsButton.Parent = playerInfoFrame
viewPermsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
viewPermsButton.Position = UDim2.new(0.838135779, 0, 0.53986764, 0)
viewPermsButton.Size = UDim2.new(0, 119, 0, 34)
viewPermsButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
viewPermsButton.Font = Enum.Font.Ubuntu
viewPermsButton.Text = "View Perms"
viewPermsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
viewPermsButton.TextSize = 14.000

heldItemInfoText.Name = "heldItemInfoText"
heldItemInfoText.Parent = playerInfoFrame
heldItemInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
heldItemInfoText.BackgroundTransparency = 1.000
heldItemInfoText.Position = UDim2.new(0.46782577, 0, 0.224480763, 0)
heldItemInfoText.Size = UDim2.new(0, 105, 0, 55)
heldItemInfoText.Font = Enum.Font.SourceSans
heldItemInfoText.Text = "Held: "
heldItemInfoText.TextColor3 = Color3.fromRGB(0, 0, 0)
heldItemInfoText.TextSize = 13.000
heldItemInfoText.TextWrapped = true
heldItemInfoText.TextXAlignment = Enum.TextXAlignment.Left
heldItemInfoText.TextYAlignment = Enum.TextYAlignment.Top

teleportVehicleTextButton.Name = "teleportVehicleTextButton"
teleportVehicleTextButton.Parent = playerInfoFrame
teleportVehicleTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
teleportVehicleTextButton.Position = UDim2.new(0.838135779, 0, 0.643315911, 0)
teleportVehicleTextButton.Size = UDim2.new(0, 119, 0, 34)
teleportVehicleTextButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
teleportVehicleTextButton.Font = Enum.Font.Ubuntu
teleportVehicleTextButton.Text = "TP All cars to player"
teleportVehicleTextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
teleportVehicleTextButton.TextSize = 13.000

playerListButton.Name = "playerListButton"
playerListButton.Parent = mainMenuFrame
playerListButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerListButton.Position = UDim2.new(0.497553468, 0, 0.914040267, 0)
playerListButton.Size = UDim2.new(0, 119, 0, 34)
playerListButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
playerListButton.Font = Enum.Font.Ubuntu
playerListButton.Text = "Player List"
playerListButton.TextColor3 = Color3.fromRGB(0, 0, 0)
playerListButton.TextSize = 14.000

printerEspButton.Name = "printerEspButton"
printerEspButton.Parent = mainMenuFrame
printerEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
printerEspButton.Position = UDim2.new(0.505273402, 0, 0.128000006, 0)
printerEspButton.Size = UDim2.new(0, 119, 0, 34)
printerEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
printerEspButton.Font = Enum.Font.Ubuntu
printerEspButton.Text = "[OFF] Printer ESP"
printerEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
printerEspButton.TextSize = 14.000

combatFrame.Name = "combatFrame"
combatFrame.Parent = mainMenuFrame
combatFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
combatFrame.Position = UDim2.new(2.0782733, 0, -1.17147851, 0)
combatFrame.Size = UDim2.new(0, 223, 0, 348)
combatFrame.Style = Enum.FrameStyle.ChatBlue

combatCloseButton.Name = "combatCloseButton"
combatCloseButton.Parent = combatFrame
combatCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
combatCloseButton.BackgroundTransparency = 1.000
combatCloseButton.Position = UDim2.new(0.968191862, 0, -0.0657471269, 0)
combatCloseButton.Size = UDim2.new(0, 29, 0, 30)
combatCloseButton.Font = Enum.Font.SourceSans
combatCloseButton.Text = "X"
combatCloseButton.TextColor3 = Color3.fromRGB(255, 0, 4)
combatCloseButton.TextSize = 21.000

combatHeaderText.Name = "combatHeaderText"
combatHeaderText.Parent = combatFrame
combatHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
combatHeaderText.BackgroundTransparency = 1.000
combatHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
combatHeaderText.Position = UDim2.new(-0.0312298182, 0, -0.0580608957, 0)
combatHeaderText.Selectable = true
combatHeaderText.Size = UDim2.new(0, 200, 0, 50)
combatHeaderText.Font = Enum.Font.SourceSans
combatHeaderText.Text = "combat"
combatHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
combatHeaderText.TextSize = 50.000

combatDividerText.Name = "combatDividerText"
combatDividerText.Parent = combatFrame
combatDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
combatDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
combatDividerText.Position = UDim2.new(-0.00477668084, 0, 0.10007377, 0)
combatDividerText.Size = UDim2.new(0, 189, 0, 0)
combatDividerText.Font = Enum.Font.SourceSans
combatDividerText.Text = ""
combatDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
combatDividerText.TextSize = 14.000

combatScrollingFrame.Name = "combatScrollingFrame"
combatScrollingFrame.Parent = combatFrame
combatScrollingFrame.Active = true
combatScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
combatScrollingFrame.BorderSizePixel = 0
combatScrollingFrame.Position = UDim2.new(-0.0599999987, 0, 0.111000001, 0)
combatScrollingFrame.Size = UDim2.new(0, 213, 0, 287)

aimbotButton.Name = "aimbotButton"
aimbotButton.Parent = combatScrollingFrame
aimbotButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
aimbotButton.Position = UDim2.new(0.221687689, 0, 0.00988043286, 0)
aimbotButton.Size = UDim2.new(0, 119, 0, 34)
aimbotButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
aimbotButton.Font = Enum.Font.Ubuntu
aimbotButton.Text = "[OFF] (q) Aimbot"
aimbotButton.TextColor3 = Color3.fromRGB(0, 0, 0)
aimbotButton.TextSize = 14.000

autoDrinkButton.Name = "autoDrinkButton"
autoDrinkButton.Parent = combatScrollingFrame
autoDrinkButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoDrinkButton.Position = UDim2.new(0.221687689, 0, 0.0572942272, 0)
autoDrinkButton.Size = UDim2.new(0, 119, 0, 34)
autoDrinkButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoDrinkButton.Font = Enum.Font.Ubuntu
autoDrinkButton.Text = "[OFF] AutoDrink"
autoDrinkButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoDrinkButton.TextSize = 14.000

infiniteClipButton.Name = "infiniteClipButton"
infiniteClipButton.Parent = combatScrollingFrame
infiniteClipButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
infiniteClipButton.Position = UDim2.new(0.22191067, 0, 0.299880981, 0)
infiniteClipButton.Size = UDim2.new(0, 119, 0, 34)
infiniteClipButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
infiniteClipButton.Font = Enum.Font.Ubuntu
infiniteClipButton.Text = "[OFF] Infinite Clip"
infiniteClipButton.TextColor3 = Color3.fromRGB(0, 0, 0)
infiniteClipButton.TextSize = 14.000

onlyTargetFlaggedButton.Name = "onlyTargetFlaggedButton"
onlyTargetFlaggedButton.Parent = combatScrollingFrame
onlyTargetFlaggedButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
onlyTargetFlaggedButton.Position = UDim2.new(0.21742636, 0, 0.457926989, 0)
onlyTargetFlaggedButton.Size = UDim2.new(0, 119, 0, 34)
onlyTargetFlaggedButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
onlyTargetFlaggedButton.Font = Enum.Font.Ubuntu
onlyTargetFlaggedButton.Text = "[OFF] Only flagged"
onlyTargetFlaggedButton.TextColor3 = Color3.fromRGB(0, 0, 0)
onlyTargetFlaggedButton.TextSize = 11.000

weaponMultiplierButton.Name = "weaponMultiplierButton"
weaponMultiplierButton.Parent = combatScrollingFrame
weaponMultiplierButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weaponMultiplierButton.Position = UDim2.new(0.22191067, 0, 0.202179849, 0)
weaponMultiplierButton.Size = UDim2.new(0, 119, 0, 34)
weaponMultiplierButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
weaponMultiplierButton.Font = Enum.Font.Ubuntu
weaponMultiplierButton.Text = "[OFF] Weapon Multi"
weaponMultiplierButton.TextColor3 = Color3.fromRGB(0, 0, 0)
weaponMultiplierButton.TextSize = 11.000

hitboxExpandButton.Name = "hitboxExpandButton"
hitboxExpandButton.Parent = combatScrollingFrame
hitboxExpandButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hitboxExpandButton.Position = UDim2.new(0.22191067, 0, 0.251030445, 0)
hitboxExpandButton.Size = UDim2.new(0, 119, 0, 34)
hitboxExpandButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
hitboxExpandButton.Font = Enum.Font.Ubuntu
hitboxExpandButton.Text = "[OFF] Hitbox Expand"
hitboxExpandButton.TextColor3 = Color3.fromRGB(0, 0, 0)
hitboxExpandButton.TextSize = 11.000

rageAuraRedButton.Name = "rageAuraRedButton"
rageAuraRedButton.Parent = combatScrollingFrame
rageAuraRedButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rageAuraRedButton.Position = UDim2.new(0.22191067, 0, 0.104478672, 0)
rageAuraRedButton.Size = UDim2.new(0, 119, 0, 34)
rageAuraRedButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
rageAuraRedButton.Font = Enum.Font.Ubuntu
rageAuraRedButton.Text = "[OFF] Red RageAura"
rageAuraRedButton.TextColor3 = Color3.fromRGB(0, 0, 0)
rageAuraRedButton.TextSize = 13.000

yellowRageAuraRedButton.Name = "yellowRageAuraRedButton"
yellowRageAuraRedButton.Parent = combatScrollingFrame
yellowRageAuraRedButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
yellowRageAuraRedButton.Position = UDim2.new(0.22191067, 0, 0.153329238, 0)
yellowRageAuraRedButton.Size = UDim2.new(0, 119, 0, 34)
yellowRageAuraRedButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
yellowRageAuraRedButton.Font = Enum.Font.Ubuntu
yellowRageAuraRedButton.Text = "[OFF] Yellow RageAura"
yellowRageAuraRedButton.TextColor3 = Color3.fromRGB(0, 0, 0)
yellowRageAuraRedButton.TextSize = 11.000

autoReloadButton.Name = "autoReloadButton"
autoReloadButton.Parent = combatScrollingFrame
autoReloadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoReloadButton.Position = UDim2.new(0.22191067, 0, 0.348731548, 0)
autoReloadButton.Size = UDim2.new(0, 119, 0, 34)
autoReloadButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoReloadButton.Font = Enum.Font.Ubuntu
autoReloadButton.Text = "[OFF] AutoReload"
autoReloadButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoReloadButton.TextSize = 14.000

flyJumpButton.Name = "flyJumpButton"
flyJumpButton.Parent = mainMenuFrame
flyJumpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flyJumpButton.Position = UDim2.new(0.505044103, 0, 0.449856758, 0)
flyJumpButton.Size = UDim2.new(0, 119, 0, 34)
flyJumpButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
flyJumpButton.Font = Enum.Font.Ubuntu
flyJumpButton.Text = "[OFF] Fly Jump"
flyJumpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
flyJumpButton.TextSize = 14.000

combatButton.Name = "combatButton"
combatButton.Parent = mainMenuFrame
combatButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
combatButton.Position = UDim2.new(-0.0080645103, 0, 0.805157721, 0)
combatButton.Size = UDim2.new(0, 119, 0, 34)
combatButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
combatButton.Font = Enum.Font.Ubuntu
combatButton.Text = "Combat Options"
combatButton.TextColor3 = Color3.fromRGB(0, 0, 0)
combatButton.TextSize = 14.000

infiniteAmmoButton.Name = "infiniteAmmoButton"
infiniteAmmoButton.Parent = mainMenuFrame
infiniteAmmoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
infiniteAmmoButton.Position = UDim2.new(-0.0080645103, 0, 0.558739245, 0)
infiniteAmmoButton.Size = UDim2.new(0, 119, 0, 34)
infiniteAmmoButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
infiniteAmmoButton.Font = Enum.Font.Ubuntu
infiniteAmmoButton.Text = "[OFF] InfiniteAmmo"
infiniteAmmoButton.TextColor3 = Color3.fromRGB(0, 0, 0)
infiniteAmmoButton.TextSize = 14.000

miscFrame.Name = "miscFrame"
miscFrame.Parent = mainMenuFrame
miscFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
miscFrame.Position = UDim2.new(3.05954671, 0, -1.17147851, 0)
miscFrame.Size = UDim2.new(0, 223, 0, 348)
miscFrame.Style = Enum.FrameStyle.ChatBlue

miscHeaderText.Name = "miscHeaderText"
miscHeaderText.Parent = miscFrame
miscHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
miscHeaderText.BackgroundTransparency = 1.000
miscHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
miscHeaderText.Position = UDim2.new(-0.0312298182, 0, -0.0580608957, 0)
miscHeaderText.Selectable = true
miscHeaderText.Size = UDim2.new(0, 200, 0, 50)
miscHeaderText.Font = Enum.Font.SourceSans
miscHeaderText.Text = "misc"
miscHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
miscHeaderText.TextSize = 50.000

miscDividerText.Name = "miscDividerText"
miscDividerText.Parent = miscFrame
miscDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
miscDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
miscDividerText.Position = UDim2.new(-0.00477668084, 0, 0.10007377, 0)
miscDividerText.Size = UDim2.new(0, 189, 0, 0)
miscDividerText.Font = Enum.Font.SourceSans
miscDividerText.Text = ""
miscDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
miscDividerText.TextSize = 14.000

miscCloseButton.Name = "miscCloseButton"
miscCloseButton.Parent = miscFrame
miscCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
miscCloseButton.BackgroundTransparency = 1.000
miscCloseButton.Position = UDim2.new(0.968191862, 0, -0.0657471269, 0)
miscCloseButton.Size = UDim2.new(0, 29, 0, 30)
miscCloseButton.Font = Enum.Font.SourceSans
miscCloseButton.Text = "X"
miscCloseButton.TextColor3 = Color3.fromRGB(255, 0, 4)
miscCloseButton.TextSize = 21.000

miscScrollingFrame.Name = "miscScrollingFrame"
miscScrollingFrame.Parent = miscFrame
miscScrollingFrame.Active = true
miscScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
miscScrollingFrame.BorderSizePixel = 0
miscScrollingFrame.Position = UDim2.new(-0.0599999987, 0, 0.111000001, 0)
miscScrollingFrame.Size = UDim2.new(0, 213, 0, 287)
miscScrollingFrame.CanvasPosition = Vector2.new(0, 969)
miscScrollingFrame.CanvasSize = UDim2.new(0, 0, 4, 0)

clientJPButton.Name = "clientJPButton"
clientJPButton.Parent = miscScrollingFrame
clientJPButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
clientJPButton.Position = UDim2.new(0.217624456, 0, 0.105812728, 0)
clientJPButton.Size = UDim2.new(0, 119, 0, 34)
clientJPButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
clientJPButton.Font = Enum.Font.Ubuntu
clientJPButton.Text = "Client-side Jetpack"
clientJPButton.TextColor3 = Color3.fromRGB(0, 0, 0)
clientJPButton.TextSize = 14.000

deathReturnButton.Name = "deathReturnButton"
deathReturnButton.Parent = miscScrollingFrame
deathReturnButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
deathReturnButton.Position = UDim2.new(0.217834979, 0, 0.177651733, 0)
deathReturnButton.Size = UDim2.new(0, 119, 0, 34)
deathReturnButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
deathReturnButton.Font = Enum.Font.Ubuntu
deathReturnButton.Text = "[OFF] Death Return"
deathReturnButton.TextColor3 = Color3.fromRGB(0, 0, 0)
deathReturnButton.TextSize = 14.000

getInNearestCarButton.Name = "getInNearestCarButton"
getInNearestCarButton.Parent = miscScrollingFrame
getInNearestCarButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
getInNearestCarButton.Position = UDim2.new(0.217636913, 0, 0.00965109281, 0)
getInNearestCarButton.Size = UDim2.new(0, 119, 0, 34)
getInNearestCarButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
getInNearestCarButton.Font = Enum.Font.Ubuntu
getInNearestCarButton.Text = "Steal Nearest Car"
getInNearestCarButton.TextColor3 = Color3.fromRGB(0, 0, 0)
getInNearestCarButton.TextSize = 14.000

itemSniperButton.Name = "itemSniperButton"
itemSniperButton.Parent = miscScrollingFrame
itemSniperButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
itemSniperButton.Position = UDim2.new(0.217624441, 0, 0.130237967, 0)
itemSniperButton.Size = UDim2.new(0, 119, 0, 34)
itemSniperButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
itemSniperButton.Font = Enum.Font.Ubuntu
itemSniperButton.Text = "[OFF] Item Sniper"
itemSniperButton.TextColor3 = Color3.fromRGB(0, 0, 0)
itemSniperButton.TextSize = 14.000

globalChatButton.Name = "globalChatButton"
globalChatButton.Parent = miscScrollingFrame
globalChatButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
globalChatButton.Position = UDim2.new(0.217834964, 0, 0.153705388, 0)
globalChatButton.Size = UDim2.new(0, 119, 0, 34)
globalChatButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
globalChatButton.Font = Enum.Font.Ubuntu
globalChatButton.Text = "[OFF] Global chat"
globalChatButton.TextColor3 = Color3.fromRGB(0, 0, 0)
globalChatButton.TextSize = 14.000

spywatchBypassButton.Name = "spywatchBypassButton"
spywatchBypassButton.Parent = miscScrollingFrame
spywatchBypassButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
spywatchBypassButton.Position = UDim2.new(0.217624456, 0, 0.0811479762, 0)
spywatchBypassButton.Size = UDim2.new(0, 119, 0, 34)
spywatchBypassButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
spywatchBypassButton.Font = Enum.Font.Ubuntu
spywatchBypassButton.Text = "Spywatch Bypass"
spywatchBypassButton.TextColor3 = Color3.fromRGB(0, 0, 0)
spywatchBypassButton.TextSize = 14.000

unlockDoorsButton.Name = "unlockDoorsButton"
unlockDoorsButton.Parent = miscScrollingFrame
unlockDoorsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
unlockDoorsButton.Position = UDim2.new(0.217624426, 0, 0.0573676825, 0)
unlockDoorsButton.Size = UDim2.new(0, 119, 0, 34)
unlockDoorsButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
unlockDoorsButton.Font = Enum.Font.Ubuntu
unlockDoorsButton.Text = "Unlock all doors"
unlockDoorsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
unlockDoorsButton.TextSize = 14.000

unlockPassengerButton.Name = "unlockPassengerButton"
unlockPassengerButton.Parent = miscScrollingFrame
unlockPassengerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
unlockPassengerButton.Position = UDim2.new(0.217636913, 0, 0.0335974433, 0)
unlockPassengerButton.Size = UDim2.new(0, 119, 0, 34)
unlockPassengerButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
unlockPassengerButton.Font = Enum.Font.Ubuntu
unlockPassengerButton.Text = "Unlock All Passenger Seats"
unlockPassengerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
unlockPassengerButton.TextSize = 9.000

nodeKillButton.Name = "nodeKillButton"
nodeKillButton.Parent = miscScrollingFrame
nodeKillButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
nodeKillButton.Position = UDim2.new(0.217834979, 0, 0.201598048, 0)
nodeKillButton.Size = UDim2.new(0, 119, 0, 34)
nodeKillButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
nodeKillButton.Font = Enum.Font.Ubuntu
nodeKillButton.Text = "[OFF] NodeKill"
nodeKillButton.TextColor3 = Color3.fromRGB(0, 0, 0)
nodeKillButton.TextSize = 14.000

saveConfigButton.Name = "saveConfigButton"
saveConfigButton.Parent = miscScrollingFrame
saveConfigButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
saveConfigButton.Position = UDim2.new(0.222529814, 0, 0.67573607, 0)
saveConfigButton.Size = UDim2.new(0, 119, 0, 34)
saveConfigButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
saveConfigButton.Font = Enum.Font.Ubuntu
saveConfigButton.Text = "Save Config"
saveConfigButton.TextColor3 = Color3.fromRGB(0, 0, 0)
saveConfigButton.TextSize = 14.000

loadConfigButton.Name = "loadConfigButton"
loadConfigButton.Parent = miscScrollingFrame
loadConfigButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadConfigButton.Position = UDim2.new(0.222529829, 0, 0.699921906, 0)
loadConfigButton.Size = UDim2.new(0, 119, 0, 34)
loadConfigButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
loadConfigButton.Font = Enum.Font.Ubuntu
loadConfigButton.Text = "Load Config"
loadConfigButton.TextColor3 = Color3.fromRGB(0, 0, 0)
loadConfigButton.TextSize = 14.000

joinGameButton.Name = "joinGameButton"
joinGameButton.Parent = miscScrollingFrame
joinGameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
joinGameButton.Position = UDim2.new(0.222529829, 0, 0.767690063, 0)
joinGameButton.Size = UDim2.new(0, 119, 0, 34)
joinGameButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
joinGameButton.Font = Enum.Font.Ubuntu
joinGameButton.Text = "Join Game"
joinGameButton.TextColor3 = Color3.fromRGB(0, 0, 0)
joinGameButton.TextSize = 14.000

joinGameUserTextbox.Name = "joinGameUserTextbox"
joinGameUserTextbox.Parent = miscScrollingFrame
joinGameUserTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
joinGameUserTextbox.Position = UDim2.new(0.152287588, 0, 0.740868032, 0)
joinGameUserTextbox.Size = UDim2.new(0, 145, 0, 26)
joinGameUserTextbox.Font = Enum.Font.SourceSans
joinGameUserTextbox.PlaceholderText = "Username"
joinGameUserTextbox.Text = ""
joinGameUserTextbox.TextColor3 = Color3.fromRGB(0, 0, 0)
joinGameUserTextbox.TextSize = 14.000

deathBarrierBypassButton.Name = "deathBarrierBypassButton"
deathBarrierBypassButton.Parent = miscScrollingFrame
deathBarrierBypassButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
deathBarrierBypassButton.Position = UDim2.new(0.217834979, 0, 0.225544423, 0)
deathBarrierBypassButton.Size = UDim2.new(0, 119, 0, 34)
deathBarrierBypassButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
deathBarrierBypassButton.Font = Enum.Font.Ubuntu
deathBarrierBypassButton.Text = "[OFF] Bypass Barriers"
deathBarrierBypassButton.TextColor3 = Color3.fromRGB(0, 0, 0)
deathBarrierBypassButton.TextSize = 11.000

speedHackButton.Name = "speedHackButton"
speedHackButton.Parent = miscScrollingFrame
speedHackButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedHackButton.Position = UDim2.new(0.217834979, 0, 0.249490783, 0)
speedHackButton.Size = UDim2.new(0, 119, 0, 34)
speedHackButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
speedHackButton.Font = Enum.Font.Ubuntu
speedHackButton.Text = "[OFF] SpeedHack"
speedHackButton.TextColor3 = Color3.fromRGB(0, 0, 0)
speedHackButton.TextSize = 14.000

stealOutfitFromTextButton.Name = "stealOutfitFromTextButton"
stealOutfitFromTextButton.Parent = miscScrollingFrame
stealOutfitFromTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stealOutfitFromTextButton.Position = UDim2.new(0.222529829, 0, 0.791636527, 0)
stealOutfitFromTextButton.Size = UDim2.new(0, 119, 0, 34)
stealOutfitFromTextButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
stealOutfitFromTextButton.Font = Enum.Font.Ubuntu
stealOutfitFromTextButton.Text = "Steal Outfit"
stealOutfitFromTextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
stealOutfitFromTextButton.TextSize = 14.000

friendEspButton.Name = "friendEspButton"
friendEspButton.Parent = miscScrollingFrame
friendEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
friendEspButton.Position = UDim2.new(0.217834979, 0, 0.273437113, 0)
friendEspButton.Size = UDim2.new(0, 119, 0, 34)
friendEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
friendEspButton.Font = Enum.Font.Ubuntu
friendEspButton.Text = "[OFF] FriendESP"
friendEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
friendEspButton.TextSize = 14.000

enemyEspButton.Name = "enemyEspButton"
enemyEspButton.Parent = miscScrollingFrame
enemyEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
enemyEspButton.Position = UDim2.new(0.217834979, 0, 0.297622949, 0)
enemyEspButton.Size = UDim2.new(0, 119, 0, 34)
enemyEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
enemyEspButton.Font = Enum.Font.Ubuntu
enemyEspButton.Text = "[OFF] EnemyESP"
enemyEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
enemyEspButton.TextSize = 14.000

tpToBaseplateButton.Name = "tpToBaseplateButton"
tpToBaseplateButton.Parent = miscScrollingFrame
tpToBaseplateButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpToBaseplateButton.Position = UDim2.new(0.217834979, 0, 0.321569324, 0)
tpToBaseplateButton.Size = UDim2.new(0, 119, 0, 34)
tpToBaseplateButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
tpToBaseplateButton.Font = Enum.Font.Ubuntu
tpToBaseplateButton.Text = "TP to Baseplate"
tpToBaseplateButton.TextColor3 = Color3.fromRGB(0, 0, 0)
tpToBaseplateButton.TextSize = 14.000

autoPrinterButton.Name = "autoPrinterButton"
autoPrinterButton.Parent = miscScrollingFrame
autoPrinterButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoPrinterButton.Position = UDim2.new(0.217834994, 0, 0.443695754, 0)
autoPrinterButton.Size = UDim2.new(0, 119, 0, 34)
autoPrinterButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoPrinterButton.Font = Enum.Font.Ubuntu
autoPrinterButton.Text = "[OFF] AutoPrinter"
autoPrinterButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoPrinterButton.TextSize = 13.000

antiAfkButton.Name = "antiAfkButton"
antiAfkButton.Parent = miscScrollingFrame
antiAfkButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
antiAfkButton.Position = UDim2.new(0.217834979, 0, 0.369940937, 0)
antiAfkButton.Size = UDim2.new(0, 119, 0, 34)
antiAfkButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
antiAfkButton.Font = Enum.Font.Ubuntu
antiAfkButton.Text = "[OFF] AntiAFK"
antiAfkButton.TextColor3 = Color3.fromRGB(0, 0, 0)
antiAfkButton.TextSize = 14.000

autoCornFarmButton.Name = "autoCornFarmButton"
autoCornFarmButton.Parent = miscScrollingFrame
autoCornFarmButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoCornFarmButton.Position = UDim2.new(0.217834979, 0, 0.393887311, 0)
autoCornFarmButton.Size = UDim2.new(0, 119, 0, 34)
autoCornFarmButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoCornFarmButton.Font = Enum.Font.Ubuntu
autoCornFarmButton.Text = "[OFF] AutoCornFarm"
autoCornFarmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoCornFarmButton.TextSize = 13.000

autoScavButton.Name = "autoScavButton"
autoScavButton.Parent = miscScrollingFrame
autoScavButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoScavButton.Position = UDim2.new(0.217834994, 0, 0.417833686, 0)
autoScavButton.Size = UDim2.new(0, 119, 0, 34)
autoScavButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoScavButton.Font = Enum.Font.Ubuntu
autoScavButton.Text = "[OFF] AutoScav"
autoScavButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoScavButton.TextSize = 13.000

earRapePlayersButton.Name = "earRapePlayersButton"
earRapePlayersButton.Parent = miscScrollingFrame
earRapePlayersButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
earRapePlayersButton.Position = UDim2.new(0.222529814, 0, 0.516492724, 0)
earRapePlayersButton.Size = UDim2.new(0, 119, 0, 34)
earRapePlayersButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
earRapePlayersButton.Font = Enum.Font.Ubuntu
earRapePlayersButton.Text = "EarRape all players"
earRapePlayersButton.TextColor3 = Color3.fromRGB(0, 0, 0)
earRapePlayersButton.TextSize = 13.000

wishBotButton.Name = "wishBotButton"
wishBotButton.Parent = miscScrollingFrame
wishBotButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
wishBotButton.Position = UDim2.new(0.222529814, 0, 0.540439129, 0)
wishBotButton.Size = UDim2.new(0, 119, 0, 34)
wishBotButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
wishBotButton.Font = Enum.Font.Ubuntu
wishBotButton.Text = "[OFF] WishBot"
wishBotButton.TextColor3 = Color3.fromRGB(0, 0, 0)
wishBotButton.TextSize = 16.000

autoAureusButton.Name = "autoAureusButton"
autoAureusButton.Parent = miscScrollingFrame
autoAureusButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoAureusButton.Position = UDim2.new(0.222529814, 0, 0.491348952, 0)
autoAureusButton.Size = UDim2.new(0, 119, 0, 34)
autoAureusButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoAureusButton.Font = Enum.Font.Ubuntu
autoAureusButton.Text = "[OFF] AutoAureus"
autoAureusButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoAureusButton.TextSize = 13.000

makeInvisibleButton.Name = "makeInvisibleButton"
makeInvisibleButton.Parent = miscScrollingFrame
makeInvisibleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
makeInvisibleButton.Position = UDim2.new(0.222529814, 0, 0.564624965, 0)
makeInvisibleButton.Size = UDim2.new(0, 119, 0, 34)
makeInvisibleButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
makeInvisibleButton.Font = Enum.Font.Ubuntu
makeInvisibleButton.Text = "Make Invisible"
makeInvisibleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
makeInvisibleButton.TextSize = 15.000

assignHotkeyButton.Name = "assignHotkeyButton"
assignHotkeyButton.Parent = miscScrollingFrame
assignHotkeyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
assignHotkeyButton.Position = UDim2.new(0.217834979, 0, 0.589050233, 0)
assignHotkeyButton.Size = UDim2.new(0, 119, 0, 34)
assignHotkeyButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
assignHotkeyButton.Font = Enum.Font.Ubuntu
assignHotkeyButton.Text = "Assign Hotkey"
assignHotkeyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
assignHotkeyButton.TextSize = 15.000

infiniteHungerButton.Name = "infiniteHungerButton"
infiniteHungerButton.Parent = miscScrollingFrame
infiniteHungerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
infiniteHungerButton.Position = UDim2.new(0.217834979, 0, 0.345994622, 0)
infiniteHungerButton.Size = UDim2.new(0, 119, 0, 34)
infiniteHungerButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
infiniteHungerButton.Font = Enum.Font.Ubuntu
infiniteHungerButton.Text = "[OFF] InfiniteHunger"
infiniteHungerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
infiniteHungerButton.TextSize = 13.000

scrollingNameButton.Name = "scrollingNameButton"
scrollingNameButton.Parent = miscScrollingFrame
scrollingNameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingNameButton.Position = UDim2.new(0.217834979, 0, 0.613475502, 0)
scrollingNameButton.Size = UDim2.new(0, 80, 0, 34)
scrollingNameButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
scrollingNameButton.Font = Enum.Font.Ubuntu
scrollingNameButton.Text = "[OFF] ScrName"
scrollingNameButton.TextColor3 = Color3.fromRGB(0, 0, 0)
scrollingNameButton.TextSize = 10.000

textSpeedTextBox.Name = "textSpeedTextBox"
textSpeedTextBox.Parent = miscScrollingFrame
textSpeedTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textSpeedTextBox.BackgroundTransparency = 1.000
textSpeedTextBox.Position = UDim2.new(0.591549218, 0, 0.615936339, 0)
textSpeedTextBox.Size = UDim2.new(0, 34, 0, 26)
textSpeedTextBox.Font = Enum.Font.SourceSans
textSpeedTextBox.Text = "0.5"
textSpeedTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textSpeedTextBox.TextSize = 14.000

kickOnModJoinButton.Name = "kickOnModJoinButton"
kickOnModJoinButton.Parent = miscScrollingFrame
kickOnModJoinButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
kickOnModJoinButton.Position = UDim2.new(0.222529814, 0, 0.638619244, 0)
kickOnModJoinButton.Size = UDim2.new(0, 119, 0, 34)
kickOnModJoinButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
kickOnModJoinButton.Font = Enum.Font.Ubuntu
kickOnModJoinButton.Text = "[OFF]Kick on Mod Join"
kickOnModJoinButton.TextColor3 = Color3.fromRGB(0, 0, 0)
kickOnModJoinButton.TextSize = 11.000

autoScrapFarmButton.Name = "autoScrapFarmButton"
autoScrapFarmButton.Parent = miscScrollingFrame
autoScrapFarmButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoScrapFarmButton.Position = UDim2.new(0.217834994, 0, 0.468121052, 0)
autoScrapFarmButton.Size = UDim2.new(0, 119, 0, 34)
autoScrapFarmButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
autoScrapFarmButton.Font = Enum.Font.Ubuntu
autoScrapFarmButton.Text = "[OFF] AutoScrapFarm"
autoScrapFarmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoScrapFarmButton.TextSize = 13.000

weatherFrame.Name = "weatherFrame"
weatherFrame.Parent = mainMenuFrame
weatherFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weatherFrame.Position = UDim2.new(1.09699988, 0, -1.1686132, 0)
weatherFrame.Size = UDim2.new(0, 223, 0, 348)
weatherFrame.Style = Enum.FrameStyle.ChatBlue

weatherCloseButton.Name = "weatherCloseButton"
weatherCloseButton.Parent = weatherFrame
weatherCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weatherCloseButton.BackgroundTransparency = 1.000
weatherCloseButton.Position = UDim2.new(0.968191862, 0, -0.0657471269, 0)
weatherCloseButton.Size = UDim2.new(0, 29, 0, 30)
weatherCloseButton.Font = Enum.Font.SourceSans
weatherCloseButton.Text = "X"
weatherCloseButton.TextColor3 = Color3.fromRGB(255, 0, 4)
weatherCloseButton.TextSize = 21.000

weatherHeaderText.Name = "weatherHeaderText"
weatherHeaderText.Parent = weatherFrame
weatherHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weatherHeaderText.BackgroundTransparency = 1.000
weatherHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
weatherHeaderText.Position = UDim2.new(-0.0312298182, 0, -0.0580608957, 0)
weatherHeaderText.Selectable = true
weatherHeaderText.Size = UDim2.new(0, 200, 0, 50)
weatherHeaderText.Font = Enum.Font.SourceSans
weatherHeaderText.Text = "weather"
weatherHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
weatherHeaderText.TextSize = 50.000

weatherDividerText.Name = "weatherDividerText"
weatherDividerText.Parent = weatherFrame
weatherDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weatherDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
weatherDividerText.Position = UDim2.new(-0.00477668084, 0, 0.10007377, 0)
weatherDividerText.Size = UDim2.new(0, 189, 0, 0)
weatherDividerText.Font = Enum.Font.SourceSans
weatherDividerText.Text = ""
weatherDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
weatherDividerText.TextSize = 14.000

dayButton.Name = "dayButton"
dayButton.Parent = weatherFrame
dayButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dayButton.Position = UDim2.new(0.195211366, 0, 0.131246909, 0)
dayButton.Size = UDim2.new(0, 119, 0, 34)
dayButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
dayButton.Font = Enum.Font.Ubuntu
dayButton.Text = "Day"
dayButton.TextColor3 = Color3.fromRGB(0, 0, 0)
dayButton.TextSize = 20.000

nightButton.Name = "nightButton"
nightButton.Parent = weatherFrame
nightButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
nightButton.Position = UDim2.new(0.195211366, 0, 0.237568751, 0)
nightButton.Size = UDim2.new(0, 119, 0, 34)
nightButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
nightButton.Font = Enum.Font.Ubuntu
nightButton.Text = "Night"
nightButton.TextColor3 = Color3.fromRGB(0, 0, 0)
nightButton.TextSize = 20.000

sandstormButton.Name = "sandstormButton"
sandstormButton.Parent = weatherFrame
sandstormButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sandstormButton.Position = UDim2.new(0.190727055, 0, 0.450212449, 0)
sandstormButton.Size = UDim2.new(0, 119, 0, 34)
sandstormButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
sandstormButton.Font = Enum.Font.Ubuntu
sandstormButton.Text = "Sandstorm"
sandstormButton.TextColor3 = Color3.fromRGB(0, 0, 0)
sandstormButton.TextSize = 20.000

rainButton.Name = "rainButton"
rainButton.Parent = weatherFrame
rainButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rainButton.Position = UDim2.new(0.19072707, 0, 0.343890607, 0)
rainButton.Size = UDim2.new(0, 119, 0, 34)
rainButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
rainButton.Font = Enum.Font.Ubuntu
rainButton.Text = "Rain"
rainButton.TextColor3 = Color3.fromRGB(0, 0, 0)
rainButton.TextSize = 20.000

morningButton.Name = "morningButton"
morningButton.Parent = weatherFrame
morningButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
morningButton.Position = UDim2.new(0.19072707, 0, 0.55653429, 0)
morningButton.Size = UDim2.new(0, 119, 0, 34)
morningButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
morningButton.Font = Enum.Font.Ubuntu
morningButton.Text = "Morning"
morningButton.TextColor3 = Color3.fromRGB(0, 0, 0)
morningButton.TextSize = 20.000

nuclearWinterButton.Name = "nuclearWinterButton"
nuclearWinterButton.Parent = weatherFrame
nuclearWinterButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
nuclearWinterButton.Position = UDim2.new(0.19072707, 0, 0.659982562, 0)
nuclearWinterButton.Size = UDim2.new(0, 119, 0, 34)
nuclearWinterButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
nuclearWinterButton.Font = Enum.Font.Ubuntu
nuclearWinterButton.Text = "Nuclear Winter"
nuclearWinterButton.TextColor3 = Color3.fromRGB(0, 0, 0)
nuclearWinterButton.TextSize = 16.000

warButton.Name = "warButton"
warButton.Parent = weatherFrame
warButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
warButton.Position = UDim2.new(0.19072707, 0, 0.766304374, 0)
warButton.Size = UDim2.new(0, 119, 0, 34)
warButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
warButton.Font = Enum.Font.Ubuntu
warButton.Text = "War"
warButton.TextColor3 = Color3.fromRGB(0, 0, 0)
warButton.TextSize = 20.000

eveningButton.Name = "eveningButton"
eveningButton.Parent = weatherFrame
eveningButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
eveningButton.Position = UDim2.new(0.19072707, 0, 0.872626185, 0)
eveningButton.Size = UDim2.new(0, 119, 0, 34)
eveningButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
eveningButton.Font = Enum.Font.Ubuntu
eveningButton.Text = "Evening"
eveningButton.TextColor3 = Color3.fromRGB(0, 0, 0)
eveningButton.TextSize = 21.000

weatherButton.Name = "weatherButton"
weatherButton.Parent = mainMenuFrame
weatherButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
weatherButton.Position = UDim2.new(-0.0080645103, 0, 0.914040267, 0)
weatherButton.Size = UDim2.new(0, 119, 0, 34)
weatherButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
weatherButton.Font = Enum.Font.Ubuntu
weatherButton.Text = "Weather Options"
weatherButton.TextColor3 = Color3.fromRGB(0, 0, 0)
weatherButton.TextSize = 14.000

noclipButton.Name = "noclipButton"
noclipButton.Parent = mainMenuFrame
noclipButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.Position = UDim2.new(0.501528084, 0, 0.340034366, 0)
noclipButton.Size = UDim2.new(0, 119, 0, 34)
noclipButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
noclipButton.Font = Enum.Font.Ubuntu
noclipButton.Text = "[OFF] Noclip"
noclipButton.TextColor3 = Color3.fromRGB(0, 0, 0)
noclipButton.TextSize = 14.000

crateEspButton.Name = "crateEspButton"
crateEspButton.Parent = mainMenuFrame
crateEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
crateEspButton.Position = UDim2.new(-0.00783521123, 0, 0.234017208, 0)
crateEspButton.Size = UDim2.new(0, 119, 0, 34)
crateEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
crateEspButton.Font = Enum.Font.Ubuntu
crateEspButton.Text = "[OFF] Crate ESP"
crateEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
crateEspButton.TextSize = 14.000

entityEspButton.Name = "entityEspButton"
entityEspButton.Parent = mainMenuFrame
entityEspButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
entityEspButton.Position = UDim2.new(0.501528084, 0, 0.234017208, 0)
entityEspButton.Size = UDim2.new(0, 119, 0, 34)
entityEspButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
entityEspButton.Font = Enum.Font.Ubuntu
entityEspButton.Text = "[OFF] Entity ESP"
entityEspButton.TextColor3 = Color3.fromRGB(0, 0, 0)
entityEspButton.TextSize = 14.000

clickTpButton.Name = "clickTpButton"
clickTpButton.Parent = mainMenuFrame
clickTpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
clickTpButton.Position = UDim2.new(-0.00783521123, 0, 0.451782227, 0)
clickTpButton.Size = UDim2.new(0, 119, 0, 34)
clickTpButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
clickTpButton.Font = Enum.Font.Ubuntu
clickTpButton.Text = "[OFF] (x) MouseTP"
clickTpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
clickTpButton.TextSize = 14.000

storeAllItemsButton.Name = "storeAllItemsButton"
storeAllItemsButton.Parent = mainMenuFrame
storeAllItemsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
storeAllItemsButton.Position = UDim2.new(0.497553468, 0, 0.558739245, 0)
storeAllItemsButton.Size = UDim2.new(0, 119, 0, 34)
storeAllItemsButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
storeAllItemsButton.Font = Enum.Font.Ubuntu
storeAllItemsButton.Text = "Store All Items"
storeAllItemsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
storeAllItemsButton.TextSize = 14.000

dispenserButton.Name = "dispenserButton"
dispenserButton.Parent = mainMenuFrame
dispenserButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserButton.Position = UDim2.new(-0.00800000038, 0, 0.698000014, 0)
dispenserButton.Size = UDim2.new(0, 119, 0, 34)
dispenserButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
dispenserButton.Font = Enum.Font.Ubuntu
dispenserButton.Text = "Dispenser List"
dispenserButton.TextColor3 = Color3.fromRGB(0, 0, 0)
dispenserButton.TextSize = 14.000

dispenserFrame.Name = "dispenserFrame"
dispenserFrame.Parent = mainMenuFrame
dispenserFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserFrame.Position = UDim2.new(4.03332949, 0, -1.17147851, 0)
dispenserFrame.Size = UDim2.new(0, 223, 0, 348)
dispenserFrame.Style = Enum.FrameStyle.ChatBlue

dispenserCloseButton.Name = "dispenserCloseButton"
dispenserCloseButton.Parent = dispenserFrame
dispenserCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserCloseButton.BackgroundTransparency = 1.000
dispenserCloseButton.Position = UDim2.new(0.968191862, 0, -0.0657471269, 0)
dispenserCloseButton.Size = UDim2.new(0, 29, 0, 30)
dispenserCloseButton.Font = Enum.Font.SourceSans
dispenserCloseButton.Text = "X"
dispenserCloseButton.TextColor3 = Color3.fromRGB(255, 0, 4)
dispenserCloseButton.TextSize = 21.000

dispenserHeaderText.Name = "dispenserHeaderText"
dispenserHeaderText.Parent = dispenserFrame
dispenserHeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserHeaderText.BackgroundTransparency = 1.000
dispenserHeaderText.BorderColor3 = Color3.fromRGB(27, 42, 53)
dispenserHeaderText.Position = UDim2.new(-0.0312298182, 0, -0.0580608957, 0)
dispenserHeaderText.Selectable = true
dispenserHeaderText.Size = UDim2.new(0, 200, 0, 50)
dispenserHeaderText.Font = Enum.Font.SourceSans
dispenserHeaderText.Text = "dispensers"
dispenserHeaderText.TextColor3 = Color3.fromRGB(255, 0, 255)
dispenserHeaderText.TextSize = 50.000

dispenserDividerText.Name = "dispenserDividerText"
dispenserDividerText.Parent = dispenserFrame
dispenserDividerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserDividerText.BorderColor3 = Color3.fromRGB(170, 170, 255)
dispenserDividerText.Position = UDim2.new(-0.00477668084, 0, 0.10007377, 0)
dispenserDividerText.Size = UDim2.new(0, 189, 0, 0)
dispenserDividerText.Font = Enum.Font.SourceSans
dispenserDividerText.Text = ""
dispenserDividerText.TextColor3 = Color3.fromRGB(0, 0, 0)
dispenserDividerText.TextSize = 14.000

dispenserListScrollingFrame.Name = "dispenserListScrollingFrame"
dispenserListScrollingFrame.Parent = dispenserFrame
dispenserListScrollingFrame.Active = true
dispenserListScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserListScrollingFrame.BorderSizePixel = 0
dispenserListScrollingFrame.Position = UDim2.new(-0.0415362045, 0, 0.118475907, 0)
dispenserListScrollingFrame.Size = UDim2.new(0, 210, 0, 179)
dispenserListScrollingFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
dispenserListScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 10000)

dTextButtonPlaceholder.Name = "dTextButtonPlaceholder"
dTextButtonPlaceholder.Parent = dispenserListScrollingFrame
dTextButtonPlaceholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dTextButtonPlaceholder.Size = UDim2.new(0, 200, 0, 50)
dTextButtonPlaceholder.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
dTextButtonPlaceholder.Font = Enum.Font.SourceSans
dTextButtonPlaceholder.Text = "placeholder for name"
dTextButtonPlaceholder.TextColor3 = Color3.fromRGB(0, 0, 0)
dTextButtonPlaceholder.TextSize = 25.000

dTextButtonPlaceholder_2.Name = "dTextButtonPlaceholder"
dTextButtonPlaceholder_2.Parent = dispenserListScrollingFrame
dTextButtonPlaceholder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dTextButtonPlaceholder_2.Position = UDim2.new(0, 0, 0.0718390793, 0)
dTextButtonPlaceholder_2.Size = UDim2.new(0, 200, 0, 50)
dTextButtonPlaceholder_2.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
dTextButtonPlaceholder_2.Font = Enum.Font.SourceSans
dTextButtonPlaceholder_2.Text = "placeholder for name"
dTextButtonPlaceholder_2.TextColor3 = Color3.fromRGB(0, 0, 0)
dTextButtonPlaceholder_2.TextSize = 25.000

dTextButtonPlaceholder_3.Name = "dTextButtonPlaceholder"
dTextButtonPlaceholder_3.Parent = dispenserListScrollingFrame
dTextButtonPlaceholder_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dTextButtonPlaceholder_3.Position = UDim2.new(0, 0, 0.143678159, 0)
dTextButtonPlaceholder_3.Size = UDim2.new(0, 200, 0, 50)
dTextButtonPlaceholder_3.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
dTextButtonPlaceholder_3.Font = Enum.Font.SourceSans
dTextButtonPlaceholder_3.Text = "placeholder for name"
dTextButtonPlaceholder_3.TextColor3 = Color3.fromRGB(0, 0, 0)
dTextButtonPlaceholder_3.TextSize = 25.000

dispenserItemNameText.Name = "dispenserItemNameText"
dispenserItemNameText.Parent = dispenserFrame
dispenserItemNameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserItemNameText.BackgroundTransparency = 1.000
dispenserItemNameText.Position = UDim2.new(-0.0303210653, 0, 0.685142159, 0)
dispenserItemNameText.Size = UDim2.new(0, 211, 0, 23)
dispenserItemNameText.Font = Enum.Font.SourceSans
dispenserItemNameText.LineHeight = 2.000
dispenserItemNameText.Text = "Item:"
dispenserItemNameText.TextColor3 = Color3.fromRGB(0, 0, 0)
dispenserItemNameText.TextSize = 19.000
dispenserItemNameText.TextWrapped = true
dispenserItemNameText.TextXAlignment = Enum.TextXAlignment.Left

dispenserItemPriceText.Name = "dispenserItemPriceText"
dispenserItemPriceText.Parent = dispenserFrame
dispenserItemPriceText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserItemPriceText.BackgroundTransparency = 1.000
dispenserItemPriceText.Position = UDim2.new(-0.0303210653, 0, 0.762728333, 0)
dispenserItemPriceText.Size = UDim2.new(0, 211, 0, 23)
dispenserItemPriceText.Font = Enum.Font.SourceSans
dispenserItemPriceText.LineHeight = 2.000
dispenserItemPriceText.Text = "Price: "
dispenserItemPriceText.TextColor3 = Color3.fromRGB(0, 0, 0)
dispenserItemPriceText.TextSize = 19.000
dispenserItemPriceText.TextWrapped = true
dispenserItemPriceText.TextXAlignment = Enum.TextXAlignment.Left

dispenserItemCountText.Name = "dispenserItemCountText"
dispenserItemCountText.Parent = dispenserFrame
dispenserItemCountText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dispenserItemCountText.BackgroundTransparency = 1.000
dispenserItemCountText.Position = UDim2.new(-0.025836762, 0, 0.843188107, 0)
dispenserItemCountText.Size = UDim2.new(0, 211, 0, 23)
dispenserItemCountText.Font = Enum.Font.SourceSans
dispenserItemCountText.LineHeight = 2.000
dispenserItemCountText.Text = "Left: "
dispenserItemCountText.TextColor3 = Color3.fromRGB(0, 0, 0)
dispenserItemCountText.TextSize = 19.000
dispenserItemCountText.TextWrapped = true
dispenserItemCountText.TextXAlignment = Enum.TextXAlignment.Left

teleportToDispenserButton.Name = "teleportToDispenserButton"
teleportToDispenserButton.Parent = dispenserFrame
teleportToDispenserButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
teleportToDispenserButton.Position = UDim2.new(0.195370048, 0, 0.91630435, 0)
teleportToDispenserButton.Size = UDim2.new(0, 119, 0, 34)
teleportToDispenserButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
teleportToDispenserButton.Font = Enum.Font.Ubuntu
teleportToDispenserButton.Text = "Teleport"
teleportToDispenserButton.TextColor3 = Color3.fromRGB(0, 0, 0)
teleportToDispenserButton.TextSize = 14.000

notificationFrame.Name = "notificationFrame"
notificationFrame.Parent = ScreenGui
notificationFrame.BackgroundColor3 = Color3.fromRGB(175, 175, 175)
notificationFrame.Position = UDim2.new(0.35709089, 0, 0.378524482, 0)
notificationFrame.Size = UDim2.new(0, 393, 0, 180)
notificationFrame.Visible = false
notificationFrame.Style = Enum.FrameStyle.RobloxRound

okNotificationButton.Name = "okNotificationButton"
okNotificationButton.Parent = notificationFrame
okNotificationButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
okNotificationButton.Position = UDim2.new(0.339187264, 0, 0.803277612, 0)
okNotificationButton.Size = UDim2.new(0, 119, 0, 34)
okNotificationButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
okNotificationButton.Font = Enum.Font.Ubuntu
okNotificationButton.Text = "OK"
okNotificationButton.TextColor3 = Color3.fromRGB(0, 0, 0)
okNotificationButton.TextSize = 14.000

notificationText.Name = "notificationText"
notificationText.Parent = notificationFrame
notificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notificationText.BackgroundTransparency = 1.000
notificationText.Position = UDim2.new(0.0373392254, 0, 0.0460493304, 0)
notificationText.Size = UDim2.new(0, 347, 0, 105)
notificationText.Font = Enum.Font.SourceSans
notificationText.Text = "you shouldent see this, report this as a bug please."
notificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationText.TextSize = 17.000
notificationText.TextWrapped = true



-------------------------------- main gui stuff above



mainMenuFrame.Parent = nil
notificationFrame.Parent = nil
playerListFrame.Parent = nil
weatherFrame.Parent = nil
combatFrame.Parent = nil
miscFrame.Parent = nil
dispenserFrame.Parent = nil
notificationFrame.Visible = true;



------------------------------ auth stuff
local variables = {}


variables.hasAuthed = true;

variables.version = "202123022243";
_G.lhversion = variables.version;


variables.hasDoneCheck1 = false;
variables.hasDoneCheck2 = false;





pcall(function()
	if syn.request then
		function httprequesty(url)
			return syn.request({
				Url = url,
				Method = "GET" }).Body;
		end
	else
		function httprequesty(url)
			return game:HttpGet(url);
		end
	end
	variables.hasDoneCheck1 = true;
end)

if variables.hasDoneCheck1 == false then
	function httprequesty(url)
		return game:HttpGet(url);
	end
end



variables.lplayerauthname = game.Players.LocalPlayer.Name;







----------------------------------

if variables.hasAuthed then

	if _G.AlreadyLoaded then
		notice = Game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Note");
		notice:Fire("Lunahax", "Already loaded! Please re-start to reload!", 4);
	else
		mainMenuFrame.Parent = ScreenGui;
		mainMenuFrame.Visible = false;
		miscFrame.Parent = mainMenuFrame;
		combatFrame.Parent = mainMenuFrame;
		playerListFrame.Parent = mainMenuFrame;
		weatherFrame.Parent = mainMenuFrame;
		dispenserFrame.Parent = mainMenuFrame
		
		miscFrame.Visible = false;
		combatFrame.Visible = false;
		playerListFrame.Visible = false;
		weatherFrame.Visible = false;
		dispenserFrame.Visible = false
		
		_G.AlreadyLoaded = true;

		mainMenuFrame.Draggable = true;
		mainMenuFrame.Active = true;
		mainMenuFrame.Selectable = true;
		
		playerListFrame.Draggable = true;
		playerListFrame.Active = true;
		playerListFrame.Selectable = true;
		
		playerInfoFrame.Draggable = true;
		playerInfoFrame.Active = true;
		playerInfoFrame.Selectable = true;
		
		combatFrame.Draggable = true;
		combatFrame.Active = true;
		combatFrame.Selectable = true;
		
		miscFrame.Draggable = true;
		miscFrame.Active = true;
		miscFrame.Selectable = true;
		
		weatherFrame.Draggable = true;
		weatherFrame.Active = true;
		weatherFrame.Selectable = true;
		
		dispenserFrame.Draggable = true;
		dispenserFrame.Active = true;
		dispenserFrame.Selectable = true;
		

		variables.menuOpen = false;
		variables.dispenserListOpen = false;
		variables.playerListOpen = false;
		variables.weatherOptionsOpen = false;
		variables.combatOptionsOpen = false;
		variables.miscOptionsOpen = false;
		variables.espEnabled = false;
		variables.printerEspEnabled = false;
		_G.nlrLoop = false;
		variables.globRainbowColor3 = nil;
		variables.playerNameClicked = "";
		variables.dispClicked = nil;
		variables.espIgnored = { "" };
		local Holder = nil;
		variables.isNodeKillEnabled = false;
		variables.aimbotEnabled = false;
		local PHolder = nil;
		CHolder = nil;
		EHolder = nil;
		variables.clickTpEnabled = false;
		variables.flyJump = false;
		variables.noclipBool = false;
		variables.autoColaDrink = false;
		variables.itemSniperEnabled = false;
		variables.onlyFlagged = false;
		_G.redRageAuraEnabled = false;
		_G.yellowRageAuraEnabled = false;
		variables.globalChat = false;
		variables.deathReturnEnabled = false;
		variables.weaponMultiplierEnabled = false;
		variables.deathBarrierBypassEnabled = false;
		variables.hitboxExpandEnabled = false;
		variables.speedHackEnabled = false;
		variables.infiniteClipEnabled = false;
		variables.autoReloadEnabled = false;
		_G.weaponMultiplierEnabled = false;
		_G.deathBarrierBypassEnabled = false
		variables.antiAfkEnabled = false;
		variables.autoCornFarm = false;
		variables.autoScavEnabled = false;
		_G.wishBotEnabled = false;
		variables.infHunger = false;
		variables.scrollingNameEnabled = false;
		variables.scrollingName = "";
		variables.autoAureus = false;
		variables.kickOnModJoin = false;
		variables.autoScrapFarm = false;
		variables.autoPrinterFarm = false;
		
		variables.infSmgAmmo = false;
		variables.infRifAmmo = false;
		variables.infPisAmmo = false;

		notice = Game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Note");


		notice:Fire("Lunahax", "Welcome to Lunahax, Press C to open.");

		
		function makeBuffer(lenght)
			buffstr = "";
			for i=1,lenght do
				buffstr = buffstr .. " ";
			end
			return buffstr;
		end

		variables.scrollingName = game.Players.LocalPlayer.PlayerData.RoleplayName.Value;

		if string.len(variables.scrollingName) < 26 then
			bufferToApply = makeBuffer((25 - string.len(variables.scrollingName)))
			variables.scrollingName = variables.scrollingName .. bufferToApply;
		else
			variables.scrollingName = variables.scrollingName .. " ";
		end


		newName = "";
		
		spawn(function()
			while true do
				if variables.scrollingNameEnabled and game.Players.LocalPlayer.Flagged.Value == false then
					pcall(function()
						newName = variables.scrollingName;
						
						lastChar = string.sub(newName, -1);

						substring = newName:sub(1, #newName - 1)
						newName = lastChar .. substring;
						
						Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(8, { newName, "", false });
						variables.scrollingName = newName;
					end)
					wait(tonumber(textSpeedTextBox.Text));
				end
				wait();
			end
		end)
		
		
		if isfile == nil then
			function isfile(file)
				local fexistt = false;
				pcall(function()
					readfile(file);
					fexistt = true;
				end)
				return fexistt;
			end
		end

		if appendfile == nil then
			function appendfile(file, text)
				if isfile(file) then
					local filecontents = readfile(file);
					filecontents = filecontents .. text;
					writefile(file, filecontents)
				end
			end
		end
		
		modList = { 
			"2J0Y",
			"PsychoBuckett",
			"J_mey",
			"RayRacoon",
			"JumpyBageI",
			"Voyagr",
			"Artaniss",
			"RyIock",
			"Dj5826",
			"Edd_E"
		}
		function isUserEsMod(username)
			for i,v in pairs(modList) do
				if string.lower(username) == string.lower(v) then
					if variables.kickOnModJoin then
						game.Players.LocalPlayer:Kick("Moderator " .. username .. " joined your game, kicking you for safety!");
					end
					return true
				end
			end
			return false
		end


		function isUserFriend(username)
			validF = isfile("lunahaxFriends.txt")
			areTheyFriend = false;
			if validF then
				validF = isfile("lunahaxFriends.txt")
				if validF then
					contents = readfile("lunahaxFriends.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == username then
							areTheyFriend = true;
							break;
						end
					end
				end
			end
			return areTheyFriend;
		end
		
		function isUserEnemy(username)
			validF = isfile("lunahaxEnemies.txt")
			areTheyFriend = false;
			if validF then			
				validF = isfile("lunahaxEnemies.txt")
				if validF then
					contents = readfile("lunahaxEnemies.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == username then
							areTheyFriend = true;
							break;
						end
					end
				end
			end
			return areTheyFriend;
		end


		okNotificationButton.Activated:Connect(function()
			notificationFrame.Parent = nil;
		end)
		
		function showPopUpBox(text)
			notificationText.Text = text;
			notificationFrame.Parent = ScreenGui;			
		end
		
		
		
		-- menu open/close logic
		--main menu
		spawn(function()
			player = game.Players.LocalPlayer
			mouse = player:GetMouse()

			mouse.KeyDown:connect(function(key)
				if key == "x" then
					offsetzzz = CFrame.new(0, 3, 0)
					clientzzz = game:GetService("Players").LocalPlayer
					mousezzz = clientzzz:GetMouse()

					if variables.clickTpEnabled then
						tpDest = CFrame.new(mousezzz.Hit.Position) * offsetzzz;
						
						tpDestVect = Vector3.new(tpDest.X, tpDest.Y, tpDest.Z)
						
						characterzzz = clientzzz.Character or clientzzz.CharacterAdded:Wait()
						HumanoidRootPartzzz = characterzzz:WaitForChild("HumanoidRootPart")
						
						if (HumanoidRootPartzzz.Position - tpDestVect).magnitude > 500 then
						
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(mousezzz.Hit.Position) * offsetzzz)
						end
					end
				end
				
				if key == "c" then
					if variables.menuOpen then 
						mainMenuFrame.Visible = false;
						variables.menuOpen = false;
					else
						mainMenuFrame.Visible = true;
						variables.menuOpen = true;
					end
				end
			end)
		end);

		--x button on main menu
		mainMenuCloseButton.Activated:Connect(function()
			mainMenuFrame.Visible = false;
			variables.menuOpen = false;
		end)

		--x button on dispenser menu
		dispenserCloseButton.Activated:Connect(function()
			dispenserFrame.Visible = false;
			variables.dispenserListOpen = false;
		end)

		--x button on weather menu
		weatherCloseButton.Activated:Connect(function()
			weatherFrame.Visible = false;
			variables.weatherOptionsOpen = false;
		end)
		
		--x button on combat menu
		combatCloseButton.Activated:Connect(function()
			combatFrame.Visible = false;
			variables.combatOptionsOpen = false;
		end)
		
		--x button on misc menu
		miscCloseButton.Activated:Connect(function()
			miscFrame.Visible = false;
			variables.miscOptionsOpen = false;
		end)
		

		--x button on player list
		playerListCloseButton.Activated:Connect(function()
			playerListFrame.Visible = false;
			variables.playerListOpen = false;
		end)

		--player list button click
		playerListButton.Activated:Connect(function()
			if variables.playerListOpen then
				playerListFrame.Visible = false;
				variables.playerListOpen = false;
			else
				playerListFrame.Visible = true;
				variables.playerListOpen = true;
			end
		end)

		--weather button click
		weatherButton.Activated:Connect(function()
			if variables.weatherOptionsOpen then
				weatherFrame.Visible = false;
				variables.weatherOptionsOpen = false;
			else
				weatherFrame.Visible = true;
				variables.weatherOptionsOpen = true;
			end
		end)
		
		teleportVehicleTextButton.Activated:Connect(function()
			pcall(function()
				for i,v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
					pcall(function()
						cFrameRn = CFrame.new(Vector3.new(game.Players[variables.playerNameClicked].Character.HumanoidRootPart.CFrame.X, game.Players[variables.playerNameClicked].Character.HumanoidRootPart.CFrame.Y, game.Players[variables.playerNameClicked].Character.HumanoidRootPart.CFrame.Z))
						Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(v.VehicleSeat);
						for i, part in pairs(v:GetDescendants()) do
							pcall(function()
								pcall(function()
									part.CFrame = cFrameRn;
								end)
							end)
						end
					end)
				end
				notice:Fire("Lunahax", "Teleported all vehicles to player!");
			end)
		end)
		
		
		makeInvisibleButton.Activated:Connect(function()
			isdoneee = false;
			
			pcall(function()
				game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false;
				game.Players.LocalPlayer.Character.UpperTorso.Anchored = true;
				game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false;
				game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 0;
				isdoneee = true;
				notice:Fire("Lunahax", "Made your player invisible to others!");
			end)
			if isdoneee == false then
				notice:Fire("Lunahax", "Error! Maybe your already invisible?", 4);
			end
		end)
		
		
		isWaitingForClick = false;
		
		
		hotKeys = {};
		
		
		UserInputServiceaa = game:GetService("UserInputService");
									
									 
		function Input(input, gameProcessedEvent)
			for ilol, vlol in pairs(hotKeys) do
				if UserInputService:IsKeyDown(vlol[1]) then
					if not gameProcessedEvent then
						print("hotkey pressed");
						
						button = vlol[2];

						events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
						for iasda,vaaaa in pairs(events) do
							for iasdaa,vaaa in pairs(getconnections(button[vaaaa])) do
								vaaa:Fire()
							end
						end
						break;
					end
				end
			end
		end
		
		UserInputServiceaa.InputBegan:Connect(Input);
		
		assignHotkeyButton.Activated:Connect(function()
			notice:Fire("Lunahax", "Please press the key you'd like to bind now!");
			
			UserInputService = game:GetService("UserInputService")
			key = nil
			repeat key = UserInputService.InputEnded:Wait() until key.KeyCode ~= Enum.KeyCode.Unknown
			print(key.KeyCode)
			
			
			buttonPressed = "";
			frameMember = "";
			
			isWaitingForClick = true;
			
			notice:Fire("Lunahax", "Got input! Please wait...");
			
			
			
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui:GetDescendants()) do
				pcall(function()
					if v.ClassName == "TextButton" then
						v.Activated:Connect(function()
							if isWaitingForClick then
								isWaitingForClick = false;
								buttonPressed = v.Name;
								frameMember = v:GetFullName();
								
								ibuttonPressed = v.Name;
								frameMember = v:GetFullName();
								
								print("Got press!");
								
								table.insert(hotKeys, { key.KeyCode, v });
							end
						end)
					end
				end)
			end
			
			notice:Fire("Lunahax", "Please press the button you'd like to bind it to");
			
			while buttonPressed == "" do
				wait();
			end
			
			buttonPressed = "";
			frameMember = "";
			
			notice:Fire("Lunahax", "Added hotkey!");
			

			
			
		end)
		
		setsimulationradius(math.huge) -- l o l 
		
		--dispenser button click
		dispenserButton.Activated:Connect(function()
			if variables.dispenserListOpen then
				dispenserFrame.Visible = false;
				variables.dispenserListOpen = false;
			else
				dispenserFrame.Visible = true;
				variables.dispenserListOpen = true;
			end
		end)


		--misc button click
		miscButton.Activated:Connect(function()
			if variables.miscOptionsOpen then
				miscFrame.Visible = false;
				variables.miscOptionsOpen = false;
			else
				miscFrame.Visible = true;
				variables.miscOptionsOpen = true;
			end
		end)
		

		--combat button click
		combatButton.Activated:Connect(function()
			if variables.combatOptionsOpen then
				combatFrame.Visible = false;
				variables.combatOptionsOpen = false;
			else
				combatFrame.Visible = true;
				variables.combatOptionsOpen = true;
			end
		end)

		-- friend button
		friendButton.Activated:Connect(function()
			validF = isfile("lunahaxFriends.txt")
			if validF then
				isFriend = false;
				isEnemy = false;
				
				validF = isfile("lunahaxFriends.txt")
				if validF then
					contents = readfile("lunahaxFriends.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == variables.playerNameClicked then
							notice:Fire("Lunahax", "Already added " .. variables.playerNameClicked .. " to friends!");
							isFriend = true;
							break;
						end
					end
				end
				
				validE = isfile("lunahaxEnemies.txt")
				if validE then
					contentsE = readfile("lunahaxEnemies.txt");
					for line in contentsE:gmatch("[^\r\n]+") do
						if line == variables.playerNameClicked then
							writefile("lunahaxEnemies.txt", string.gsub(contentsE, variables.playerNameClicked, ""))
							break;
						end
					end
				end
				if isFriend == false then
					appendfile("lunahaxFriends.txt", variables.playerNameClicked .. "\n");
					notice:Fire("Lunahax", "Added " .. variables.playerNameClicked .. " to friends!");
				end
			else
				writefile("lunahaxFriends.txt", variables.playerNameClicked .. "\n");
				notice:Fire("Lunahax", "Added " .. variables.playerNameClicked .. " to friends!");
			end

			numbtest = 0;
			--repop
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				isFriend = false;
				isEnemy = false;
				
				validF = isfile("lunahaxFriends.txt")
				if validF then
					contents = readfile("lunahaxFriends.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == v.Name then
							isFriend = true;
							break;
						end
					end
				end
				validE = isfile("lunahaxEnemies.txt")
				if validE then
					contentsE = readfile("lunahaxEnemies.txt");
					for line in contentsE:gmatch("[^\r\n]+") do
						if line == v.Name then
							isEnemy = true;
							break;
						end
					end
				end
				
				
				newButton = Instance.new("TextButton")
				newButton.Parent = playerListScrollingFrame
				newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				newButton.Size = UDim2.new(0, 200, 0, 50)
				newButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
				newButton.Position = UDim2.new(0, 0, numbtest, 0);
				newButton.Font = Enum.Font.SourceSans
				newButton.Text = v.Name
				
				ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Parent = newButton
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(-0.0504394509, 0, -0.0461413562, 0)
				ImageLabel.Size = UDim2.new(0, 33, 0, 32)
				ImageLabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?userid=" .. v.UserId
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				
				if isEnemy then
					newButton.TextColor3 = Color3.fromRGB(255, 0, 0)
				elseif isFriend then
					newButton.TextColor3 = Color3.fromRGB(0, 255, 0)
				else
					newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				end
				newButton.TextSize = 25.000
				numbtest = numbtest + 0.005;
				newButton.Activated:Connect(function()
					variables.playerNameClicked = v.Name;
					populateWhenClicked();
				end)
			end
		end)
		
		
		HttpService = game:GetService("HttpService")
		
		function HttpGet(url)
			return HttpService:JSONDecode(httprequesty(url))
		end



		function Status(text)
			notice:Fire("Lunahax", text);
		end

		--join game button click
		joinGameButton.Activated:Connect(function()
			Status("Thank you synapse! Scanning games...")
			usernameToJoin = joinGameUserTextbox.Text
			UserId = game:GetService("Players"):GetUserIdFromNameAsync(usernameToJoin)
			
			Thumbnail = HttpGet("https://www.roblox.com/headshot-thumbnail/json?userId=" .. UserId .. "&width=48&height=48").Url
			
			local Index = 0
			while true do
				local GameInstances = HttpGet("https://loell.ca/api.php?startindex=" .. Index)
				for I,V in pairs(GameInstances.Collection) do
					for I2,V2 in pairs(V.CurrentPlayers) do
						if V2.Id == UserId or V2.Thumbnail.Url == Thumbnail then
							Status("Complete!")
							game:GetService("TeleportService"):TeleportToPlaceInstance(2262441883, V.Guid)
							local FailCounter = 0
							game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
								if State == Enum.TeleportState.Failed then
									FailCounter = FailCounter + 1
									Status("Failed to teleport. (retry " .. tostring(FailCounter) .. ")")
									game:GetService("TeleportService"):TeleportToPlaceInstance(2262441883, V.Guid)
								end
							end)
							return
						end
					end
				end
				Status("Stage 3 (" .. tostring(Index) .. "/" .. tostring(GameInstances.TotalCollectionSize) .. " servers scanned)...")
				if Index > GameInstances.TotalCollectionSize then
					return Status("Failed to get user's game!")
				end
				if Kill then
					Kill = false
					Debounce = false
					Status("Cancelled.")
					return
				end
				Index = Index + 10
			end
		end)
		
		
		
		
		-- store items button
		storeAllItemsButton.Activated:Connect(function()
			function GetClosestItem()
				local lplayer = game.Players.LocalPlayer
				local Character = lplayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				if not (Character or HumanoidRootPart) then return end
				local TargetDistance = math.huge
				local Target
				for i,v in ipairs(game:GetService("Workspace").Entities:GetChildren()) do
					pcall(function()
						local mesh = nil;	
						pcall(function()
							if v.ManualWeld.Name ~= "" then
								mesh = v.ManualWeld
							end
						end)
						if mesh == nil then
							mesh = v.Handle
						end
						if mesh then
							local TargetHRP = mesh
							local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
							if mag < TargetDistance then
								TargetDistance = mag
								Target = v
							end
						end
					end)
				end

				return Target
			end
			
			local player = game.Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local hum = character.Humanoid
			local rs = game:GetService("RunService")

			if hum.FloorMaterial ~= nil and hum.FloorMaterial ~= Enum.Material.Air then
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					local amtInInv = tonumber(string.split(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Client.Inventory.Slots.Amt.Text, "/")[1]);
					if amtInInv >= 11 then
					
					else
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
						wait(0.1)
						Game:GetService("ReplicatedStorage").Events.WeaponBackEvent:FireServer(true, v.Name)
						wait(0.1)
						Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(1)
						wait(0.1)
						Game:GetService("ReplicatedStorage").Events.WeaponBackEvent:FireServer(false, v.Name)
						wait(0.1)
						Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItem())
						wait(0.1)
					end
				end
				wait(0.1)
				Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItem())
				wait(0.1)
				Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItem())
				wait(0.1)
				Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItem())
				wait(0.1)
				Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItem())
				notice:Fire("Lunahax", "Stored your items!");
			else
				notice:Fire("Lunahax", "Please stand on the ground to store!", 4);
			end
		end)
		
		
		function split(s, delimiter)
			result = {};
			for match in (s..delimiter):gmatch("(.-)"..delimiter) do
				table.insert(result, match);
			end
			return result;
		end

		
		
		saveConfigButton.Activated:Connect(function()
			local configFile = "";
			configFile = configFile .. "variables.espEnabled=" .. tostring(variables.espEnabled) .. "\n"
			configFile = configFile .. "variables.printerEspEnabled=" .. tostring(variables.printerEspEnabled) .. "\n"
			configFile = configFile .. "crateEspEnabled=" .. tostring(crateEspEnabled) .. "\n"
			configFile = configFile .. "entityEspEnabled=" .. tostring(entityEspEnabled) .. "\n"
			configFile = configFile .. "_G.nlrLoop=" .. tostring(_G.nlrLoop) .. "\n"
			configFile = configFile .. "variables.isNodeKillEnabled=" .. tostring(variables.isNodeKillEnabled) .. "\n"
			configFile = configFile .. "variables.aimbotEnabled=" .. tostring(variables.aimbotEnabled) .. "\n"
			configFile = configFile .. "variables.clickTpEnabled=" .. tostring(variables.clickTpEnabled) .. "\n"
			configFile = configFile .. "variables.flyJump=" .. tostring(variables.flyJump) .. "\n"
			configFile = configFile .. "variables.noclipBool=" .. tostring(variables.noclipBool) .. "\n"
			configFile = configFile .. "variables.autoColaDrink=" .. tostring(variables.autoColaDrink) .. "\n"
			configFile = configFile .. "variables.itemSniperEnabled=" .. tostring(variables.itemSniperEnabled) .. "\n"
			configFile = configFile .. "variables.onlyFlagged=" .. tostring(variables.onlyFlagged) .. "\n"
			configFile = configFile .. "_G.redRageAuraEnabled=" .. tostring(_G.redRageAuraEnabled) .. "\n"
			configFile = configFile .. "_G.yellowRageAuraEnabled=" .. tostring(_G.yellowRageAuraEnabled) .. "\n"
			configFile = configFile .. "variables.globalChat=" .. tostring(variables.globalChat) .. "\n"
			configFile = configFile .. "variables.deathReturnEnabled=" .. tostring(variables.deathReturnEnabled) .. "\n"
			configFile = configFile .. "infiniteAmmo=" .. tostring(variables.infSmgAmmo) .. "\n"
			configFile = configFile .. "variables.weaponMultiplierEnabled=" .. tostring(variables.weaponMultiplierEnabled) .. "\n"
			configFile = configFile .. "variables.deathBarrierBypassEnabled=" .. tostring(variables.deathBarrierBypassEnabled) .. "\n"
			configFile = configFile .. "variables.speedHackEnabled=" .. tostring(variables.speedHackEnabled) .. "\n"
			writefile("lunahaxConfig.txt", configFile)
			notice:Fire("Lunahax", "Config saved!");
		end)

		-- enemy button
		enemyButton.Activated:Connect(function()
			local validE = isfile("lunahaxEnemies.txt")
			if validE then
				local isFriend = false;
				local isEnemy = false;
				
				local validF = isfile("lunahaxFriends.txt")
				if validF then
					local contents = readfile("lunahaxFriends.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == variables.playerNameClicked then
							writefile("lunahaxFriends.txt", string.gsub(contents, variables.playerNameClicked, ""))
							break;
						end
					end
				end
				
				if validE then
					local contentsE = readfile("lunahaxEnemies.txt");
					for line in contentsE:gmatch("[^\r\n]+") do
						if line == variables.playerNameClicked then
							notice:Fire("Lunahax", "Already added " .. variables.playerNameClicked .. " to enemies!");
							isEnemy = true;
							break;
						end
					end
				end
				if isEnemy == false then
					appendfile("lunahaxEnemies.txt", variables.playerNameClicked .. "\n");
					notice:Fire("Lunahax", "Added " .. variables.playerNameClicked .. " to enemies!");
				end
			else
				writefile("lunahaxEnemies.txt", variables.playerNameClicked .. "\n");
				notice:Fire("Lunahax", "Added " .. variables.playerNameClicked .. " to enemies!");
			end

			
			local numbtest = 0;
			--repop
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local isFriend = false;
				local isEnemy = false;
				
				local validF = isfile("lunahaxFriends.txt")
				if validF then
					local contents = readfile("lunahaxFriends.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == v.Name then
							isFriend = true;
							break;
						end
					end
				end
				local validE = isfile("lunahaxEnemies.txt")
				if validE then
					local contentsE = readfile("lunahaxEnemies.txt");
					for line in contentsE:gmatch("[^\r\n]+") do
						if line == v.Name then
							isEnemy = true;
							break;
						end
					end
				end
				
				
				local newButton = Instance.new("TextButton")
				newButton.Parent = playerListScrollingFrame
				newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				newButton.Size = UDim2.new(0, 200, 0, 50)
				newButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
				newButton.Position = UDim2.new(0, 0, numbtest, 0);
				newButton.Font = Enum.Font.SourceSans
				newButton.Text = v.Name
				
				local ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Parent = newButton
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(-0.0504394509, 0, -0.0461413562, 0)
				ImageLabel.Size = UDim2.new(0, 33, 0, 32)
				ImageLabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?userid=" .. v.UserId
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				
				
				if isEnemy then
					newButton.TextColor3 = Color3.fromRGB(255, 0, 0)
				elseif isFriend then
					newButton.TextColor3 = Color3.fromRGB(0, 255, 0)
				else
					newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				end
				newButton.TextSize = 25.000
				numbtest = numbtest + 0.005;
				newButton.Activated:Connect(function()
					variables.playerNameClicked = v.Name;
					populateWhenClicked();
				end)
			end
		end)
		
				
				
		tpToBaseplateButton.Activated:Connect(function()
			if _G.deathBarrierBypassEnabled then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0);
				notice:Fire("Lunahax", "Teleported to baseplate");
			else
				notice:Fire("Lunahax", "Please enable death barrier bypass", 4);
			end
		end)
		
		
		------------------------
		
		warButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Rain"
			game.Lighting:SetMinutesAfterMidnight(1025)
			game:GetService("Lighting").SunRays.Intensity = 0.03999999910593
			game:GetService("Lighting").SunRays.Spread = 1.2000000476837
			game:GetService("Lighting").Bloom.Intensity = 0.40000000596046
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://2506974318"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://2506974575"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://2506974238"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://2506974390"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://2506974153"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://2506974467"
			game:GetService("Lighting").Brightness = 0
			game:GetService("Lighting").FogColor = Color3.fromRGB(145.00000655651, 144.00000661612, 138.00000697374)
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(118.00000056624, 115.00000074506, 113.00000086427)
		end)
		
		eveningButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Night"
			game.Lighting:SetMinutesAfterMidnight(1020)
			game:GetService("Lighting").SunRays.Intensity = 0.25
			game:GetService("Lighting").SunRays.Spread = 1
			game:GetService("Lighting").Bloom.Intensity = 0.40000000596046
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://271042516"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://271077243"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://271042556"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://271042310"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://271042467"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://271077958"
			game:GetService("Lighting").Brightness = 0.69999998807907
			game:GetService("Lighting").FogColor = Color3.fromRGB(253.00000011921, 198.00000339746, 189.00000393391)
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(124.00000020862, 92.000002115965, 114.00000080466)
		end)

		dayButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Day"
			game.Lighting:SetMinutesAfterMidnight(720)
			game:GetService("Lighting").SunRays.Intensity = 0.25
			game:GetService("Lighting").SunRays.Spread = 1
			game:GetService("Lighting").Bloom.Intensity = 0.4
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://2677179366"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://501313275"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://2677179602"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://2677179822"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://2677179738"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://247087559"
			game:GetService("Lighting").Brightness =  1.85
			game:GetService("Lighting").FogColor =  Color3.fromRGB(255, 247, 234)
			game:GetService("Lighting").OutdoorAmbient =  Color3.fromRGB(185, 178, 167)
			game:GetService("Lighting").FogEnd = 7000;
			game:GetService("Lighting").FogStart = 0;
		end)
		
		nuclearWinterButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Snowstorm"
			game.Lighting:SetMinutesAfterMidnight(720)
			game:GetService("Lighting").SunRays.Intensity = 0.25
			game:GetService("Lighting").SunRays.Spread = 1
			game:GetService("Lighting").Bloom.Intensity = 0.40000000596046
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://931421737"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://931421868"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://931421587"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://931421672"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://931421501"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://931421803"
			game:GetService("Lighting").Brightness = 0
			game:GetService("Lighting").FogColor = Color3.fromRGB(193.00000369549, 193.00000369549, 193.00000369549)
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(195.00000357628, 195.00000357628, 195.00000357628)
		end)
		
		
		morningButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Night"
			game.Lighting:SetMinutesAfterMidnight(402)
			game:GetService("Lighting").SunRays.Intensity = 0.25
			game:GetService("Lighting").SunRays.Spread = 1
			game:GetService("Lighting").Bloom.Intensity = 0.40000000596046
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://253027015"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://253027058"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://253027039"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://253027029"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://253026999"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://253027050"
			game:GetService("Lighting").Brightness = 0.25
			game:GetService("Lighting").FogColor = Color3.fromRGB(81.000002771616, 107.0000012219, 112.00000092387)
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(35.000001713634, 45.000001117587, 61.000000163913)
		end)

		nightButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Night"
			game.Lighting:SetMinutesAfterMidnight(1025)
			game:GetService("Lighting").SunRays.Intensity = 0.04
			game:GetService("Lighting").SunRays.Spread = 1.2
			game:GetService("Lighting").Bloom.Intensity = 0.4
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://2695798966"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://213221473"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://220789557"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://220789543"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://220789524"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://220789575"
			game:GetService("Lighting").Brightness = 0
			game:GetService("Lighting").FogColor = Color3.fromRGB(31, 46, 75)
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(33, 40, 61)

		end)
		
		rainButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Rain"
			game.Lighting:SetMinutesAfterMidnight(720)
			game:GetService("Lighting").SunRays.Intensity = 0.25
			game:GetService("Lighting").SunRays.Spread = 1
			game:GetService("Lighting").Bloom.Intensity = 0.4
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://931421737"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://931421868"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://931421587"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://931421672"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://931421501"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://931421803"
			game:GetService("Lighting").Brightness =  0
			game:GetService("Lighting").FogColor =  Color3.fromRGB(193, 193, 193)
			game:GetService("Lighting").OutdoorAmbient =  Color3.fromRGB(195, 195, 195)
		end)


		sandstormButton.Activated:Connect(function()
			game.Lighting.Condition.Value = "Sandstorm"
			game.Lighting:SetMinutesAfterMidnight(720)
			game:GetService("Lighting").SunRays.Intensity = 0.04
			game:GetService("Lighting").SunRays.Spread = 1.2
			game:GetService("Lighting").Bloom.Intensity = 0.4
			game:GetService("Lighting").Sky.SkyboxBk = "rbxassetid://364908114"
			game:GetService("Lighting").Sky.SkyboxDn = "rbxassetid://364908331"
			game:GetService("Lighting").Sky.SkyboxFt = "rbxassetid://364908148"
			game:GetService("Lighting").Sky.SkyboxLf = "rbxassetid://364908195"
			game:GetService("Lighting").Sky.SkyboxRt = "rbxassetid://364908247"
			game:GetService("Lighting").Sky.SkyboxUp = "rbxassetid://364908301"
			game:GetService("Lighting").Brightness =  0
			game:GetService("Lighting").FogColor =  Color3.fromRGB(248, 222, 147)
			game:GetService("Lighting").OutdoorAmbient =  Color3.fromRGB(162, 130, 91)
		end)

		
		
		specificEarRapeButton.Activated:Connect(function()
			if variables.playerNameClicked ~= nil then
				pcall(function()
					spawn(function()
						for i=1,100 do
							game.ReplicatedStorage.Events:WaitForChild("mpib"):FireServer(game.Players[variables.playerNameClicked].Character.HumanoidRootPart, 13);
							wait();
						end
					end)
				end)
				notice:Fire("Lunahax", "Ear rape'd player!");
			else
				notice:Fire("Lunahax", "Please click a player.", 4);
			end
		end)
		
		
		
		-- node copy
		
		local allItems = {};
		function addPropToArray(itemProperties)
			table.insert(allItems, itemProperties);
		end


		addPropToArray({"Dumpster", "73.999999642372"});
		addPropToArray({"Bust Statue Hat", "49.40000000596"});
		addPropToArray({"Barricade", "54.999992370605"});
		addPropToArray({"Shelves Lounge", "34.477004051208"});
		addPropToArray({"Plant Tree Small", "39.281250119209"});
		addPropToArray({"Chair Stool", "7.1212601661682"});
		addPropToArray({"Easel", "37.199998617172"});
		addPropToArray({"Couch Booth", "68.700000956655"});
		addPropToArray({"Canopy Fabric", "50.324487686157"});
		addPropToArray({"Railing", "28.300001144409"});
		addPropToArray({"Dressing Stand", "54.970696628094"});
		addPropToArray({"Clock Grandfather", "48.35000000149"});
		addPropToArray({"Bench White", "90.634871721268"});
		addPropToArray({"Dryer", "26.699999988079"});
		addPropToArray({"Map Board", "53.778938695788"});
		addPropToArray({"Desk Big", "133.5000000298"});
		addPropToArray({"Bunk Bed", "258.99999608099"});
		addPropToArray({"Box Small", "8.4375"});
		addPropToArray({"Ladder Wood", "64.5"});
		addPropToArray({"Game Table", "93.775068819523"});
		addPropToArray({"Sofa Red", "47.900000810623"});
		addPropToArray({"Fabric Overhead", "26.324487686157"});
		addPropToArray({"Table Coffee", "21.5"});
		addPropToArray({"Street Lamp", "65.10001373291"});
		addPropToArray({"Table Lounge", "29.75"});
		addPropToArray({"Plastic Table", "28.25"});
		addPropToArray({"Bottles Tall", "57"});
		addPropToArray({"Cabinets", "21.13872385025"});
		addPropToArray({"Table X", "41.662277579308"});
		addPropToArray({"Computer Screens", "78.196396231651"});
		addPropToArray({"Bench", "16.025469303131"});
		addPropToArray({"Logs", "20.819108009338"});
		addPropToArray({"Night Stand", "52.999983936548"});
		addPropToArray({"Table", "46.3703237921"});
		addPropToArray({"Chair Picnic", "12.501653194427"});
		addPropToArray({"Couch Small", "32.104417800903"});
		addPropToArray({"Generator", "39.463157773018"});
		addPropToArray({"Bed", "73.868103116751"});
		addPropToArray({"Register", "11.199994087219"});
		addPropToArray({"Ammo Box", "8.8533323407173"});
		addPropToArray({"Shelves", "58.25"});
		addPropToArray({"Chair Comfort", "27.039119243622"});
		addPropToArray({"Bench Modern", "34.25"});
		addPropToArray({"Table Booth", "20.800000011921"});
		addPropToArray({"Computer Scifi", "53.875"});
		addPropToArray({"Desk Small", "62.312395974994"});
		addPropToArray({"Bag", "14.172916173935"});
		addPropToArray({"Gun Rack", "40.814584851265"});
		addPropToArray({"Table Round", "32.800000160933"});
		addPropToArray({"Papers", "35.800000078976"});
		addPropToArray({"Couch White", "49.852519154549"});
		addPropToArray({"Plant", "13.493908643723"});
		addPropToArray({"Couch Lounge", "54.625000953674"});
		addPropToArray({"Chair Lounge", "37.25"});
		addPropToArray({"Plant Tree", "75.562500238419"});
		addPropToArray({"Bust Statue", "42.40000000596"});
		addPropToArray({"Dresser Long", "106.79998357594"});
		addPropToArray({"Sink", "16.000000119209"});
		addPropToArray({"Tub", "22.838701248169"});
		addPropToArray({"Table Long", "42.666665047407"});
		addPropToArray({"Sandbags", "28.201997280121"});
		addPropToArray({"Cabinet Filing", "16.500000923872"});
		addPropToArray({"Computer", "26.055407680571"});
		addPropToArray({"Chair", "19.256631344557"});
		addPropToArray({"Podium", "20.800003483891"});
		addPropToArray({"Sci Fi", "51.259048700333"});
		addPropToArray({"Long Shelves", "78.300012856722"});
		addPropToArray({"Box", "9.9375"});
		addPropToArray({"Computer Set-up", "51.254103973508"});
		addPropToArray({"Shelves Store", "52.024270653725"});
		addPropToArray({"Camp Food", "48.442285079509"});
		addPropToArray({"Book Shelves", "97.422241687775"});
		addPropToArray({"Rat Candle", "37.966639995575"});
		addPropToArray({"Chair Beanbag", "14.30319237709"});
		addPropToArray({"Board", "95.929889678955"});
		addPropToArray({"Chair Folding", "10.11127614975"});
		addPropToArray({"Washer", "26.75"});
		addPropToArray({"Bottles Small", "38.549999892712"});
		addPropToArray({"Desk Low", "33.420437626541"});
		addPropToArray({"Desk", "73.399993047118"});
		addPropToArray({"Furnace", "60.649999566376"});
		addPropToArray({"Starlight", "20.715383768082"});
		addPropToArray({"Telephone Pole Light", "65.849999576807"});
		addPropToArray({"Lamp", "16.582590252161"});
		addPropToArray({"Floor Lamp", "9.4999998956919"});
		addPropToArray({"Lamp Prisim", "11.000000953674"});
		addPropToArray({"Lamp WallStreet", "19"});
		addPropToArray({"Spotlight", "10.89999973774"});
		addPropToArray({"Lamp Small", "12.582590252161"});
		addPropToArray({"House Wasteland2", "1103.7285881341"});
		addPropToArray({"Saloon Adobe", "1348.8256006762"});
		addPropToArray({"Old Warehouse", "2169.1924418211"});
		addPropToArray({"House Wasteland", "866.5"});
		addPropToArray({"Garage Wasteland", "768"});
		addPropToArray({"Wooden Wall Thick (2x3)", "39.5"});
		addPropToArray({"Wooden Wall (2x3)", "38.5"});
		addPropToArray({"Wooden Wall Thick (1x2)", "25.5"});
		addPropToArray({"Wooden Wall Thick (1x3)", "32.5"});
		addPropToArray({"Wooden Wall (2x2)", "31.5"});
		addPropToArray({"Fence", "43.326451078057"});
		addPropToArray({"Wooden Wall (1x2)", "24.5"});
		addPropToArray({"Wooden Wall Thick (2x2)", "32.5"});
		addPropToArray({"Counter (1x2)", "37.600000143051"});
		addPropToArray({"Wooden Wall (1x3)", "31.5"});
		addPropToArray({"Slot Machine", "67.245401829481"});
		addPropToArray({"Taps", "36.375"});
		addPropToArray({"Register Shop", "20.541307538748"});
		addPropToArray({"Shop Beacon", "53.224999696016"});
		addPropToArray({"Killzone Board", "29.705087780952"});
		addPropToArray({"Piano Tall", "34.199897825718"});
		addPropToArray({"Soda Machine", "50.5"});
		addPropToArray({"Fuel Station Saturn", "48.061149220914"});
		addPropToArray({"Dispencer", "52.273146498948"});
		addPropToArray({"Vending Machine", "42.547998577356"});
		addPropToArray({"Billboard Sign 1", "15.25"});
		addPropToArray({"Door Double", "110.00000275671"});
		addPropToArray({"Door", "34.749816894531"});
		addPropToArray({"Door Vault", "49.000025033951"});
		
		

		function getItemNameFromId(itemId)
			for i,v in pairs(allItems) do
				if v[2] == tostring(itemId) then
					return tostring(v[1]);
				end
			end
			return "";
		end
		
		viewBackpackButton.Activated:Connect(function()
			if variables.playerNameClicked == "" then
				notice:Fire("Lunahax", "Please click a player.", 4);
			else
				bckpackstring = "";
				for i,v in pairs(game.Players[variables.playerNameClicked].Backpack:GetChildren()) do
					bckpackstring = bckpackstring .. v.Name .. ","
				end
				showPopUpBox("Inventory items: " .. bckpackstring);
			end
		end)
		
		
		viewPermsButton.Activated:Connect(function()
			if variables.playerNameClicked == "" then
				notice:Fire("Lunahax", "Please click a player.", 4);
			else
				bckpackstring = game.Players[variables.playerNameClicked].PlayerData.BInventory.Value;
				showPopUpBox("Perm items: " .. bckpackstring);
			end
		end)
		
		
		copyNodeButton.Activated:Connect(function()
			wassuccessyy = false;
			pcall(function()			
				if game:GetService("Workspace").Buildings[variables.playerNameClicked].Node.Name == "Node" then
					pcall(function()
						fullStringOutput = "--Lunahax node copier\n--Please execute this as a script in a new server to paste the node!\n--Please report bugs to https://discord.gg/jWe6WQff5x\n\nGame:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(1, \"Node\", CFrame.new(" .. tostring(game:GetService("Workspace").Buildings[variables.playerNameClicked].Node.PrimaryPart.CFrame) .. "));\n";


						for i,v in pairs(game:GetService("Workspace").Buildings[variables.playerNameClicked]:GetChildren()) do
							pcall(function()
								if v.Name ~= "Node" then
									if v.Name == "" then
										unqId = 0;
										for i1,v1 in pairs(v:GetChildren()) do
											pcall(function()
												size = v1.Size;
												unqId = unqId + (size.X + size.Y + size.Z);
											end)
										end
										if unqId ~= 0 then
											if getItemNameFromId(unqId) ~= "" then
												print("Item found!: " .. getItemNameFromId(unqId));
												matRep = tostring(v.PrimaryPart.Material):gsub("Enum.Material.", "");
												fullStringOutput = fullStringOutput .. "Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(1, \"" .. getItemNameFromId(unqId) .. "\", CFrame.new(" .. tostring(v.PrimaryPart.CFrame) .. "), nil, BrickColor.new(\"" .. tostring(v.PrimaryPart.BrickColor) .. "\"), nil, nil, \"" .. tostring(matRep) .. "\");\n";
											end
										end
									elseif v.Name == "Resizable Wall" then
										fullStringOutput = fullStringOutput .. "Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(1, \"" .. v.Name .. "\", CFrame.new(" .. tostring(v.PrimaryPart.CFrame) .. "));\n";
										fullStringOutput = fullStringOutput .. "wait(0.5); lastWall = nil; for i,v in pairs(game:GetService(\"Workspace\").Buildings[game.Players.LocalPlayer.Name]:GetChildren()) do if v.Name == \"Resizable Wall\" then lastWall = v; end end Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(7, lastWall, lastWall.PrimaryPart.CFrame, nil, Vector3.new(" .. tostring(v.PrimaryPart.Size) .. "));\n";
										matRep = tostring(v.PrimaryPart.Material):gsub("Enum.Material.", "");
										fullStringOutput = fullStringOutput .. "wait(0.5); lastWall = nil; for i,v in pairs(game:GetService(\"Workspace\").Buildings[game.Players.LocalPlayer.Name]:GetChildren()) do if v.Name == \"Resizable Wall\" then lastWall = v; end end Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(5, lastWall, lastWall.PrimaryPart.CFrame, nil, BrickColor.new(\"" .. tostring(v.PrimaryPart.BrickColor) .. "\"), nil, nil, \"" .. tostring(matRep) .. "\");\n";
									elseif string.match(v.Name, "Picture Sign") then
										fullStringOutput = fullStringOutput .. "Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(1, \"" .. v.Name .. "\", CFrame.new(" .. tostring(v.PrimaryPart.CFrame) .. "));\n";
										pictureId = tostring(v.Part.SurfaceGui["1"].Image):gsub("rbxassetid://", "");
										fullStringOutput = fullStringOutput .. "wait(0.5); lastWall = nil; for i,v in pairs(game:GetService(\"Workspace\").Buildings[game.Players.LocalPlayer.Name]:GetChildren()) do if string.match(v.Name, \"Picture Sign\") then lastWall = v; end end Game:GetService(\"ReplicatedStorage\").Events.MenuActionEvent:FireServer(29, lastWall, {\"" .. pictureId .. "\"});\n";
									elseif string.match(v.Name, "Billboard Sign") then
										fullStringOutput = fullStringOutput .. "Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(1, \"" .. v.Name .. "\", CFrame.new(" .. tostring(v.PrimaryPart.CFrame) .. "));\n";
										textOnSign = tostring(tostring(v.Part.SurfaceGui["1"].Text):gsub("\"", "\\\""):gsub("\\", "\\\\"));
										textOnSign = tostring(textOnSign):gsub("\n", "\\n");
										fullStringOutput = fullStringOutput .. "wait(0.5); lastWall = nil; for i,v in pairs(game:GetService(\"Workspace\").Buildings[game.Players.LocalPlayer.Name]:GetChildren()) do if string.match(v.Name, \"Billboard Sign\") then lastWall = v; end end Game:GetService(\"ReplicatedStorage\").Events.MenuActionEvent:FireServer(7, lastWall, {\"" .. textOnSign .. "\"});\n";
									else
										fullStringOutput = fullStringOutput .. "Game:GetService(\"ReplicatedStorage\").Events.BuildingEvent:FireServer(1, \"" .. v.Name .. "\", CFrame.new(" .. tostring(v.PrimaryPart.CFrame) .. "));\n";
									end
								end
							end)
						end
					end)

					nodeCopyName = "Node_copy_" .. variables.playerNameClicked .. math.random(1,100) .. ".txt";
					writefile(nodeCopyName, fullStringOutput .. "\nprint(\"Lunahax - Pasted node!\")");
					notice:Fire("Lunahax", "Saved all available data to " .. nodeCopyName);
					wassuccessyy = true;
				else
					notice:Fire("Lunahax", "Error, does that player have a node?", 4);
				end
			end)
			if wassuccessyy == false then
				notice:Fire("Lunahax", "Error, does that player have a node?", 4);
			end
		end)
		
		
		spectatePlayerButton.Activated:Connect(function()
			if spectatePlayerButton.Text == "[OFF] Spectate Player" then
				spectatePlayerButton.Text = "[ON] Spectate Player"
				local PlayerToSpec = game:GetService("Players")[variables.playerNameClicked]
				game.Workspace.CurrentCamera.CameraSubject = PlayerToSpec.Character.Humanoid;
			else
				spectatePlayerButton.Text = "[OFF] Spectate Player"
				local PlayerToSpec = game:GetService("Players").LocalPlayer
				game.Workspace.CurrentCamera.CameraSubject = PlayerToSpec.Character.Humanoid;
			end
		end)
		
	
		
		-- weapon multiplier
		weaponMultiplierButton.Activated:Connect(function()
			if variables.weaponMultiplierEnabled then
				variables.weaponMultiplierEnabled = false;
				_G.weaponMultiplierEnabled = false;
				weaponMultiplierButton.Text = "[OFF] Weapon Multi"
				notice:Fire("Lunahax", "Weapon Multiplier disabled.");
			else
				variables.weaponMultiplierEnabled = true;
				_G.weaponMultiplierEnabled = true;
				weaponMultiplierButton.Text = "[ON] Weapon Multi"
				notice:Fire("Lunahax", "Weapon Multiplier enabled.");
			end
		end)


		
		kickOnModJoinButton.Activated:Connect(function()
			if variables.kickOnModJoin then
				variables.kickOnModJoin = false;
				kickOnModJoinButton.Text = "[OFF]Kick on Mod Join"
				notice:Fire("Lunahax", "Mod Kick disabled.");
			else
				variables.kickOnModJoin = true;
				kickOnModJoinButton.Text = "[ON]Kick on Mod Join"
				notice:Fire("Lunahax", "Mod Kick enabled.");
			end
		end)
		
		
		
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			if variables.antiAfkEnabled then
				vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				wait(1)
				vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			end
		end)
		
		
		-- anti afk
		antiAfkButton.Activated:Connect(function()
			if variables.antiAfkEnabled then
				variables.antiAfkEnabled = false;
				antiAfkButton.Text = "[OFF] AntiAFK"
				notice:Fire("Lunahax", "AntiAFK disabled.");
			else
				variables.antiAfkEnabled = true;
				antiAfkButton.Text = "[ON] AntiAFK"
				notice:Fire("Lunahax", "AntiAFK enabled.");
			end
		end)
		
		
		
		spawn(function()
			while true do
				pcall(function()
					if variables.speedHackEnabled then
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100;
					end
				end)
				wait();
			end
		end)
		
		autoReloadButton.Activated:Connect(function()
			if variables.autoReloadEnabled then
				variables.autoReloadEnabled = false;
				autoReloadButton.Text = "[OFF] AutoReload"
				notice:Fire("Lunahax", "AutoReload disabled.");
			else
				variables.autoReloadEnabled = true;
				autoReloadButton.Text = "[ON] AutoReload"
				notice:Fire("Lunahax", "AutoReload enabled.");
			end
		end)
		
		
		
		scrollingNameButton.Activated:Connect(function()
			if variables.scrollingNameEnabled then
				variables.scrollingNameEnabled = false;
				scrollingNameButton.Text = "[OFF] ScrName"
				notice:Fire("Lunahax", "ScrollingName disabled.");
			else
				variables.scrollingName = game.Players.LocalPlayer.PlayerData.RoleplayName.Value;
				if string.len(variables.scrollingName) < 26 then
					bufferToApply = makeBuffer((25 - string.len(variables.scrollingName)))
					variables.scrollingName = variables.scrollingName .. bufferToApply;
				else
					variables.scrollingName = variables.scrollingName .. " ";
				end

				variables.scrollingNameEnabled = true;
				scrollingNameButton.Text = "[ON] ScrName"
				notice:Fire("Lunahax", "ScrollingName enabled.");
			end
		end)
		
		textSpeedTextBox.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLost)
			value = textSpeedTextBox.Text;
			if tonumber(value) == 0 then
				textSpeedTextBox.Text = "0.1";
			else
				if tonumber(value) ~= nil then
					textSpeedTextBox.Text = value;
				else
					textSpeedTextBox.Text = "0.5";
				end
			end
		end)
		
		
	
		
		-- weapon inf clip
		infiniteClipButton.Activated:Connect(function()
			if variables.infiniteClipEnabled then
				notice:Fire("Lunahax", "Infinite Clip is disabled for the meantime.");
			else
				notice:Fire("Lunahax", "Infinite Clip is disabled for the meantime.");
			end
		end)
		
		
		
		
		hitboxExpandButton.Activated:Connect(function()
			if variables.hitboxExpandEnabled then
				variables.hitboxExpandEnabled = false;
				hitboxExpandButton.Text = "[OFF] Hitbox Expand"
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					pcall(function()
						if v ~= game:GetService("Players").LocalPlayer then
							v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
							v.Character.HumanoidRootPart.CanCollide = true
						end
					end)
				end
				notice:Fire("Lunahax", "Hitbox Expander disabled.");
			else
				variables.hitboxExpandEnabled = true;
				hitboxExpandButton.Text = "[ON] Hitbox Expand"
				
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					pcall(function()
						if v ~= game:GetService("Players").LocalPlayer then
							v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20);						
							v.Character.HumanoidRootPart.Transparency = 0.7;
							v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright green");
							v.Character.HumanoidRootPart.Material = "Neon";
							v.Character.HumanoidRootPart.CanCollide = false;
						end
					end)
				end
				notice:Fire("Lunahax", "Hitbox Expander enabled.");
			end
		end)
		
		game:GetService("Players").PlayerAdded:Connect(function(v)
			if variables.hitboxExpandEnabled then
				v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20);						
				v.Character.HumanoidRootPart.Transparency = 0.7;
				v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright green");
				v.Character.HumanoidRootPart.Material = "Neon";
				v.Character.HumanoidRootPart.CanCollide = false;
			end
		end)
		
		
		deathBarrierBypassButton.Activated:Connect(function()
			if variables.deathBarrierBypassEnabled then
				variables.deathBarrierBypassEnabled = false;
				_G.deathBarrierBypassEnabled = false;
				deathBarrierBypassButton.Text = "[OFF] Bypass Barriers"
				notice:Fire("Lunahax", "Death Barrier Bypass disabled.");
			else
				variables.deathBarrierBypassEnabled = true;
				_G.deathBarrierBypassEnabled = true;
				deathBarrierBypassButton.Text = "[ON] Bypass Barriers"
				notice:Fire("Lunahax", "Death Barrier Bypass enabled.");
			end
		end)
		
		
		
		speedHackButton.Activated:Connect(function()
			if variables.speedHackEnabled then
				if _G.bypassEnabled then
					variables.speedHackEnabled = false;
					speedHackButton.Text = "[OFF] SpeedHack"
					notice:Fire("Lunahax", "SpeedHack disabled.");
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
				else
					variables.speedHackEnabled = false;
					notice:Fire("Lunahax", "Coulden't load nessecary files, not enabling for your account safety", 4);
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
				end
			else
				if _G.bypassEnabled then
					variables.speedHackEnabled = true;
					speedHackButton.Text = "[ON] SpeedHack"
					notice:Fire("Lunahax", "SpeedHack enabled.");
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
				else
					variables.speedHackEnabled = false;
					notice:Fire("Lunahax", "Coulden't load nessecary files, not enabling for your account safety", 4);
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
				end
			end
		end)

		
		
		-- item sniper
		itemSniperButton.Activated:Connect(function()
			if variables.itemSniperEnabled then
				variables.itemSniperEnabled = false;
				itemSniperButton.Text = "[OFF] Item Sniper"
				notice:Fire("Lunahax", "Item Sniper disabled.");
			else
				variables.itemSniperEnabled = true;
				itemSniperButton.Text = "[ON] Item Sniper"
				notice:Fire("Lunahax", "Item Sniper enabled.");
			end
		end)

		function GetClosestItemTwo()
			local lplayer = game.Players.LocalPlayer
			local Character = lplayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			if not (Character or HumanoidRootPart) then return end
			local TargetDistance = math.huge
			local Target
			for i,v in ipairs(game:GetService("Workspace").Entities:GetChildren()) do
				pcall(function()
					local mesh = nil;	
					pcall(function()
						if v.ManualWeld.Name ~= "" then
							mesh = v.ManualWeld
						end
					end)
					if mesh == nil then
						mesh = v.Handle
					end
					if mesh then
						local TargetHRP = mesh
						local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
						if mag < TargetDistance then
							TargetDistance = mag
							Target = v
						end
					end
				end)
			end

			return Target
		end

		spawn(function()
			while true do
				pcall(function()
					if isDoingItem then
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11);
					end
				end)
				wait();
			end
		end)
		
		
		local isDoingItem = false;
		game:GetService("Workspace").Entities.ChildAdded:Connect(function(child)
			if variables.itemSniperEnabled then
				pcall(function()
					local cFrameRn = nil;
					local lmaozz = 0;
					
					wait(1);
					if string.match(child.Name, "Shipment") then
						
					else
						if isDoingItem then
						
						else
							nameOfItem = child.Int.Value;
							local Player = game:GetService("Players").LocalPlayer
							if child.ToolOwner.Value == Player.Name then
							
							else
								if isUserFriend(child.ToolOwner.Value) then
								
								else
								
									local mainPart = child.PrimaryPart;
									local character = Player.Character or Player.CharacterAdded:Wait()
									local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
									local Humanoid =  character:WaitForChild("Humanoid")
									cFrameRn = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
									
									print(mainPart.CFrame.X);
									
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(mainPart.CFrame.X, mainPart.CFrame.Y, mainPart.CFrame.Z))
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(90),0)
									
									variables.noclipBool = true;
									isDoingItem = true;
									
									spawn(function()
										while isDoingItem do
											wait(1);
											lmaozz = lmaozz + 1;
											if lmaozz > 10 then
												isDoingItem = false;
												variables.noclipBool = false;
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z));
												controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
												controls:Enable()
											end
										end
									end)
									
									local doneFirstThingy = false;
									
									
									
									while (child) and (isDoingItem) do
										local cExists = false
										
										for i,v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
											if child == v then
												cExists = true;
											end
										end
										if cExists then
											if doneFirstThingy then
												
											else
												doneFirstThingy = true;
											end
											Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(child);
										else
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z))
											break;
										end
										Player.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Animations.WheelAnims.Lay):Play();
										local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
										controls:Disable()
										wait(0.1)
									end
									
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z))
									
									
									wait(1);
									if game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= nil and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
										pcall(function()
											local amtInInv = tonumber(string.split(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Client.Inventory.Slots.Amt.Text, "/")[1]);
											if amtInInv >= 11 then
												
											else
												if game:GetService("Players").LocalPlayer.Flagged.Value == false then
													print(nameOfItem);
													theitm = game.Players.LocalPlayer.Backpack[nameOfItem];
													game.Players.LocalPlayer.Character.Humanoid:EquipTool(theitm)
													wait(0.1)
													Game:GetService("ReplicatedStorage").Events.WeaponBackEvent:FireServer(true, theitm)
													wait(0.1)
													Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(1)
													wait(0.1)
													Game:GetService("ReplicatedStorage").Events.WeaponBackEvent:FireServer(false, theitm)
													wait(0.1)
													Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItemTwo())
													wait(1);
													Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(2, GetClosestItemTwo())
													wait(1);
													Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(GetClosestItemTwo())
												end
											end
										end)
									end
									
									isDoingItem = false

									
									
									controls:Enable()
									variables.noclipBool = false;
									local Players = game:GetService("Players")
									local localPlayer = Players.LocalPlayer
									local humanoid = localPlayer.Character:WaitForChild("Humanoid")
									local AnimationTracks = humanoid:GetPlayingAnimationTracks()
									for i, track in pairs (AnimationTracks) do
										track:Stop()
									end
									isDoingItem = false
								end
							end
						end
					end
				end)
				isDoingItem = false
				variables.noclipBool = false;
				pcall(function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z))
				end)
				local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
				controls:Enable()
				local Players = game:GetService("Players")
				local localPlayer = Players.LocalPlayer
				local humanoid = localPlayer.Character:WaitForChild("Humanoid")
				local AnimationTracks = humanoid:GetPlayingAnimationTracks()
				for i, track in pairs (AnimationTracks) do
					track:Stop()
				end
			end
		end)
		
		
		nodeKillButton.Activated:Connect(function()
			if variables.isNodeKillEnabled then
				variables.isNodeKillEnabled = false;
				nodeKillButton.Text = "[OFF] NodeKill"
				notice:Fire("Lunahax", "NodeKill Disabled.");
			else
				variables.isNodeKillEnabled = true;
				nodeKillButton.Text = "[ON] NodeKill"
				notice:Fire("Lunahax", "NodeKill Enabled.");
			end
		end)

		--aimbot click
		aimbotButton.Activated:Connect(function()
			if variables.aimbotEnabled then
				variables.aimbotEnabled = false;
				aimbotButton.Text = "[OFF] (q) Aimbot"
				notice:Fire("Lunahax", "Aimbot disabled.");
			else
				variables.aimbotEnabled = true;
				aimbotButton.Text = "[ON] (q) Aimbot"
				notice:Fire("Lunahax", "Aimbot enabled.");
			end
		end)


		--only flagged click
		onlyTargetFlaggedButton.Activated:Connect(function()
			if variables.onlyFlagged then
				variables.onlyFlagged = false;
				onlyTargetFlaggedButton.Text = "[OFF] Only flagged"
				notice:Fire("Lunahax", "Will target everyone.");
			else
				variables.onlyFlagged = true;
				onlyTargetFlaggedButton.Text = "[ON] Only flagged"
				notice:Fire("Lunahax", "Will only target flagged.");
			end
		end)

		
		--clicktp click
		clickTpButton.Activated:Connect(function()
			if variables.clickTpEnabled then
				variables.clickTpEnabled = false;
				clickTpButton.Text = "[OFF] (x) MouseTP"
				notice:Fire("Lunahax", "MouseTP disabled.");
			else
				variables.clickTpEnabled = true;
				clickTpButton.Text = "[ON] (x) MouseTP"
				notice:Fire("Lunahax", "MouseTP enabled.");
			end
		end)


		
		--global chat click
		globalChatButton.Activated:Connect(function()
			if variables.globalChat then
				variables.globalChat = false;
				globalChatButton.Text = "[OFF] Global chat"
				notice:Fire("Lunahax", "Global chat  disabled.");
			else
				variables.globalChat = true;
				globalChatButton.Text = "[ON] Global chat"
				notice:Fire("Lunahax", "Global chat enabled.");
			end
		end)
		
		spawn(function()
			pcall(function()				
				function deathreturnnn()
					game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
						pcall(function()
							if variables.deathReturnEnabled then
								_G.nlrLoop = true;
								local cFrameRn = nil;
								cFrameRn = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z));
								local healthAmt = 0;
								while healthAmt == 0 do
									wait(1);
									local humroot = game.Players.LocalPlayer.Character.HumanoidRootPart;
									healthAmt = game.Players.LocalPlayer.Character.Humanoid.Health;
								end
								wait();
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z)
								notice:Fire("Lunahax", "Respawned back to death point!");
							end
						end)
						deathreturnnn();
					end)
				end
				deathreturnnn();
			end)
		end)
		
		--death return click
		deathReturnButton.Activated:Connect(function()
			if variables.deathReturnEnabled then
				variables.deathReturnEnabled = false;
				deathReturnButton.Text = "[OFF] Death Return"
				notice:Fire("Lunahax", "Death Return disabled.");
			else
				variables.deathReturnEnabled = true;
				deathReturnButton.Text = "[ON] Death Return"
				notice:Fire("Lunahax", "Death Return enabled.");
			end
		end)
		


		--rageaura, red players click
		rageAuraRedButton.Activated:Connect(function()
			if _G.redRageAuraEnabled then
				_G.redRageAuraEnabled = false;
				rageAuraRedButton.Text = "[OFF] Red RageAura"
				notice:Fire("Lunahax", "Red RageAura disabled.");
			else
				_G.redRageAuraEnabled = true;
				rageAuraRedButton.Text = "[ON] Red RageAura"
				notice:Fire("Lunahax", "Red RageAura enabled.");
			end
		end)
		
		
		--rageaura, yellow players click
		yellowRageAuraRedButton.Activated:Connect(function()
			if _G.yellowRageAuraEnabled then
				_G.yellowRageAuraEnabled = false;
				yellowRageAuraRedButton.Text = "[OFF] Yellow RageAura"
				notice:Fire("Lunahax", "Yellow RageAura disabled.");
			else
				_G.yellowRageAuraEnabled = true;
				yellowRageAuraRedButton.Text = "[ON] Yellow RageAura"
				notice:Fire("Lunahax", "Yellow RageAura enabled.");
			end
		end)



		--autocola click
		autoDrinkButton.Activated:Connect(function()
			if variables.autoColaDrink then
				variables.autoColaDrink = false;
				autoDrinkButton.Text = "[OFF] AutoDrink"
				notice:Fire("Lunahax", "Auto Cola Drink disabled.");
			else
				variables.autoColaDrink = true;
				autoDrinkButton.Text = "[ON] AutoDrink"
				notice:Fire("Lunahax", "Auto Cola Drink enabled.");
			end
		end)
		
		
		function NoteRecieved(p1, p2, p3)
			pcall(function()
				if string.match(tostring(p2), "All 6 drones used") and variables.autoAureus then
					notice:Fire("Lunahax", "Disabling auto-aureus!");
					variables.autoAureus = false;
					autoAureusButton.Text = "[OFF] AutoAureus"
				end
			end)
		end
		game.ReplicatedStorage.Events:WaitForChild("NoteServer").OnClientEvent:connect(NoteRecieved);
		
		
		--autocornfarm click
		autoCornFarmButton.Activated:Connect(function()
			if variables.autoCornFarm then
				variables.autoCornFarm = false;
				autoCornFarmButton.Text = "[OFF] AutoCornFarm"
				notice:Fire("Lunahax", "Auto Corn Farm disabled.");
			else
				variables.autoCornFarm = true;
				autoCornFarmButton.Text = "[ON] AutoCornFarm"
				notice:Fire("Lunahax", "Auto Corn Farm enabled.");
			end
		end)
		
		
		autoScrapFarmButton.Activated:Connect(function()
			if variables.autoScrapFarm then
				variables.autoScrapFarm = false;
				autoScrapFarmButton.Text = "[OFF] AutoScrapFarm"
				notice:Fire("Lunahax", "Auto Scrap Farm disabled.");
			else
				variables.autoScrapFarm = true;
				autoScrapFarmButton.Text = "[ON] AutoScrapFarm"
				notice:Fire("Lunahax", "Auto Scrap Farm enabled.");
			end
		end)
		
		
		autoPrinterButton.Activated:Connect(function()
			if variables.autoPrinterFarm then
				variables.autoPrinterFarm = false;
				autoPrinterButton.Text = "[OFF] AutoPrinter"
				notice:Fire("Lunahax", "Auto Printer Farm disabled.");
			else
				variables.autoPrinterFarm = true;
				autoPrinterButton.Text = "[ON] AutoPrinter"
				notice:Fire("Lunahax", "Auto Printer Farm enabled.");
			end
		end)
		
		
		autoAureusButton.Activated:Connect(function()
			if variables.autoAureus then
				variables.autoAureus = false;
				autoAureusButton.Text = "[OFF] AutoAureus"
				notice:Fire("Lunahax", "AutoAureus disabled.");
			else
				variables.autoAureus = true;
				autoAureusButton.Text = "[ON] AutoAureus"
				notice:Fire("Lunahax", "AutoAureus enabled.");
			end
		end)
		
		
		--AutoScav click
		autoScavButton.Activated:Connect(function()
			if variables.autoScavEnabled then
				variables.autoScavEnabled = false;
				autoScavButton.Text = "[OFF] AutoScav"
				notice:Fire("Lunahax", "Auto Scavenge Crate disabled.");
			else
				variables.autoScavEnabled = true;
				autoScavButton.Text = "[ON] AutoScav"
				notice:Fire("Lunahax", "Auto Scavenge Crate enabled.");
			end
		end)
		
		

		-- nearest car button
		getInNearestCarButton.Activated:Connect(function()
			function GetClosestVehicle()
				local lplayer = game.Players.LocalPlayer
				local Character = lplayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				if not (Character or HumanoidRootPart) then return end
				local TargetDistance = math.huge
				local Target
				for i,v in ipairs(game:GetService("Workspace").Vehicles:GetChildren()) do
					pcall(function()
						if v.Main then
							local TargetHRP = v.Main
							local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
							if mag < TargetDistance then
								TargetDistance = mag
								Target = v
							end
						end
					end)
				end

				return Target
			end
			Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(GetClosestVehicle().VehicleSeat);
			notice:Fire("Lunahax", "You are now driving the closest not-in-use car!");
		end)

		
		-- unlock all passenger button
		unlockPassengerButton.Activated:Connect(function()
			for i,v in ipairs(game:GetService("Workspace").Vehicles:GetChildren()) do
				pcall(function()
					v.SeatLocks.Value = false;
				end)
			end
			notice:Fire("Lunahax", "All passenger seats have now been unlocked!");
		end)

		
		
		--noclip click
		noclipButton.Activated:Connect(function()
			if variables.noclipBool then
				variables.noclipBool = false;
				noclipButton.Text = "[OFF] Noclip"
				notice:Fire("Lunahax", "Noclip disabled.");
			else
				variables.noclipBool = true;
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				noclipButton.Text = "[ON] Noclip"
				notice:Fire("Lunahax", "Noclip enabled.");
			end
		end)
		game:GetService('RunService').Stepped:connect(function()
			if variables.noclipBool then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)



		--------------------
		-- client side jetpack

		clientJPButton.Activated:Connect(function()
			local clientzzz = game:GetService("Players").LocalPlayer
			local model = Instance.new("Model")
			model.Name = "Jetpack"
			local main = Instance.new("Part")
			main.Name = "Main"
			main.Parent = model
			model.Parent = game:GetService("Workspace")[clientzzz.Name].Util
			
			notice:Fire("Lunahax", "Done! Press y to activate jetpack!");
		end)

		--------------------
		-- spywatch bypass

		spywatchBypassButton.Activated:Connect(function()
			local wrkspace = game:GetService("Workspace");
			local Player = game:GetService("Players").LocalPlayer

			local foundWatch = false

			for i,v in pairs(wrkspace[Player.Name]:GetChildren()) do
				if v.Name == "Spy Watch" then
					game.ReplicatedStorage.Events.ToolsEvent:FireServer(16, true, v);
					wait(2)
					Player.Character.Head.Transparency = 0;
					notice:Fire("Lunahax", "You are now invisible!");
					foundWatch = true
					break
				end
			end
			if foundWatch == false then
				notice:Fire("Lunahax", "Please hold a spywatch!", 4);
			end
		end)

		--------------------
		-- inf ammo
		infiniteAmmoButton.Activated:Connect(function()
			if variables.infSmgAmmo then
				variables.infSmgAmmo = false;
				variables.infRifAmmo = false;
				variables.infPisAmmo = false;
				local Player = game:GetService("Players").LocalPlayer
				Player.PlayerData["Pistol Ammo"].RobloxLocked = false;
				Player.PlayerData["SMG Ammo"].RobloxLocked = false;
				Player.PlayerData["Rifle Ammo"].RobloxLocked = false;
				infiniteAmmoButton.Text = "[OFF] InfiniteAmmo"
				notice:Fire("Lunahax", "Infinite Ammo disabled.");
			else
				variables.infSmgAmmo = true;
				variables.infRifAmmo = true;
				variables.infPisAmmo = true;
				local Player = game:GetService("Players").LocalPlayer
				Player.PlayerData["Pistol Ammo"].Value = 1000;
				Player.PlayerData["Pistol Ammo"].RobloxLocked = true;
				Player.PlayerData["SMG Ammo"].Value = 1000;
				Player.PlayerData["SMG Ammo"].RobloxLocked = true;
				Player.PlayerData["Rifle Ammo"].Value = 1000;
				Player.PlayerData["Rifle Ammo"].RobloxLocked = true;
				infiniteAmmoButton.Text = "[ON] InfiniteAmmo"
				notice:Fire("Lunahax", "Infinite Ammo enabled");
			end
		end)
		
		game.Players.LocalPlayer.PlayerData["Hunger"].Changed:connect(function()
			if variables.infHunger then
				game.Players.LocalPlayer.PlayerData["Hunger"].Value = 100;
				game.Players.LocalPlayer.PlayerData["Hunger"].RobloxLocked = true;
			end
		end)
		

		infiniteHungerButton.Activated:Connect(function()
			if variables.infHunger then
				variables.infHunger = false;
				game.Players.LocalPlayer.PlayerData["Hunger"].RobloxLocked = false;
				infiniteHungerButton.Text = "[OFF] InfiniteHunger"
				notice:Fire("Lunahax", "Infinite Hunger disabled.");
			else
				variables.infHunger = true;
				game.Players.LocalPlayer.PlayerData["Hunger"].Value = 100;
				game.Players.LocalPlayer.PlayerData["Hunger"].RobloxLocked = true;
				infiniteHungerButton.Text = "[ON] InfiniteHunger"
				notice:Fire("Lunahax", "Infinite Hunger enabled");
			end
		end)
		
		

		spawn(function()
			local Player = game:GetService("Players").LocalPlayer
			Player.PlayerData["SMG Ammo"].Changed:Connect(function()
				if variables.infSmgAmmo then
					Player.PlayerData["SMG Ammo"].Value = 1000;
					Player.PlayerData["SMG Ammo"].RobloxLocked = true;
				end
			end)
			Player.PlayerData["Pistol Ammo"].Changed:Connect(function()
				if variables.infPisAmmo then
					Player.PlayerData["Pistol Ammo"].Value = 1000;
					Player.PlayerData["Pistol Ammo"].RobloxLocked = true;
				end
			end)
			Player.PlayerData["Rifle Ammo"].Changed:Connect(function()
				if variables.infRifAmmo then
					Player.PlayerData["Rifle Ammo"].Value = 1000;
					Player.PlayerData["Rifle Ammo"].RobloxLocked = true;
				end
			end)
		end);


		function SecondsToClock(seconds)
		  local seconds = tonumber(seconds)

		  if seconds <= 0 then
			return "00:00:00";
		  else
			hours = string.format("%02.f", math.floor(seconds/3600));
			mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
			secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
			return hours..":"..mins..":"..secs
		  end
		end


		function removePlayerESP(val)
			for i,v in pairs(variables.espIgnored) do
				 if v == val then
					  table.remove(variables.espIgnored, i)
				 end
			end
		end


		killPlayer.Activated:Connect(function()
			local Player = game:GetService("Players").LocalPlayer
			local character = Player.Character or Player.CharacterAdded:Wait()
			local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
			local Humanoid =  character:WaitForChild("Humanoid")
			local personClicked = game:GetService("Players")[variables.playerNameClicked]
			local hasDoneCall = false;


			pcall(function()
				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Reload then
					hasDoneCall = true;
					if game:GetService("Players").LocalPlayer.Flagged.Value then
						if variables.onlyFlagged and personClicked.Flagged.Value or variables.onlyFlagged == false then
							local cFrameRn = nil;
							cFrameRn = CFrame.new(Vector3.new(HumanoidRootPart.CFrame.X, HumanoidRootPart.CFrame.Y, HumanoidRootPart.CFrame.Z));
							local theirChar = personClicked.Character
							local theirRoot = theirChar:WaitForChild("HumanoidRootPart")
							HumanoidRootPart.CFrame = theirRoot.CFrame;
							
							pcall(function()
								wait(1)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
								wait(0.2)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
								wait(0.2)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
								wait(0.2)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
								wait(0.2);
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
								wait(0.2);
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
								wait(0.2);
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[variables.playerNameClicked].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
							end)
							HumanoidRootPart.CFrame = CFrame.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z)
							notice:Fire("Lunahax", "Player has been killed!");
						else
							notice:Fire("Lunahax", "Player is not flagged and you have 'Only Flagged' enabled!", 4);
						end
					else
						notice:Fire("Lunahax", "Please flag up!", 4);
					end
				else
					notice:Fire("Lunahax", "Please equip a gun!", 4);
				end
			end)
			if hasDoneCall == false then
				notice:Fire("Lunahax", "Please equip a gun!", 4);
			end
		end)
		
		
		earRapePlayersButton.Activated:Connect(function()
			notice:Fire("Lunahax", "Loading, please wait...");
			for i1,v1 in pairs(game.Players:GetChildren()) do
				pcall(function()
					for i=1,100 do
						game.ReplicatedStorage.Events:WaitForChild("mpib"):FireServer(v1.Character.HumanoidRootPart, 13);
						wait();
					end
				end)
			end
			
			notice:Fire("Lunahax", "Ear rape'd all players!");
		end)
		
		
		local http = game:GetService('HttpService')
		function getOutfits(id)
			local data
			local url = 'https://avatar.rprxy.xyz/v1/users/'..id..'/avatar'
			data =  http:JSONDecode(game:HttpGet(url,true))
			local tables = data.assets
			local stuff = {}
			for i = 1,#tables do
				local subTables = tables[i]
				local id = subTables["id"]
				table.insert(stuff,id)
			end
		   return stuff
		end
		
		stealOutfitButton.Activated:Connect(function()
			local playerToSteal = game:GetService("Players")[variables.playerNameClicked];
			local daOutfits = getOutfits(playerToSteal.UserId);
			local curOutfitString = "";
			for _asd, vp in pairs(daOutfits) do
				curOutfitString = curOutfitString .. vp .. ","
			end
			Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(8, { playerToSteal.PlayerData.RoleplayName.Value, curOutfitString .. playerToSteal.PlayerData.Outfit.Value, true });
			notice:Fire("Lunahax", "You have stolen their outfit!");
		end)
		
		stealOutfitFromTextButton.Activated:Connect(function()
			local Players = game:GetService("Players")
			local playerToSteal = Players:GetUserIdFromNameAsync(joinGameUserTextbox.Text)
			local daOutfits = getOutfits(playerToSteal);
			local curOutfitString = "";
			for _asd, vp in pairs(daOutfits) do
				curOutfitString = curOutfitString .. vp .. ","
			end
			Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(8, { joinGameUserTextbox.Text, curOutfitString, true });
			notice:Fire("Lunahax", "You have stolen their outfit!");
		end)
			
		
		
		copyOutfitButton.Activated:Connect(function()
			local playerToSteal = game:GetService("Players")[variables.playerNameClicked];
			syn.write_clipboard(playerToSteal.PlayerData.Outfit.Value)
			if playerToSteal.PlayerData.Outfit.Value == "" then
				local daOutfits = getOutfits(playerToSteal.UserId);
				local curOutfitString = "";
				for _asd, vp in pairs(daOutfits) do
					curOutfitString = curOutfitString .. vp .. ","
				end
				syn.write_clipboard(tostring(curOutfitString .. playerToSteal.PlayerData.Outfit.Value));
			end
			notice:Fire("Lunahax", "Copied their outfit id's to clipboard!");
		end)

		copyNodeSongButton.Activated:Connect(function()
			local didItWork = false;
			pcall(function()
				local currentSong = string.gsub(game:GetService("Workspace").Buildings[variables.playerNameClicked].Jukebox.Speaker.Sound.SoundId, "rbxassetid://", "")
				syn.write_clipboard(currentSong)
				notice:Fire("Lunahax", "Copied their jukebox song id to clipboard!");
				didItWork = true;
			end)
			if didItWork == false then
				notice:Fire("Lunahax", "Error! Does this player have a node or a jukebox?", 4);
			end
		end)
		
		tpToPlayerButton.Activated:Connect(function()
			local Player = game:GetService("Players").LocalPlayer
			local character = Player.Character or Player.CharacterAdded:Wait()
			local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
			local Humanoid =  character:WaitForChild("Humanoid")
			local bon = game:GetService("Players")[variables.playerNameClicked]
			local bonc = bon.Character or bon.CharacterAdded:Wait()
			local bonroot = bonc:WaitForChild("HumanoidRootPart")
			HumanoidRootPart.CFrame = CFrame.new(Vector3.new(bonroot.CFrame.X, bonroot.CFrame.Y, bonroot.CFrame.Z))
			
			local testAmt = 0;
			
			pcall(function()
				local seat = game.Players.LocalPlayer.Character.Humanoid.SeatPart
				if seat then
					local vehicleModel = seat.Parent
					vehicleModel:MoveTo(game:GetService("Workspace")[variables.playerNameClicked].HumanoidRootPart.Position)
					for i=1,10 do
						pcall(function()
							game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(seat);
						end)
						wait()
					end
					wait(0.1)
					game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(seat);
				end
			end)

		end)

		local UnloadCharacterExt = function(v)
			local vHolder = Holder:FindFirstChild(v.Name)
			if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
				vHolder:ClearAllChildren()
			end
		end
		local UnloadPlayerExt = function(v)
			UnloadCharacterExt(v)
			local vHolder = Holder:FindFirstChild(v.Name)
			if vHolder then
				vHolder:Destroy()
			end
		end






		excludeFromEspButton.Activated:Connect(function()
			table.insert(variables.espIgnored, variables.playerNameClicked)
			notice:Fire("Lunahax", "Player will no longer be visible on ESP until you re-join!")
			
			local playerVar = game:GetService("Players")[variables.playerNameClicked];
			UnloadPlayerExt(playerVar)
		end)

		-- to add players to list

		function has_value (tab, val)
			for index, value in ipairs(tab) do
				if value == val then
					return true
				end
			end

			return false
		end

		function populateWhenClicked()
			local playerVar = game:GetService("Players")[variables.playerNameClicked];
			usernameInfoText.Text = "Username: " .. variables.playerNameClicked;
			roleplayNameInfoText.Text = "Roleplay Name: " .. playerVar.PlayerData.RoleplayName.Value;
			jobInfoText.Text = "Job: " .. playerVar.Job.Value;
			hungerInfoText.Text = "Hunger: " .. playerVar.PlayerData.Hunger.Value .. "%";
			karmaInfoText.Text = "Karma: " .. playerVar.PlayerData.Karma.Value;
			if playerVar.Flagged.Value then
				flaggedInfoText.Text = "Flagged?: Yes";
			else
				flaggedInfoText.Text = "Flagged?: No";
			end
			sChargesInfoText.Text = "S Charges: " .. playerVar.PlayerData.CraftCharges.Value;
			playtimeInfoText.Text = "Playtime: " .. SecondsToClock(playerVar.PlayerData.PlayTime.Value) .. " hours";
			moneyAmtInfoText.Text = "$: " .. playerVar.PlayerData.Currency.Value;
			aureusInfoText.Text = "A$: " .. playerVar.PlayerData.PCurrency.Value;
			
			hdlItem = "";
			pcall(function()
				for _asd, vCharItems in pairs(game:GetService("Players")[variables.playerNameClicked].Character:GetChildren()) do 
					if vCharItems:IsA("Tool") then 
						hdlItem = vCharItems.Name;
					end
				end
			end)
			
			heldItemInfoText.Text = "Held: " .. hdlItem;
			
			inventoryInfoText.Text = "Inventory: " .. playerVar.PlayerData.Inventory.Value;
			bankInfoText.Text = "Bank: " .. playerVar.PlayerData.Bank.Value;
			--table.insert(variables.espIgnored, variables.playerNameClicked)
		end
		
		
		function populateDispInfoWhenClicked()
			local itemCount = variables.dispClicked.Dispencer.Count.Value;
			local itemPrice = variables.dispClicked.Dispencer.Price.Value
			local itemName = variables.dispClicked.Dispencer.Value;
			
			dispenserItemNameText.Text = "Item: " .. itemName;
			dispenserItemPriceText.Text = "Price: " .. itemPrice;
			dispenserItemCountText.Text = "Left: " .. itemCount;
			
			
		end

		
		teleportToDispenserButton.Activated:Connect(function()
			local Player = game:GetService("Players").LocalPlayer
			local character = Player.Character or Player.CharacterAdded:Wait()
			local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
			cfrr = CFrame.new((variables.dispClicked.Main.CFrame.X + 1), (variables.dispClicked.Main.CFrame.Y + 2), (variables.dispClicked.Main.CFrame.Z + 1));
			HumanoidRootPart.CFrame = cfrr;
		end)

		
		game:GetService("Players").PlayerAdded:Connect(function(v)
			pcall(function()
				if isUserEsMod(v.Name) then
					notice:Fire("Lunahax", "WARNING! Moderator " .. v.Name .. " is in your game.", 4);
				end
			end)
			-- remove all first
			for _asd, vp in pairs(playerListScrollingFrame:GetChildren()) do 
				vp:destroy();
			end
			
			local numbtest = 0;
			--repop
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local isFriend = false;
				local isEnemy = false;
				pcall(function()
					local validF = isfile("lunahaxFriends.txt")
					if validF then
						local contents = readfile("lunahaxFriends.txt");
						for line in contents:gmatch("[^\r\n]+") do
							if line == v.Name then
								isFriend = true;
								break;
							end
						end
					end
					local validE = isfile("lunahaxEnemies.txt")
					if validE then
						local contentsE = readfile("lunahaxEnemies.txt");
						for line in contentsE:gmatch("[^\r\n]+") do
							if line == v.Name then
								isEnemy = true;
								break;
							end
						end
					end
				end)
				
				
				local newButton = Instance.new("TextButton")
				newButton.Parent = playerListScrollingFrame
				newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				newButton.Size = UDim2.new(0, 200, 0, 50)
				newButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
				newButton.Position = UDim2.new(0, 0, numbtest, 0);
				newButton.Font = Enum.Font.SourceSans
				newButton.Text = v.Name
				
				local ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Parent = newButton
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(-0.0504394509, 0, -0.0461413562, 0)
				ImageLabel.Size = UDim2.new(0, 33, 0, 32)
				ImageLabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?userid=" .. v.UserId
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				
				
				if isEnemy then
					newButton.TextColor3 = Color3.fromRGB(255, 0, 0)
				elseif isFriend then
					newButton.TextColor3 = Color3.fromRGB(0, 255, 0)
				else
					newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				end
				newButton.TextSize = 25.000
				numbtest = numbtest + 0.005;
				newButton.Activated:Connect(function()
					variables.playerNameClicked = v.Name;
					populateWhenClicked();
				end)
			end
		end)
		game:GetService("Players").PlayerRemoving:Connect(function(v)
			-- remove all first
			for _asd, vp in pairs(playerListScrollingFrame:GetChildren()) do 
				vp:destroy();
			end
			
			local numbtest = 0;
			--repop
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local isFriend = false;
				local isEnemy = false;
				pcall(function()
					local validF = isfile("lunahaxFriends.txt")
					if validF then
						local contents = readfile("lunahaxFriends.txt");
						for line in contents:gmatch("[^\r\n]+") do
							if line == v.Name then
								isFriend = true;
								break;
							end
						end
					end
					local validE = isfile("lunahaxEnemies.txt")
					if validE then
						local contentsE = readfile("lunahaxEnemies.txt");
						for line in contentsE:gmatch("[^\r\n]+") do
							if line == v.Name then
								isEnemy = true;
								break;
							end
						end
					end
				end)
				
				
				local newButton = Instance.new("TextButton")
				newButton.Parent = playerListScrollingFrame
				newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				newButton.Size = UDim2.new(0, 200, 0, 50)
				newButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
				newButton.Position = UDim2.new(0, 0, numbtest, 0);
				newButton.Font = Enum.Font.SourceSans
				newButton.Text = v.Name
				
				local ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Parent = newButton
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(-0.0504394509, 0, -0.0461413562, 0)
				ImageLabel.Size = UDim2.new(0, 33, 0, 32)
				ImageLabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?userid=" .. v.UserId
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				
				
				if isEnemy then
					newButton.TextColor3 = Color3.fromRGB(255, 0, 0)
				elseif isFriend then
					newButton.TextColor3 = Color3.fromRGB(0, 255, 0)
				else
					newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				end
				newButton.TextSize = 25.000
				numbtest = numbtest + 0.005;
				newButton.Activated:Connect(function()
					variables.playerNameClicked = v.Name;
					populateWhenClicked();
				end)
			end
		end)
		-- remove all first
		for _asd, vp in pairs(playerListScrollingFrame:GetChildren()) do 
			vp:destroy();
		end

		local numbtest = 0;
		--repop
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			local isFriend = false;
			local isEnemy = false;
			
			pcall(function()
				local validF = isfile("lunahaxFriends.txt")
				if validF then
					local contents = readfile("lunahaxFriends.txt");
					for line in contents:gmatch("[^\r\n]+") do
						if line == v.Name then
							isFriend = true;
							break;
						end
					end
				end
				local validE = isfile("lunahaxEnemies.txt")
				if validE then
					local contentsE = readfile("lunahaxEnemies.txt");
					for line in contentsE:gmatch("[^\r\n]+") do
						if line == v.Name then
							isEnemy = true;
							break;
						end
					end
				end
			end)
			
			
			
			local newButton = Instance.new("TextButton")
			newButton.Parent = playerListScrollingFrame
			newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			newButton.Size = UDim2.new(0, 200, 0, 50)
			newButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
			newButton.Position = UDim2.new(0, 0, numbtest, 0);
			newButton.Font = Enum.Font.SourceSans
			newButton.Text = v.Name
			
			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Parent = newButton
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(-0.0504394509, 0, -0.0461413562, 0)
			ImageLabel.Size = UDim2.new(0, 33, 0, 32)
			ImageLabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?userid=" .. v.UserId
			ImageLabel.ScaleType = Enum.ScaleType.Fit
			
				
			if isEnemy then
				newButton.TextColor3 = Color3.fromRGB(255, 0, 0)
			elseif isFriend then
				newButton.TextColor3 = Color3.fromRGB(0, 255, 0)
			else
				newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			end
			newButton.TextSize = 25.000
			numbtest = numbtest + 0.005;
			newButton.Activated:Connect(function()
				variables.playerNameClicked = v.Name;
				populateWhenClicked();
			end)
		end
		
	

		

		flyJumpButton.Activated:Connect(function()
			if variables.flyJump then
				variables.flyJump = false;
				flyJumpButton.Text = "[OFF] Fly Jump"
				notice:Fire("Lunahax", "Fly Jump Disabled.");
			else
				variables.flyJump = true;
				flyJumpButton.Text = "[ON] Fly Jump"
				notice:Fire("Lunahax", "Fly Jump Enabled.");
			end
		end)

		spawn(function()
			while true do
				pcall(function()
					game:GetService("UserInputService").JumpRequest:connect(function()
						if variables.flyJump then
							game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
						end
					end)
				end)
				wait(5)
			end
		end)




		

		local oldText = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopBar"):WaitForChild("Frame"):WaitForChild("TextLabel").Text;
		local oldColor = game:GetService("Players").LocalPlayer.PlayerGui.TopBar.Frame.BackgroundColor3;


		-- set cool top bar text
		spawn(function()
			while wait() do
				local hue = tick() % 10 / 10;
				variables.globRainbowColor3 = Color3.fromHSV(hue, 1, 1);
				mainHeaderText.TextColor3 = variables.globRainbowColor3;
				if variables.menuOpen then
					game:GetService("Players").LocalPlayer.PlayerGui.TopBar.Frame.BackgroundColor3 = variables.globRainbowColor3;
				else
					game:GetService("Players").LocalPlayer.PlayerGui.TopBar.Frame.BackgroundColor3 = oldColor;
				end
			end
		end);


		game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):SetTopbarTransparency(1);
		local textArray = { "lunahax (c to open) | build number: " .. variables.version};
		local textLabel = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopBar"):WaitForChild("Frame"):WaitForChild("TextLabel");
		local randomInt = math.random(1, #textArray);
		spawn(function()
			while true do
				if variables.menuOpen then
					textLabel.Text = textArray[randomInt];
				else
					textLabel.Text = oldText;
				end
				randomInt = randomInt + 1;
				if #textArray < randomInt then
					randomInt = 1;
				end;
				wait(0.1);	
			end;
		end);


		game:GetService("Players").PlayerAdded:Connect(function(v)
			
			v.Chatted:connect(function(msg)
				if variables.globalChat then
					if isUserFriend(v.Name) then
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[" .. v.Name .. "]: " .. msg, 
							Font = Enum.Font.SourceSansBold,
							Color = BrickColor.new("Bright green").Color
						});
					elseif isUserEnemy(v.Name) then
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[" .. v.Name .. "]: " .. msg, 
							Font = Enum.Font.SourceSansBold,
							Color = BrickColor.new("Bright red").Color
						});
					else
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[" .. v.Name .. "]: " .. msg, 
							Font = Enum.Font.SourceSansBold
						});
					end
				end
			end)
			pcall(function()
				if isUserFriend(v.Name) then
					notice:Fire("Lunahax", "Friend " .. v.name .. " has joined the game!", 6)
				elseif isUserEnemy(v.Name) then
					notice:Fire("Lunahax", "Enemy " .. v.name .. " has joined the game!", 4)
				end
			end)
			
			pcall(function()
				if isUserEsMod(v.Name) then
					notice:Fire("Lunahax", "WARNING! Moderator " .. v.Name .. " is in your game.", 4);
				end
			end)
			
		end)
		 
		game:GetService("Players").PlayerRemoving:Connect(function(v)
			pcall(function()
				if isUserFriend(v.Name) then
					notice:Fire("Lunahax", "Friend " .. v.name .. " has left the game!")
				elseif isUserEnemy(v.Name) then
					notice:Fire("Lunahax", "Enemy " .. v.name .. " has left the game!")
				end
			end)
		end)







		-- nodekill stuff
		spawn(function()
			while wait() do
				if variables.isNodeKillEnabled then
					local localPlayer = game.Players.LocalPlayer;
					if game:GetService("Players")[localPlayer.Name].Flagged.Value then
						local function u1(p1, p2)
							return Vector3.new(p2.x - p1.x, p2.y - p1.y, p2.z - p1.z);
						end;
						function checknode(p5, p6)
							p5.Size = Vector3.new(1.8, 1.8, 1.8);
							local v13 = { p5.CFrame * CFrame.new(-p5.Size.x / 2 * p5.Mesh.Scale.X, 0, p5.Size.z / 2 * p5.Mesh.Scale.Z), p5.CFrame * CFrame.new(p5.Size.x / 2 * p5.Mesh.Scale.X, 0, p5.Size.z / 2 * p5.Mesh.Scale.Z), p5.CFrame * CFrame.new(p5.Size.x / 2 * p5.Mesh.Scale.X, 0, -p5.Size.z / 2 * p5.Mesh.Scale.Z), p5.CFrame * CFrame.new(0, p5.Size.y / 2 * p5.Mesh.Scale.Y, 0), p5.CFrame * CFrame.new(0, -p5.Size.y / 2 * p5.Mesh.Scale.Y, 0) };
							local v14 = u1(v13[1], v13[2]);
							local v15 = u1(v13[2], v13[3]);
							local v16 = u1(v13[4], v13[5]);
							local v17 = v14:Dot((u1(v13[1], p6)));
							local v18 = v14:Dot(v14);
							local v19 = v15:Dot((u1(v13[2], p6)));
							local v20 = v15:Dot(v15);
							local v21 = v16:Dot((u1(v13[4], p6)));
							local v22 = v16:Dot(v16);
							local v23 = false;
							if v17 >= 0 then
								v23 = false;
								if v17 <= v18 then
									v23 = false;
									if v19 >= 0 then
										v23 = false;
										if v19 <= v20 then
											v23 = false;
											if v21 >= 0 then
												v23 = v21 <= v22;
											end;
										end;
									end;
								end;
							end;
							return v23;
						end;
						
						
						for i,vPlayer in pairs(game:GetService("Players"):GetPlayers()) do
							pcall(function()
								if vPlayer.Name == localPlayer.Name then
								else
									if isUserFriend(vPlayer.Name) == false then
										isValidChar = false;
										pcall(function()
											print(vPlayer.Character.PrimaryPart.Position);
											isValidChar = true;
										end)
										if isValidChar then
											local isInNode = checknode(game:GetService("Workspace").Buildings[localPlayer.Name].Node.PrimaryPart, vPlayer.Character.PrimaryPart.Position)
											if isInNode then
												local hasKillzone = game:GetService("Workspace").Buildings[localPlayer.Name].Node.Killzone.Value
												if hasKillzone then
													if vPlayer.Character.Humanoid.Health == 0 then
													else
														if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Reload then
															local cFrameRn = nil;
															local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
															local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
															local Humanoid =  character:WaitForChild("Humanoid")
															cFrameRn = CFrame.new(Vector3.new(HumanoidRootPart.CFrame.X, HumanoidRootPart.CFrame.Y, HumanoidRootPart.CFrame.Z));
															local theirChar = vPlayer.Character
															local theirRoot = theirChar:WaitForChild("HumanoidRootPart")
															HumanoidRootPart.CFrame = theirRoot.CFrame;
															
															pcall(function()
																for count = 1, 10 do
																	if vPlayer.Character.Humanoid.Health == 0 then
																		break;
																	end
																	if checknode(game:GetService("Workspace").Buildings[localPlayer.Name].Node.PrimaryPart, vPlayer.Character.PrimaryPart.Position) then
																		wait(0.2);
																		Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[vPlayer.Name].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[vPlayer.Name].Humanoid, 26, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
																	end
																end
															end)
															HumanoidRootPart.CFrame = CFrame.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z)
															notice:Fire("Lunahax", "Player " .. vPlayer.Name .. " in your node has been killed!");
														end
													end
												end
											end
										end
									end
								end
							end)
						end
					end
				end
				wait(1);
			end
		end)


			local function round(n)
				return math.floor(n + 0.5)
			end
			---------------
			-- esp stuff, player
			Holder = Instance.new("Folder", game.CoreGui)
			Holder.Name = "ESP"
			 
			local Box = Instance.new("BoxHandleAdornment")
			Box.Name = "nilBox"
			Box.Size = Vector3.new(4, 7, 4)
			Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
			Box.Transparency = 0.7
			Box.ZIndex = 0
			Box.AlwaysOnTop = true
			Box.Visible = true
			 
			local NameTag = Instance.new("BillboardGui")
			NameTag.Name = "nilNameTag"
			NameTag.Enabled = false
			NameTag.Size = UDim2.new(0, 200, 0, 50)
			NameTag.AlwaysOnTop = true
			NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
			local Tag = Instance.new("TextLabel", NameTag)
			Tag.Name = "Tag"
			Tag.BackgroundTransparency = 1
			Tag.Position = UDim2.new(0, -50, 0, 0)
			Tag.Size = UDim2.new(0, 300, 0, 20)
			Tag.TextSize = 13
			Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
			Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
			Tag.TextStrokeTransparency = 0.4
			Tag.Text = "nil"
			Tag.Font = Enum.Font.SourceSansBold
			Tag.TextScaled = false
			 
			local LoadCharacter = function(v)
			spawn(function()
				repeat wait(1) until v.Character ~= nil
				if v.Name == game:GetService("Players").LocalPlayer.Name then
				
				elseif v.Name == nil then
				
				else
					if has_value(variables.espIgnored, v.Name) then
					else
						v.Character:WaitForChild("Humanoid")
						local vHolder = Holder:FindFirstChild(v.Name)
						local HumanoidRootPartPlyr = v.Character:WaitForChild("HumanoidRootPart")
						if HumanoidRootPartPlyr.CFrame.Y < 125 then
						
						else
							vHolder:ClearAllChildren()
							local b = Box:Clone()
							b.Name = v.Name .. "Box"
							b.Adornee = v.Character
							b.Parent = vHolder
							local t = NameTag:Clone()
							t.Name = v.Name .. "NameTag"
							t.Enabled = true
							t.Parent = vHolder
							t.Adornee = v.Character:WaitForChild("Head", 5)
							if not t.Adornee then
								return UnloadCharacter(v)
							end
							t.Tag.Text = v.Name
							b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
							t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
							local Update
							local UpdateNameTag = function()
								if not pcall(function()
									v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
									local maxh = math.floor(v.Character.Humanoid.MaxHealth)
									local h = math.floor(v.Character.Humanoid.Health)
									
									local prependText = ""
									local appendText = ""
									
									
									local isSpy = false;
									
									if v.Character.Head.Transparency == 2 then
										prependText = prependText .. "[CAR] "
									end
									
									if v.Character.Head.Transparency == 11 then
										prependText = prependText .. "[SPY] "
										isSpy = true
									end
									
									
									if isSpy then
										t.Tag.TextColor3 = Color3.new(0, 255, 234)
									else
										t.Tag.TextColor3 = Color3.new(255, 255, 255)
									end
									
									
									if game:GetService("Players")[v.Name].Flagged.Value then
										if game:GetService("Workspace")[v.Name].NameTag.TextLabel.TextColor3 ==  Color3.fromRGB(255, 187, 69) then
											prependText = prependText .. "[F] "
											t.Tag.TextColor3 = Color3.fromRGB(255, 187, 69)
										elseif game:GetService("Workspace")[v.Name].NameTag.TextLabel.TextColor3 ==  Color3.fromRGB(255, 33, 33) then
											prependText = prependText .. "[F] "
											t.Tag.TextColor3 = Color3.fromRGB(255, 33, 33)
										else
											prependText = prependText .. "[F] "
										end
									end
									
									for _asd, vCharItems in pairs(game:GetService("Players")[v.Name].Character:GetChildren()) do 
										if vCharItems:IsA("Tool") then 
											appendText = vCharItems.Name .. "\n"
										end
									end
									local distance = round((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude)
	
									t.Tag.Text = prependText .. v.Name .. " " .. ((maxh ~= 0 and tostring(math.floor((h / maxh) * 100))) or "0") .. "%\n" .. appendText .. "H: " .. game:GetService("Players")[v.Name].PlayerData.Hunger.Value .. " Karma: " .. game:GetService("Players")[v.Name].PlayerData.Karma.Value .. "\nA$" .. game:GetService("Players")[v.Name].PlayerData.PCurrency.Value .. "/$" .. game:GetService("Players")[v.Name].PlayerData.Currency.Value .. " (" .. distance .. " studs)\n"
								end) then
									Update:Disconnect()
								end
							end
							UpdateNameTag()
							Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
						end
					end
				end
				end)
			end
			 
			 

			 
			local UnloadCharacter = function(v)
				local vHolder = Holder:FindFirstChild(v.Name)
				if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
					vHolder:ClearAllChildren()
				end
			end
			 
			local LoadPlayer = function(v)
				local vHolder = Instance.new("Folder", Holder)
				vHolder.Name = v.Name
				v.CharacterAdded:Connect(function()
					if variables.friendEspEnabled then
						if isUserFriend(v.Name) then
							pcall(LoadCharacter, v)
						end
					elseif variables.enemyEspEnabled then
						if isUserEnemy(v.Name) then
							pcall(LoadCharacter, v)
						end
					elseif variables.enemyEspEnabled and variables.friendEspEnabled then
						if isUserEnemy(v.Name) or isUserFriend(v.Name) then
							pcall(LoadCharacter, v)
						end
					end
					if not variables.enemyEspEnabled or variables.friendEspEnabled then
						pcall(LoadCharacter, v)
					end
				end)
				v.CharacterRemoving:Connect(function()
					pcall(UnloadCharacter, v)
				end)
				v.Changed:Connect(function(prop)
					if prop == "TeamColor" then
						UnloadCharacter(v)
						wait()
						if variables.friendEspEnabled then
						if isUserFriend(v.Name) then
								pcall(LoadCharacter, v)
							end
						elseif variables.enemyEspEnabled then
							if isUserEnemy(v.Name) then
								pcall(LoadCharacter, v)
							end
						else
							pcall(LoadCharacter, v)
						end
					end
				end)
				if variables.friendEspEnabled then
					if isUserFriend(v.Name) then
						pcall(LoadCharacter, v)
					end
				elseif variables.enemyEspEnabled then
					if isUserEnemy(v.Name) then
						pcall(LoadCharacter, v)
					end
				else
					pcall(LoadCharacter, v)
				end
			end
			 
			local UnloadPlayer = function(v)
				UnloadCharacter(v)
				local vHolder = Holder:FindFirstChild(v.Name)
				if vHolder then
					vHolder:Destroy()
				end
			end
			
			
						 
			specificEspButton.Activated:Connect(function()
				local PlayerToESP = game:GetService("Players")[variables.playerNameClicked]
				LoadPlayer(PlayerToESP)
				notice:Fire("Lunahax", "Only showing this player now.");
			end)

			spawn(function()
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if variables.espEnabled then
						spawn(function() pcall(LoadPlayer, v) end)
					end
				end
				 
				game:GetService("Players").PlayerAdded:Connect(function(v)
					if variables.espEnabled then
						if variables.friendEspEnabled then
							if isUserFriend(v.Name) then
								pcall(LoadPlayer, v)
							end
						elseif variables.enemyEspEnabled then
							if isUserEnemy(v.Name) then
								pcall(LoadPlayer, v)
							end
						else
							pcall(LoadPlayer, v)
						end
					end
				end)
				 
				game:GetService("Players").PlayerRemoving:Connect(function(v)
					pcall(UnloadPlayer, v)
				end)

				playerEspButton.Activated:Connect(function()
					if variables.espEnabled then
						variables.espEnabled = false;
						playerEspButton.Text = "[OFF] Player ESP"
						notice:Fire("Lunahax", "ESP Disabled.");
						for i,v in pairs(game:GetService("Players"):GetPlayers()) do
							pcall(UnloadPlayer, v);
						end
					else
						variables.espEnabled = true;
						playerEspButton.Text = "[ON] Player ESP"
						notice:Fire("Lunahax", "ESP Enabled.");

						for i,v in pairs(game:GetService("Players"):GetPlayers()) do
							spawn(function() 
								if variables.friendEspEnabled then
									if isUserFriend(v.Name) then
										pcall(LoadPlayer, v)
									end
								elseif variables.enemyEspEnabled then
									if isUserEnemy(v.Name) then
										pcall(LoadPlayer, v)
									end
								else
									pcall(LoadPlayer, v)
								end
							end)
						end
					end
				end)
				 
				game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
			end);
		

		pcall(function()
			local player = game.Players.LocalPlayer
			local mouse = player:GetMouse()
			local Aiming = false


			local Players = game:GetService("Players")
			local function GetClosest()
				local Character = player.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				if not (Character or HumanoidRootPart) then return end

				local TargetDistance = math.huge
				local Target

				for i,v in ipairs(Players:GetPlayers()) do
					if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and isUserFriend(v.Name) ~= true then
						if variables.onlyFlagged and v.Flagged.Value or variables.onlyFlagged == false then
							local TargetHRP = v.Character.HumanoidRootPart
							local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
							if mag < TargetDistance then
								TargetDistance = mag
								Target = v
							end
						else
							
						end
					end
				end

				return Target
			end


			function AimLock()
				local target
				local lastmagnitude = math.huge
				pcall(function()
					local v = GetClosest();
					print(v.Name);
					if v ~= player then
						if v.Character then
							if mouse.Icon == "rbxassetid://2872049636" then
								if player:DistanceFromCharacter(game:GetService("Players")[v.Name].Character.HumanoidRootPart.Position) > 450 then
								
								else
									local withinScreenBounds = game:GetService("Workspace").Camera:WorldToScreenPoint(game:GetService("Players")[v.Name].Character.HumanoidRootPart.Position)
									if withinScreenBounds then
										local charpos = v.Character.HumanoidRootPart.CFrame.Position
										local playerpos = player.Character.HumanoidRootPart.CFrame.Position
										if (charpos - playerpos).Magnitude < lastmagnitude then
											lastmagnitude = (charpos - playerpos).Magnitude
											target = v
										end
									end
								end
							end
						end
					end
				end)
				if target and target.Character then
					local charpos = target.Character.HumanoidRootPart.CFrame.Position
					local cam = workspace.CurrentCamera
					local pos = cam.CFrame.Position
					workspace.CurrentCamera.CFrame = CFrame.new(pos, charpos)
				end
			end

			spawn(function()
				while true do
					if mouse.Icon == "rbxassetid://2872049636" then
						if variables.aimbotEnabled then
							AimLock()
							wait()
						end
					end
					wait()
				end
			end)
		end)
		
		
		
		------------
		-- global chat
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			pcall(function()
				if isUserEsMod(v.Name) then
					notice:Fire("Lunahax", "WARNING! Moderator " .. v.Name .. " is in your game.", 4);
				end
			end)
			v.Chatted:connect(function(msg)
				if variables.globalChat then
					if isUserFriend(v.Name) then
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[" .. v.Name .. "]: " .. msg, 
							Font = Enum.Font.SourceSansBold,
							Color = BrickColor.new("Bright green").Color
						});
					elseif isUserEnemy(v.Name) then
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[" .. v.Name .. "]: " .. msg, 
							Font = Enum.Font.SourceSansBold,
							Color = BrickColor.new("Bright red").Color
						});
					else
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[" .. v.Name .. "]: " .. msg, 
							Font = Enum.Font.SourceSansBold
						});
					end
				end
			end)
		end
		
		
		
		--------------------
		-- nlr bypass stuffs
		local function nlrLoop()
			while true do 
				local wrkspce = game:GetService("Workspace")
				for _, v in pairs(wrkspce:GetChildren()) do
					if v.Name == "NL" then
						if _G.nlrLoop then
							v:destroy()
							print("Deleting NLR sphere...");
						end
					end
				end
				wait(0.5)
			end
		end
		spawn(nlrLoop)

		disableNlrButton.Activated:Connect(function()
			if _G.nlrLoop then
				_G.nlrLoop = false;
				disableNlrButton.Text = "[OFF] Disable NLR"
				notice:Fire("Lunahax", "NLR Re-enabled.");
			else
				_G.nlrLoop = true;
				disableNlrButton.Text = "[ON] Disable NLR"
				notice:Fire("Lunahax", "NLR Disabled.");
			end
		end)

		
		
		friendEspButton.Activated:Connect(function()
			if variables.friendEspEnabled then
				variables.friendEspEnabled = false;
				friendEspButton.Text = "[OFF] FriendESP"
				notice:Fire("Lunahax", "FriendESP Disabled.");
			else
				variables.friendEspEnabled = true;
				friendEspButton.Text = "[ON] FriendESP"
				notice:Fire("Lunahax", "FriendESP Enabled.");
			end
		end)

		
		enemyEspButton.Activated:Connect(function()
			if variables.enemyEspEnabled then
				variables.enemyEspEnabled = false;
				enemyEspButton.Text = "[OFF] EnemyESP"
				notice:Fire("Lunahax", "FriendESP Disabled.");
			else
				variables.enemyEspEnabled = true;
				enemyEspButton.Text = "[ON] EnemyESP"
				notice:Fire("Lunahax", "FriendESP Enabled.");
			end
		end)
		


		--------------------
		-- door disable collisions (unlock all doors)

		unlockDoorsButton.Activated:Connect(function() 
			spawn(function()
				doors = { "Door", "Door Double", "Door Vault", "Door Double Rapture" }


				local wrkspce = game:GetService("Workspace")
				for _, v in pairs(wrkspce.Buildings:GetChildren()) do
				   local success, problem = pcall(function()
				   
						local successasd, problemasd = pcall(function()
							for _z, vz in pairs(v:GetChildren()) do
								if has_value(doors, vz.Name) then
									print("Unlocking " .. vz.Name)
									for _zz, vzz in pairs(vz:GetChildren()) do
										pcall(function()
											vzz.CanCollide = False
										end)
									end
									print("Unlocked " .. vz.Name)
								end
							end
						end)
						if successasd then
						else
						end
						
					end)
					if success then
					else
					end

				end
				notice:Fire("Lunahax", "Unlocked all doors! Remember to re-unlock if they open/close the door again!");
			end);
		end)



		---------------
		-- esp stuff, printer
		local wrkspce = game:GetService("Workspace")
		function doPrinters()
			PHolder = Instance.new("Folder", game.CoreGui)
			PHolder.Name = "PrinterESP"
			 
			local Box = Instance.new("BoxHandleAdornment")
			Box.Name = "nilBox"
			Box.Size = Vector3.new(2, 2, 2)
			Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
			Box.Transparency = 0.7
			Box.ZIndex = 0
			Box.AlwaysOnTop = true
			Box.Visible = true
			 
			local NameTag = Instance.new("BillboardGui")
			NameTag.Name = "nilNameTag"
			NameTag.Enabled = false
			NameTag.Size = UDim2.new(0, 200, 0, 50)
			NameTag.AlwaysOnTop = true
			NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
			local Tag = Instance.new("TextLabel", NameTag)
			Tag.Name = "Tag"
			Tag.BackgroundTransparency = 1
			Tag.Position = UDim2.new(0, -50, 0, 0)
			Tag.Size = UDim2.new(0, 300, 0, 20)
			Tag.TextSize = 13
			Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
			Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
			Tag.TextStrokeTransparency = 0.4
			Tag.Text = "nil"
			Tag.Font = Enum.Font.SourceSansBold
			Tag.TextScaled = false

			for _, v in pairs(wrkspce.MoneyPrinters:GetChildren()) do
			   local success, problem = pcall(function()
					local printer = v
					local b = Box:Clone()
					b.Name = "Printer" .. "Box"
					b.Adornee = v.Main
					b.Parent = PHolder
					local t = NameTag:Clone()
					t.Name = "printer" .. "NameTag"
					t.Enabled = true
					t.Parent = PHolder
					t.Adornee = v.Main
					t.Tag.Text = v.Name .. "\nAmount left: $" .. v.Int.Money.Value;
					b.Color3 = Color3.new(0, 255, 0)
					t.Tag.TextColor3 = Color3.new(0, 255, 0)
					if variables.printerEspEnabled then
						NameTag:Clone().Parent = printer.Main
					end
				end)
				if success then
					--worked successfully
				else
					--no main on the printer
				end
				wait(0.1)
			end
		end

		function killPrinters()
			PHolder:Destroy();
		end


		printerEspButton.Activated:Connect(function()
			if variables.printerEspEnabled then
				variables.printerEspEnabled = false;
				printerEspButton.Text = "[OFF] Printer ESP"
				notice:Fire("Lunahax", "Printer ESP Disabled.");
				killPrinters()
			else
				variables.printerEspEnabled = true;
				printerEspButton.Text = "[ON] Printer ESP"
				notice:Fire("Lunahax", "Printer ESP Enabled.");
				doPrinters()
			end
		end)





		---------------
		-- esp stuff, crates
		local wrkspce = game:GetService("Workspace")
		function doCrates()
			CHolder = Instance.new("Folder", game.CoreGui)
			CHolder.Name = "CrateESP"
			 
			local Box = Instance.new("BoxHandleAdornment")
			Box.Name = "nilBox"
			Box.Size = Vector3.new(2, 2, 2)
			Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
			Box.Transparency = 0.7
			Box.ZIndex = 0
			Box.AlwaysOnTop = true
			Box.Visible = true
			 
			local NameTag = Instance.new("BillboardGui")
			NameTag.Name = "nilNameTag"
			NameTag.Enabled = false
			NameTag.Size = UDim2.new(0, 200, 0, 50)
			NameTag.AlwaysOnTop = true
			NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
			local Tag = Instance.new("TextLabel", NameTag)
			Tag.Name = "Tag"
			Tag.BackgroundTransparency = 1
			Tag.Position = UDim2.new(0, -50, 0, 0)
			Tag.Size = UDim2.new(0, 300, 0, 20)
			Tag.TextSize = 13
			Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
			Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
			Tag.TextStrokeTransparency = 0.4
			Tag.Text = "nil"
			Tag.Font = Enum.Font.SourceSansBold
			Tag.TextScaled = false

			for _, v in pairs(wrkspce.Entities:GetChildren()) do
			   local success, problem = pcall(function()
					if string.match(v.Name, "Shipment") then
						if v.Int.Uses.Value > 0 then
							if v.MeshPart.CFrame.Y < 125 then
							
							else
								local printer = v
								local b = Box:Clone()
								b.Name = "Crate" .. "Box"
								b.Adornee = v.MeshPart
								b.Parent = CHolder
								local t = NameTag:Clone()
								t.Name = "crate" .. "NameTag"
								t.Enabled = true
								t.Parent = CHolder
								t.Adornee = v.MeshPart
								t.Tag.Text = printer.Name .. "\nAmount left: " .. v.Int.Uses.Value;
								b.Color3 = Color3.new(0, 180, 255)
								t.Tag.TextColor3 = Color3.new(0, 180, 255)
								if crateEspEnabled then
									NameTag:Clone().Parent = printer.MeshPart
								end
							end
						end
					end
				end)
				if success then
					--worked successfully
				else
					--no MeshPart on the crate
				end
				wait(0.1)
			end
		end

		function killCrates()
			CHolder:Destroy();
		end


		crateEspButton.Activated:Connect(function()
			if crateEspEnabled then
				crateEspEnabled = false;
				crateEspButton.Text = "[OFF] Crate ESP"
				notice:Fire("Lunahax", "Crate ESP Disabled.");
				killCrates()
			else
				crateEspEnabled = true;
				crateEspButton.Text = "[ON] Crate ESP"
				notice:Fire("Lunahax", "Crate ESP Enabled.");
				doCrates()
			end
		end)
		
		
		
		
		
		

		---------------
		-- esp stuff, entitys
		local wrkspce = game:GetService("Workspace")
		function doEntities()
			EHolder = Instance.new("Folder", game.CoreGui)
			EHolder.Name = "EntityESP"
			 
			local Box = Instance.new("BoxHandleAdornment")
			Box.Name = "nilBox"
			Box.Size = Vector3.new(2, 2, 2)
			Box.Color3 = Color3.new(255, 0, 255)
			Box.Transparency = 0.7
			Box.ZIndex = 0
			Box.AlwaysOnTop = true
			Box.Visible = true
			 
			local NameTag = Instance.new("BillboardGui")
			NameTag.Name = "nilNameTag"
			NameTag.Enabled = false
			NameTag.Size = UDim2.new(0, 200, 0, 50)
			NameTag.AlwaysOnTop = true
			NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
			local Tag = Instance.new("TextLabel", NameTag)
			Tag.Name = "Tag"
			Tag.BackgroundTransparency = 1
			Tag.Position = UDim2.new(0, -50, 0, 0)
			Tag.Size = UDim2.new(0, 300, 0, 20)
			Tag.TextSize = 13
			Tag.TextColor3 = Color3.new(255, 0, 255)
			Tag.Text = "nil"
			Tag.Font = Enum.Font.SourceSansBold
			Tag.TextScaled = false

			for _, v in pairs(wrkspce.Entities:GetChildren()) do
			   local success, problem = pcall(function()
					if string.match(v.Name, "Shipment") then
					
					else
						local printer = v
						local mesh = nil;
						
						for _, vx in pairs(printer:GetChildren()) do
							pcall(function()
								if vx.ManualWeld.Name ~= "" then
									mesh = vx
								end
							end)
						end
						
						if mesh == nil then
							mesh = printer.Handle
						end

						local b = Box:Clone()
						b.Name = "Crate" .. "Box"
						b.Adornee = mesh
						b.Parent = EHolder
						local t = NameTag:Clone()
						t.Name = "crate" .. "NameTag"
						t.Enabled = true
						t.Parent = EHolder
						t.Adornee = mesh
						t.Tag.Text = printer.Int.Value;
						b.Color3 = Color3.new(255, 0, 255)
						t.Tag.TextColor3 = Color3.new(255, 0, 255)
						if entityEspEnabled then
							NameTag:Clone().Parent = mesh
						end
					end
				end)
				if success then
					--worked successfully
				else
					--no MeshPart on the Entity
				end
				wait(0.1)
			end
		end

		function killEntities()
			EHolder:Destroy();
		end


		entityEspButton.Activated:Connect(function()
			if entityEspEnabled then
				entityEspEnabled = false;
				entityEspButton.Text = "[OFF] Entity ESP"
				notice:Fire("Lunahax", "Entity ESP Disabled.");
				killEntities()
			else
				entityEspEnabled = true;
				entityEspButton.Text = "[ON] Entity ESP"
				notice:Fire("Lunahax", "Entity ESP Enabled.");
				doEntities()
			end
		end)







		if _G.prices == nil then
			_G.prices = {};
		end

		if _G.keywordreplies == nil then
			_G.keywordreplies = {};
		end


		local wishBotEnabled = true;
		local allOpenTrades = {};
		local tradesInProgress = {};
		local isSellingItemRn = false;
		local renamedItems = {};
		local cooldownPeople = {};
		local bypassChatEnabled = false;
		

		function addTrade(username, price, item)
			table.insert(allOpenTrades, { tostring(username), tonumber(price), (tonumber(os.time(os.date("!*t"))) + 120), tostring(item) });
		end

		function addInProgTrade(price)
			table.insert(tradesInProgress, { tonumber(price) } );
		end
		
		
		function doCooldown(username) -- true = can talk, false = cant
			if username == game.Players.LocalPlayer.Name then
				return true;
			end
			for i,v in pairs(cooldownPeople) do
				if tonumber(os.time(os.date("!*t"))) > v[2] then
					table.remove(cooldownPeople, tablefind(cooldownPeople, { v[1], v[2] }));
					if v[1] == username then
						table.insert(cooldownPeople, { tostring(username), (tonumber(os.time(os.date("!*t"))) + 5) });
						return true;
					end
				else
					if v[1] == username then
						return false;
					end
				end
			end
			table.insert(cooldownPeople, { tostring(username), (tonumber(os.time(os.date("!*t"))) + 5) } );
			return true;
		end



		function insertstring(str1, str2, pos)
			return str1:sub(1,pos)..str2..str1:sub(pos+1)
		end


		function bypassChat(chat)
			if bypassChatEnabled then
				stringReturn = "";
				
				for i,v in pairs(string.split(chat, " ")) do
					if string.len(v) > 1 then
						stringReturn = stringReturn .. insertstring(v, "ة", 1) .. " ";
					else
						stringReturn = stringReturn .. v .. " ";
					end
				end
				return stringReturn;
			end
			return chat;
		end
		

		function removeInProgTrade(price)
			table.remove(tradesInProgress, tablefind(tradesInProgress, { price }));
		end


		function getPrice(msg)
			local lastdotpos = (msg:reverse()):find(" ")
			return (msg:sub(1 - lastdotpos))
		end

		local currency = game.Players.LocalPlayer:WaitForChild("PlayerData"):WaitForChild("Currency");
		local lastChangedAmt = currency.Value;
		currency.Changed:connect(function(newVal)
			spawn(function()
				oldVal = lastChangedAmt;
				lastChangedAmt = newVal;
				difference = tonumber((newVal - oldVal));
				print("Money changed! Old value: " .. oldVal .. " New Value: " .. newVal .. " difference: " .. difference);
				pcall(function()
					for i,v in pairs(allOpenTrades) do
						shouldBreak = false;
						wasABuyer = false;
						wasSuccess = false;
						pcall(function()
							if difference == v[2] then
								Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. v[1] .. ", I recieved your payment, please stand still!"), "All");
								
								hasFoundTrade = false;
								for ilol,vlol in pairs(tradesInProgress) do
									if tonumber(vlol[1]) == v[2] then
										hasFoundTrade = true;
										shouldBreak = true;
										break;
									end
								end
								if hasFoundTrade == false then
									addInProgTrade(tonumber(v[2]));
									while isSellingItemRn do
										wait(1);
									end
									isSellingItemRn = true;
									shouldBreak = true;
									wasABuyer = true;
									local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls();
									pcall(function()
										controls:Disable();
										buyersUsername = v[1];
										buyersItem = string.lower(v[4]);
										
										localitm = nil;
										
										for i1, v1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
											if string.lower(v1.Name) == buyersItem then
												localitm = v1;
												break;
											end
										end
										
										if localitm == nil then
											for i2,v2 in pairs(string.split(game.Players.LocalPlayer.PlayerData.Inventory.Value, ",")) do
												if string.lower(tostring(v2)) == buyersItem then
													shouldBreakThis = false;
													Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(3, tostring(v2));
													wait(1);
													for i1, v1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
														if string.lower(tostring(v1.Name)) == buyersItem then
															localitm = v1;
															shouldBreakThis = true;
															break;
														end
													end
													if shouldBreakThis then
														break;
													end
												end
											end
										end
										
										itemNamee = "";
										pcall(function()
											itemNamee = localitm.Name;
										end)
										
										if itemNamee == "" then
											Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("[/ad wishbot] Hey " .. v[1] .. ", Coulden't find the item, refunding..."), "All");
											table.remove(allOpenTrades, tablefind(allOpenTrades, v));
											Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(2, tostring(v[2]), tostring(buyersUsername));
											isSellingItemRn = false;
											removeInProgTrade(tonumber(v[2]));
										else
											local cFrameRn = nil;
											local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();
											local HumanoidRootPart = character:WaitForChild("HumanoidRootPart");
											cFrameRn = CFrame.new(Vector3.new(HumanoidRootPart.CFrame.X, HumanoidRootPart.CFrame.Y, HumanoidRootPart.CFrame.Z));
											
											_G.redRageAuraEnabled = false;
											_G.yellowRageAuraEnabled = false;
											_G.nlrLoop = true;
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[tostring(v[1])].Character.HumanoidRootPart.CFrame;
											wait(1);
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(localitm);
											wait(1);
											Game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(1);
											wait(1);
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cFrameRn;
											wait(1);

											wasSuccess = true;
											isSellingItemRn = false;
											Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. v[1] .. ", Teleported and dropped item to you!"), "All");
											controls:Enable();
											removeInProgTrade(tonumber(v[2]));
											table.remove(allOpenTrades, tablefind(allOpenTrades, v));
											wait(1);
										end
									end)
								end
							end
						end)
						if wasABuyer and wasSuccess == false then
							shouldBreak = true;
							Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. v[1] .. ", Coulden't find the item, refunding..."), "All");
							table.remove(allOpenTrades, tablefind(allOpenTrades, v));
							Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(2, tostring(v[2]), tostring(buyersUsername));
							local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls();
							controls:Enable();
							isSellingItemRn = false;
							removeInProgTrade(tonumber(v[2]));
						end
						local foundWatch = false

						for iaa,vaa in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
							if string.lower(tostring(vaa.Name)) == buyersItem then
								shouldBreak = true;
								Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. v[1] .. ", something went wrong, refunding you..."), "All");
								table.remove(allOpenTrades, tablefind(allOpenTrades, v));
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(2, tostring(v[2]), tostring(buyersUsername));
								local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls();
								controls:Enable();
								isSellingItemRn = false;
								removeInProgTrade(tonumber(v[2]));
							end
						end
						local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls();
						controls:Enable();
						if shouldBreak then
							break;
						end
					end
				end)
				local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls();
				controls:Enable();
			end)
		end);



		function tablefind(tab,el)
			for index, value in pairs(tab) do
				if value == el then
					return index
				end
			end
		end



		spawn(function()
			while true do
				pcall(function()
					for i,v in pairs(allOpenTrades) do
						pcall(function()
							currTime = tonumber(os.time(os.date("!*t")));
							if v[3] < currTime then
								Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. v[1] .. ", your trade expired!"), "All");
								table.remove(allOpenTrades, tablefind(allOpenTrades, v));
							end
						end)
					end
				end)
				wait(1);
			end
		end)


		function setPrice(itemName, price)
			didSet = false;
			for i,v in pairs(_G.prices) do
				if v[1] == itemName then
					v[2] = price;
					didSet = true;
					break;
				end
			end
			if didSet then
				return true;
			else
				table.insert(_G.prices, { tostring(itemName), tonumber(price) });
				return true;
			end
		end


		function itemInStock(buyersItem)
			isInPrices = false;
			for i,v in pairs(_G.prices) do
				if string.lower(v[1]) == string.lower(buyersItem) then
					isInPrices = true;
					break;
				end
			end
			if isInPrices then
				localitm = nil;
				for i1, v1 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if string.lower(v1.Name) == string.lower(buyersItem) then
						localitm = v1;
						break;
					end
				end
				
				if localitm == nil then
					for i2,v2 in pairs(string.split(game.Players.LocalPlayer.PlayerData.Inventory.Value, ",")) do
						if string.lower(v2) == string.lower(buyersItem) then
							localitm = v2;
						end
					end
				end
				if localitm == nil then
					return false;
				else
					return true;
				end
			else
				return false;
			end
		end


		function getItemPrice(buyersItem)
			for i,v in pairs(_G.prices) do
				if string.lower(v[1]) == string.lower(buyersItem) then
					if v[2] == 0 then
						return 0;
					else
						return tonumber(v[2]);
					end
				end
			end
			return 0;
		end


		function removeNumbers(text)
			fullResult = "";
			for i = 1, #text do
				c = text:sub(i,i)
				if c == "1" or c == "2" or c == "3" or c == "4" or c == "5" or c == "6" or c == "7" or c == "8" or c == "9" or c == "0" then -- why doesnt lua have if char numeric like c# 
				
				else
					fullResult = fullResult .. c;
				end
			end
			fullResult = string.lower(fullResult);
			return fullResult;
		end


		function getKeywordResponse(buyersItem)
			if _G.keywordreplies ~= nil then
				for i,v in pairs(_G.keywordreplies) do
					if string.find(buyersItem, v[1]) then
						return v[2];
					end
				end
			end
			return "";
		end


		wishBotPrefix = "!";
		
		function envIsAlphaNum(sIn)
			return (string.match(sIn,"[^%w]") == nil)
		end
		
		
		function checkIfUsedPrice(price)
			for iasdasd,viasdasd in pairs(allOpenTrades) do
				if tonumber(viasdasd[2]) == tonumber(uniqPrice) then
					return true;
				end
			end
			return false;
		end
		
		
		local function onPlayerChatted(player, message)
			if _G.wishBotEnabled then
				pcall(function()
					command = string.split(string.split(message, wishBotPrefix)[2], " ")[1];
					if string.match(message, "/ad ") then
						spawn(function()
							username = player.Name:gsub('%s+', '');
							if isUserEnemy(username) then
								
							else
								if doCooldown(username) then
									if command == "buy" then
										if wishBotEnabled then
											if username == game.Players.LocalPlayer.Name then
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[wishbot] You can't buy your own item!", "All");
											else
												itemToBuy = "";
												if string.match(message, "\"") then
													for match in string.gmatch(message, "%b\"\"") do
													   itemToBuy = string.gsub(match, "\"", "");
													   break;
													end
												else
													itemToBuy = string.split(message, " ")[3];
												end
												if itemToBuy ~= nil then
													if string.match(string.lower(itemToBuy), "cola") then
														itemToBuy = "Bloxy Cola";
													end
													pcall(function()
														for iqqq,vqqq in pairs(renamedItems) do
															if tostring(vqqq[2]) == itemToBuy then
																itemToBuy = tostring(vqqq[1]);
																break;
															end
														end
													end)
													if getKeywordResponse(message) == "" then
														if itemInStock(itemToBuy) then
															if getItemPrice(itemToBuy) > 0 then
																uniqPrice = (getItemPrice(itemToBuy) + math.random(1,100));
																if checkIfUsedPrice(uniqPrice) then
																	Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. removeNumbers(username) .. ", Something went wrong!"), "All");
																else
																	addTrade(username, tonumber(uniqPrice), itemToBuy);
																	Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. removeNumbers(username) .. ", Please send me EXACTLY $" .. uniqPrice .. "pesos!"), "All");
																	wait(1);
																	Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] The price is slightly higher so the bot knows who's who.", "All");
																end
															else
																Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] That item has been disabled for purchasing.", "All");
															end
														else
															Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Sorry, but that item isn't in stock, did you spell it correctly?", "All");
														end
													else
														Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. removeNumbers(username) .. ", " .. getKeywordResponse(message)), "All");
													end
												end
											end
										else
											Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Sorry, Wish bot is disabled!", "All");
										end
									elseif command == "setprice" then
										if username == game.Players.LocalPlayer.Name then
											wasSuccess = false;
											pcall(function()
												itemToSet = "";
												itemPrice = 0;
												if string.match(message, "\"") then
													for match in string.gmatch(message, "%b\"\"") do
													   itemToSet = string.gsub(match, "\"", "");
													   itemPrice = tonumber(getPrice(message));
													   break;
													end
												else
													itemToSet = string.split(message, " ")[3];
													itemPrice = tonumber(string.split(message, " ")[4]);
												end
												pcall(function()
													for iqqq,vqqq in pairs(renamedItems) do
														if tostring(vqqq[2]) == itemToSet then
															itemToSet = tostring(vqqq[1]);
															break;
														end
													end
												end)
												setPrice(itemToSet, itemPrice);
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] " .. itemToSet .. " is now $" .. itemPrice .. "!"), "All");
												wasSuccess = true;
											end)
											if wasSuccess == false then
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Something went wrong, did you enter a item name + price?", "All");
											end
										end
									elseif command == "stock" then
										Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Current available stock (this might take a while):", "All");
										wait(2);
										for i,v in pairs(_G.prices) do
											pcall(function()
												displayedItemName = v[1];
												itemToBuy = v[1];
												for iqqq,vqqq in pairs(renamedItems) do
													if tostring(vqqq[1]) == v[1] then
														displayedItemName = tostring(vqqq[2]);
														itemToBuy = tostring(vqqq[1]);
														break;
													end
												end
												if itemInStock(itemToBuy) and getItemPrice(itemToBuy) > 0 then
													Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Item: " .. displayedItemName .. " Price: " .. getItemPrice(itemToBuy)), "All");
													wait(3);
												end
											end)
										end
										Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] End of list.", "All");
									elseif command == "price" then
										itemToBuy = "";
										renamedItemName = "";
										if string.match(message, "\"") then
											for match in string.gmatch(message, "%b\"\"") do
											   itemToBuy = string.gsub(match, "\"", "");
											   break;
											end
										else
											itemToBuy = string.split(message, " ")[3];
										end
										if itemToBuy ~= nil then
											if string.match(string.lower(itemToBuy), "cola") then
												itemToBuy = "Bloxy Cola";
											end
											renamedItemName = itemToBuy;
											pcall(function()
												for iqqq,vqqq in pairs(renamedItems) do
													if tostring(vqqq[2]) == itemToBuy then
														itemToBuy = tostring(vqqq[1]);
														renamedItemName = tostring(vqqq[2]);
														break;
													end
												end
											end)
											if getKeywordResponse(message) == "" then
												if itemInStock(itemToBuy) and getItemPrice(string.lower(itemToBuy)) > 0 then
													Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Item: " .. renamedItemName .. " Price: " .. getItemPrice(string.lower(itemToBuy))), "All");
												else
													Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Sorry, that item isn't available right now.", "All");
												end
											else
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] Hey " .. removeNumbers(username) .. ", " .. getKeywordResponse(message)), "All");
											end
										end
									elseif command == "disable" then
										if username == game.Players.LocalPlayer.Name then
											wishBotEnabled = false;
											Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Wish bot disabled!", "All");
										end
									elseif command == "enable" then
										if username == game.Players.LocalPlayer.Name then
											wishBotEnabled = true;
											Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Wish bot enabled!", "All");
										end
									elseif command == "help" then
										Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] " .. wishBotPrefix .. "help, " .. wishBotPrefix .. "buy (item) " .. wishBotPrefix .. "price (item), " .. wishBotPrefix .. "stock", "All");
										wait(1);
										Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] If you're trying to buy an item with a space", "All");
										wait(1);
										Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Please put quotes around it, example: \"Bloxy Cola\"", "All");
										wait(1);
										if username == game.Players.LocalPlayer.Name then
											Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot owner] " .. wishBotPrefix .. "enable, " .. wishBotPrefix .. "disable, " .. wishBotPrefix .. "setprice (item) (price), " .. wishBotPrefix .. "rename, " .. wishBotPrefix .. "prefix, " .. wishBotPrefix .. "bypass", "All");
										end
									elseif command == "rename" then
										if username == game.Players.LocalPlayer.Name then
											wasSuccess = false;
											pcall(function()
												itemToSet = "";
												itemRenamedName = "";
												
												
												counterer = 0;
												for chunk in string.gmatch(message, "\"(.-)\"") do 
													counterer = counterer + 1;
													if counterer == 1 then
														itemToSet = chunk;
													elseif counterer == 2 then
														itemRenamedName = chunk;
													else
														break;
													end
												end
												if counterer > 1 then
													for iqqq,vqqq in pairs(renamedItems) do
														if tostring(vqqq[1]) == itemToSet then
															table.remove(renamedItems, tablefind(renamedItems, { vqqq[1], vqqq[2] }));
														end
													end
													
													if itemToSet ~= "" and itemRenamedName ~= "" then
														table.insert(renamedItems, { itemToSet, itemRenamedName });
														
														Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassChat("/ad [wishbot] " .. itemToSet .. " is now " .. itemRenamedName .. "!"), "All");
														wasSuccess = true;
													end
												end
											end)
											if wasSuccess == false then
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Something went wrong, did you enter the item name + renamed name?", "All");
											end
										end
									elseif command == "prefix" then
										if username == game.Players.LocalPlayer.Name then
											wasSuccess = false;
											pcall(function()
												newPrfix = string.lower(string.split(message, " ")[3]);
												if newPrfix ~= nil and envIsAlphaNum(newPrfix) == false then
													wishBotPrefix = newPrfix;
													Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] The prefix is now '" .. wishBotPrefix .. "'!", "All");
													wasSuccess = true;
												end
											end)
											if wasSuccess == false then
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Something went wrong, did you enter a prefix?", "All");
											end
										end
									elseif command == "bypass" then
										if username == game.Players.LocalPlayer.Name then
											wasSuccess = false;
											pcall(function()
												value = string.lower(string.split(message, " ")[3]);
												if value == "true" then
													bypassChatEnabled = true;
													wasSuccess = true;
													Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Chat bypass enabled!", "All");
												elseif value == "false" then
													bypassChatEnabled = false;
													wasSuccess = true;
													Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Chat bypass disabled!", "All");
												end
											end)
											if wasSuccess == false then
												Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Something went wrong, did you enter true/false?", "All");
											end
										end
									end
								end
							end
						end)
					end
				end)
			end
		end
		local function onPlayerAdded(player)
			pcall(function()
				player.Chatted:Connect(function (message) onPlayerChatted(player, message) end)
			end)
		end
		game.Players.PlayerAdded:Connect(onPlayerAdded)

		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			pcall(function()
				v.Chatted:Connect(function (message) onPlayerChatted(v, message) end)
			end)
		end
		print("wishbot loaded");
		
		-- button
		wishBotButton.Activated:Connect(function()
			if _G.wishBotEnabled then
				_G.wishBotEnabled = false;
				wishBotButton.Text = "[OFF] WishBot"
				notice:Fire("Lunahax", "WishBot disabled.");
				Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Wishbot has been disabled.", "All");
			else
				_G.wishBotEnabled = true;
				wishBotButton.Text = "[ON] WishBot"
				notice:Fire("Lunahax", "WishBot enabled.");
				Game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/ad [wishbot] Wishbot has been enabled! Type '/.ad !help' for info", "All");
			end
		end)
		
		
		
		
		
		
		
		
		
		
		----




		---- rage aura stuff, red players
		spawn(function()
			local player = game.Players.LocalPlayer
			local Players = game:GetService("Players")
			function GetClosestFlaggedRed()
				local TargetDistance = math.huge
				local Target
				pcall(function()
					local Character = player.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					if not (Character or HumanoidRootPart) then return end

					for i,v in ipairs(Players:GetPlayers()) do
						pcall(function()
							if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and isUserFriend(v.Name) ~= true then
								if v.Flagged.Value then
									local TargetHRP = v.Character.HumanoidRootPart
									local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
									if mag < TargetDistance then
										if v.Flagged.Value then -- if the user is flagged
											if game:GetService("Workspace")[v.Name].NameTag.TextLabel.TextColor3 ==  Color3.fromRGB(255, 33, 33) then
												TargetDistance = mag
												Target = v
											end
										end
									end
								else
									
								end
							end
						end)
					end
				end)
				return Target
			end

			function killClosestRed()
				pcall(function()
					if _G.redRageAuraEnabled then
						local Character = player.Character
						local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
						local closesttt = GetClosestFlaggedRed();
						local mag = (HumanoidRootPart.Position - closesttt.Character.HumanoidRootPart.Position).magnitude
						
						if mag < 250 then
							if closesttt.Flagged.Value then -- if the user is flagged
								if game:GetService("Workspace")[closesttt.Name].NameTag.TextLabel.TextColor3 ==  Color3.fromRGB(255, 33, 33) then
									if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Reload then
										Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[closesttt.Name].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[closesttt.Name].Humanoid, 100, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
									end
								end
							end
						end
					end
				end)
			end

			spawn(function()
				while true do
					pcall(function()
						if _G.redRageAuraEnabled then
							killClosestRed()
						end
					end)
					wait();
				end;
			end);
		end);


		---- rage aura stuff, yellow players
		spawn(function()
			local player = game.Players.LocalPlayer
			local Players = game:GetService("Players")
			function GetClosestFlaggedYellow()
				local TargetDistance = math.huge
				local Target
				pcall(function()
					local Character = player.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					if not (Character or HumanoidRootPart) then return end

					for i,v in ipairs(Players:GetPlayers()) do
						pcall(function()
							if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and isUserFriend(v.Name) ~= true then
								if v.Flagged.Value then
									local TargetHRP = v.Character.HumanoidRootPart
									local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
									if mag < TargetDistance then
										if v.Flagged.Value then -- if the user is flagged
											if game:GetService("Workspace")[v.Name].NameTag.TextLabel.TextColor3 ==  Color3.fromRGB(255, 187, 69) then
												TargetDistance = mag
												Target = v
											end
										end
									end
								else
									
								end
							end
						end)
					end
				end)
				return Target
			end

			function killClosestYellow()
				pcall(function()
					if _G.yellowRageAuraEnabled then
						local Character = player.Character
						local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
						local closesttt = GetClosestFlaggedYellow();
						local mag = (HumanoidRootPart.Position - closesttt.Character.HumanoidRootPart.Position).magnitude
						
						if mag < 250 then
							if closesttt.Flagged.Value and player.Flagged.Value then -- if the user is flagged
								if game:GetService("Workspace")[closesttt.Name].NameTag.TextLabel.TextColor3 ==  Color3.fromRGB(255, 187, 69) then
									if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Reload then
										Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(33, game:GetService("Workspace")[closesttt.Name].HumanoidRootPart.CFrame, 1, game:GetService("Workspace")[closesttt.Name].Humanoid, 100, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"));
									end
								end
							end
						end
					end
				end)
			end

			spawn(function()
				while true do
					pcall(function()
						if _G.yellowRageAuraEnabled then
							killClosestYellow()
						end
					end)
					wait();
				end;
			end);
		end);


		spawn(function()
			while true do
				pcall(function()
					if variables.autoColaDrink then
						for _, vItm in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
							if vItm.Name == "Bloxy Cola" then
								if game.Players.LocalPlayer.Character.Humanoid.Health <= 80 then
									Game:GetService("ReplicatedStorage").Events.ToolsEvent:FireServer(4, vItm);
								end
							end
						end
					end
				end)
			wait();
			end
		end);
		
		
		
		
		
		function GetClosestOwnedMaterial()
			local lplayer = game.Players.LocalPlayer
			local Character = lplayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			if not (Character or HumanoidRootPart) then return end
			local TargetDistance = math.huge
			local Target
			for i,v in ipairs(game:GetService("Workspace").Materials:GetChildren()) do
				pcall(function()
					mesh = nil;	
					pcall(function()
						if v.PrimaryPart.Name ~= "" then
							mesh = v.PrimaryPart
						end
					end)
					pcall(function()
						if mesh == nil then
							mesh = v.PrimaryPart
						end
					end)
					if mesh then
						if string.lower(tostring(v.TrueOwner.Value)) == tostring(string.lower(game.Players.LocalPlayer.Name)) then
							local TargetHRP = mesh
							local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
							if mag < TargetDistance then
								TargetDistance = mag
								Target = v
							end
						end
					end
				end)
			end

			return Target
		end
					
		function runAutoScrapFarm()
			if variables.autoScrapFarm then
				pcall(function()
					hasFoundCargoStation = false;
					pcall(function()
						if game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Capital Cargo Station"].Name == "Capital Cargo Station" then
							hasFoundCargoStation = true;
						end
					end)
					if hasFoundCargoStation then
						cargoStation = game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Capital Cargo Station"];
						for i,v in pairs(game:GetService("Workspace").Scavage:GetChildren()) do
							if variables.autoScrapFarm and game.Players.LocalPlayer.PlayerData.CraftCharges.Value > 0 then
								pcall(function()
									if v.Name ~= "Vine" or v.Name ~= "Wooden Log" then
										didFindPart = false;
										pcall(function()
											print(v.PrimaryPart.CFrame);
											didFindPart = true;
										end)
										if didFindPart then
											local cFrameRn = nil;
											cFrameRn = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z));
											
											if variables.autoScrapFarm and game.Players.LocalPlayer.PlayerData.CraftCharges.Value > 0 then
												local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
												controls:Disable();
												
												CFrameEnd = v.PrimaryPart.CFrame;
												Time = 3
												tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
												tween:Play()
												tween.Completed:Wait()
												
												wait(2);
												Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(52, v);
												wait(1);
												itm = GetClosestOwnedMaterial();
												Game:GetService("ReplicatedStorage").Events.PickUpEvent:FireServer(itm, true);
												wait(1);
												
												CFrameEnd = cargoStation.Union.CFrame;
												Time = 3
												tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
												tween:Play()
												tween.Completed:Wait()
												
												wait(1);
												Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(41, cargoStation, itm);
												CFrameEnd = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z));
												Time = 3
												tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
												tween:Play()
												tween.Completed:Wait()
											else
												CFrameEnd = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z));
												Time = 3
												tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
												tween:Play()
												tween.Completed:Wait()
												
												notice:Fire("Lunahax", "Disabling autoscrapfarm!");
												variables.autoScrapFarm = false;
												autoScrapFarmButton.Text = "[OFF] AutoScrapFarm"
											end
										end
									end
								end)
							else
								notice:Fire("Lunahax", "Disabling autoscrapfarm!");
								variables.autoScrapFarm = false;
								autoScrapFarmButton.Text = "[OFF] AutoScrapFarm"
							end
						end
					else
						notice:Fire("Lunahax", "Please place a capital cargo station in your node for AutoScrapFarm!", 4);
					end
				end)
				local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
				controls:Enable();
			end
		end
		
		
		
		
		function autoCornFarmRun()
			if variables.autoCornFarm then
				hasFoundCargoStation = false;
				pcall(function()
					if game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Capital Cargo Station"].Name == "Capital Cargo Station" then
						hasFoundCargoStation = true;
					end
				end)
				if hasFoundCargoStation then
					pcall(function()
						cargoStation = game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Capital Cargo Station"];
						for i,v in pairs(game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]:GetChildren()) do
							pcall(function()
								if v.Name == "Corn Farm" or v.Name == "Tomato Farm" or v.Name == "Carrot Farm" then
									if v["3"].Transparency == 0 then
										pcall(function()
											-- ready for harvest
											local cFrameRn = nil;
											cFrameRn = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z));
											local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
											controls:Disable();
											pcall(function()
												wait(1);
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v["3"].CFrame;
												wait(1);
												Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(40, v);
												wait(1);
												Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(40, v);
												wait(1);
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cargoStation.Union.CFrame;
												wait(1);
												corn = nil;
												for i1, v1 in pairs(game:GetService("Workspace")[game.Players.LocalPlayer.Name]:GetChildren()) do
													if string.match(v1.Name, "Corn") or string.match(v1.Name, "Tomato") or string.match(v1.Name, "Carrot") then
														corn = v1;
														break;
													end
												end
												if corn ~= nil then
													Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(41, cargoStation, corn);
												end
											end)
											wait(1);
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z));
											wait(1);
											controls:Enable();
										end)
									end
								end
							end)
						end
					end)
				else
					notice:Fire("Lunahax", "Please place a capital cargo station in your node for AutoCornFarm!", 4);
				end
			end
		end
		
		
		function auroAureusRun()
			if variables.autoAureus then
				hasFoundScavStation = false;
				pcall(function()
					if game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Scavenge Station"].Name == "Scavenge Station" then
						hasFoundScavStation = true;
					end
				end)
				if hasFoundScavStation then
					pcall(function()
						scavStation = game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Scavenge Station"];
						timerOnThing = game.Players.LocalPlayer.PlayerGui.Client.Drone.Slots.Amt.Text;
						if timerOnThing == "Ready" then
							pcall(function()
								-- ready for drone
								local cFrameRn = nil;
								cFrameRn = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z));
								local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
								controls:Disable();
								pcall(function()
								
									CFrameEnd = scavStation.Union.CFrame;
									Time = 5
									tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
									tween:Play()
									tween.Completed:Wait()
									
									
									wait(1);
									Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(scavStation);
									wait(1);
									Game:GetService("ReplicatedStorage").Events.MenuAcitonEvent:FireServer(1, scavStation);
									wait(1);
									
									CFrameEnd = game:GetService("Workspace").DroneShipment.MeshPart.CFrame;
									Time = 5
									tween =  game:GetService("TweenService"):Create(game:GetService("Workspace").Drones[game.Players.LocalPlayer.Name].Hull, TweenInfo.new(Time), {CFrame = CFrameEnd})
									tween:Play()
									tween.Completed:Wait()
									
									wait(2);
									Game:GetService("ReplicatedStorage").Events.MenuAcitonEvent:FireServer(3);
									wait(1);
									game:GetService("Workspace").Drones[game.Players.LocalPlayer.Name].Hull.CFrame = game:GetService("Workspace").Buildings[game.Players.LocalPlayer.Name]["Scavenge Station"].Union.CFrame;
									wait(1);
									Game:GetService("ReplicatedStorage").Events.MenuAcitonEvent:FireServer(4);
									wait();
									Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(scavStation);
								end)
								wait(1);
								
								CFrameEnd = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z));
								Time = 5
								tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
								tween:Play()
								tween.Completed:Wait()
								
								wait(1);
								controls:Enable();
								Game:GetService("ReplicatedStorage").Events.ScavengeFunction:InvokeServer("Old-World Crate");
								
							end)
						end
					end)
				else
					notice:Fire("Lunahax", "Please place a scavenge station in your node for AutoAureus!", 4);
				end
			end
		end
		
		
		
		
		
		function autoScavRun()
			if variables.autoScavEnabled then
				local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Loot:GetChildren()) do
						wait(2);
						shouldBreak = false;
						pcall(function()
							if v.LootCrate ~= nil then
								pcall(function()
									controls:Disable();
									local cFrameRn = nil;
									cFrameRn = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z));									
									local CFrameEnd = v.LootCrate.CFrame;
									local Time = 5
									local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
									tween:Play()
									tween.Completed:Wait()
									wait(2);
									Game:GetService("ReplicatedStorage").Events.CratePickUpEvent:FireServer(v);
									wait(2);
																		
									local CFrameEnd = CFrame.new(Vector3.new(cFrameRn.X, cFrameRn.Y, cFrameRn.Z));
									local Time = 5
									local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
									tween:Play()
									tween.Completed:Wait()
									
									shouldBreak = true;
									wait(1);
								end)
							end
						end)
						if shouldBreak then
							break;
						end
					end
					controls:Enable();
				end)
				pcall(function()
					local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
					controls:Enable();
				end)
				Game:GetService("ReplicatedStorage").Events.ScavengeFunction:InvokeServer("Scavenge Crate");
			end
		end
		
		
		
		function getClosestOwnedPrinter()
			local lplayer = game.Players.LocalPlayer
			local Character = lplayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			if not (Character or HumanoidRootPart) then return end
			local TargetDistance = math.huge
			local Target
			for i,v in ipairs(game:GetService("Workspace").MoneyPrinters:GetChildren()) do
				pcall(function()
					mesh = nil;	
					pcall(function()
						if v.PrimaryPart.Name ~= "" then
							mesh = v.PrimaryPart
						end
					end)
					pcall(function()
						if mesh == nil then
							mesh = v.PrimaryPart
						end
					end)
					if mesh then
						if string.lower(tostring(v.TrueOwner.Value)) == tostring(string.lower(game.Players.LocalPlayer.Name)) then
							local TargetHRP = mesh
							local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
							if mag < TargetDistance then
								TargetDistance = mag
								Target = v
							end
						end
					end
				end)
			end

			return Target
		end


		isDoingPrinterRn = false;

		function doPrinterStuffy()
			pcall(function()
				if isDoingPrinterRn == false then
					isDoingPrinterRn = true;
					if variables.autoPrinterFarm then
						if variables.deathBarrierBypassEnabled then
							pcall(function()
								for i,v in pairs(game:GetService("Workspace").MoneyPrinters:GetChildren()) do
									if string.lower(tostring(v.TrueOwner.Value)) == tostring(string.lower(game.Players.LocalPlayer.Name)) then
										if tonumber(v.Int.Money.Value) > 0 then
											howManyIsLeft = v.Int.Uses.Value;
											
											cframeyy = CFrame.new(v.PrimaryPart.CFrame.X, v.PrimaryPart.CFrame.Y + 3, v.PrimaryPart.CFrame.Z); 
											
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframeyy;
											
											wait(2);
											Game:GetService("ReplicatedStorage").Events.InteractEvent:FireServer(v);
											
											if howManyIsLeft == 0 then
												wait(1);
												runAutoPrinter();
											end
										end
									end
								end
							end)
						else
							notice:Fire("Lunahax", "Please enable Bypass Barriers!", 4);
						end
					end
					isDoingPrinterRn = false;
				else
					
				end
			end)
			isDoingPrinterRn = false;
		end



		function runAutoPrinter()
			if variables.autoPrinterFarm then
				if variables.deathBarrierBypassEnabled then
					pcall(function()
						ownedPrinters = 0;
						printersMade = 0;
						for i,v in pairs(game:GetService("Workspace").MoneyPrinters:GetChildren()) do
							if string.lower(tostring(v.TrueOwner.Value)) == tostring(string.lower(game.Players.LocalPlayer.Name)) then
								ownedPrinters = ownedPrinters + 1;
							end
						end

						if ownedPrinters >= 2 or printersMade >= 2 then
							-- already have 2 printers
						else
							pcall(function()
								Game:GetService("ReplicatedStorage").Events.BuildingEvent:FireServer(1, "Node", CFrame.new(-0.609249473, 0, 0.498477787, 0, 0, 1, 0, 1, -0, -1, 0, 0));
								wait(1);
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-444.14743, 137.24617, -672.167603, -0.18111819, 0, -0.983460665, 0, 1, 0, 0.983460665, 0, -0.18111819);
								
								wait(1);
								Game:GetService("ReplicatedStorage").Events.MenuEvent:FireServer(2, "Money Printer Advanced", nil, 8);
								wait(1);
								printer = getClosestOwnedPrinter();
								Game:GetService("ReplicatedStorage").Events.PickUpEvent:FireServer(printer, true);
								counterunowo = 0;
								pcall(function()
									while tonumber(printer.Int.Money.Value) < 999999 do
										if counterunowo > 10 then
											break;
										end
										wait(1);
										counterunowo = counterunowo + 1;
									end
								end)
								wait(1);
								didSuccessyy = false;
								pcall(function()
									if tonumber(printer.Int2.Money.Value) < 99999 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.609249473, 3, 0.498477787, 0, 0, 1, 0, 1, -0, -1, 0, 0);
										didSuccessyy = true;
									end
								end)
								if didSuccessyy then
								
								else
									Game:GetService("ReplicatedStorage").Events.PickUpEvent:FireServer(printer, true);
									wait(1);
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.609249473, 3, 0.498477787, 0, 0, 1, 0, 1, -0, -1, 0, 0);
								end
								
								wait(2);
							end)
							pcall(function()
								Game:GetService("ReplicatedStorage").Events.PickUpEvent:FireServer(printer, false);
							end)
							wait(2);
							
							
							printer.Int.Money.Changed:connect(function(newVal)
								doPrinterStuffy();
							end)
							
							printersMade = printersMade + 1;
							runAutoPrinter();
						end
					end)
				else
					notice:Fire("Lunahax", "Please enable Bypass Barriers!", 4);
				end
			end
		end
		
	
		
		
		---------------------------------
		-- global every 5s loop, do things here
		spawn(function()
			while wait() do
				-- printer loop, re-draw every 5 seconds incase updates (todo, used onchanged etc so i dont have to do this every 5s)
				pcall(function()
					if variables.printerEspEnabled then
						killPrinters();
						doPrinters();
					else
						killPrinters();
					end
					
					if crateEspEnabled then
						killCrates();
						doCrates();
					else
						killCrates();
					end
					
					if entityEspEnabled then
						killEntities();
						doEntities();
					else
						killEntities();
					end
				end)
				
				
				pcall(function()
					if variables.speedHackEnabled then
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100;
					end
				end)
				
				pcall(function()
					autoCornFarmRun();
					autoScavRun();
					auroAureusRun();
					runAutoScrapFarm();
					runAutoPrinter();
					doPrinterStuffy();
				end)
			
				pcall(function()
					if variables.hitboxExpandEnabled then
						for i,v in pairs(game:GetService("Players"):GetPlayers()) do
							pcall(function()
								if v ~= game:GetService("Players").LocalPlayer then
									v.Character.HumanoidRootPart.Size = Vector3.new(20,20,20);						
									v.Character.HumanoidRootPart.Transparency = 0.7;
									v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright green");
									v.Character.HumanoidRootPart.Material = "Neon";
									v.Character.HumanoidRootPart.CanCollide = false;
								end
							end)
						end
					else
						for i,v in pairs(game:GetService("Players"):GetPlayers()) do
							pcall(function()
								if v ~= game:GetService("Players").LocalPlayer then
									v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
									v.Character.HumanoidRootPart.CanCollide = true
								end
							end)
						end
					end
				end)
				
				pcall(function()
					for i,v in pairs(game:GetService("Players"):GetPlayers()) do
						if isUserEsMod(v.Name) then
							notice:Fire("Lunahax", "WARNING! Moderator " .. v.Name .. " is in your game.", 4);
						end
					end
				
				end)
				
				wait(5);
			end
		end);

		spawn(function()
			while true do
				pcall(function()
					local numbtest = 0;
					for i,vBuilding in ipairs(game:GetService("Workspace").Buildings:GetChildren()) do
						for i,vBItem in ipairs(vBuilding:GetChildren()) do
							pcall(function()
								if vBItem.Name == "Dispencer" then
									local itemCount = vBItem.Dispencer.Count.Value;
									local itemPrice = vBItem.Dispencer.Price.Value
									local itemName = vBItem.Dispencer.Value;
									if vBItem.Main and itemName ~= "" and itemCount > 0 then
										local newButton = Instance.new("TextButton")
										newButton.Parent = dispenserListScrollingFrame
										newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										newButton.Size = UDim2.new(0, 200, 0, 50)
										newButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
										newButton.Position = UDim2.new(0, 0, numbtest, 0);
										newButton.Font = Enum.Font.SourceSans
										newButton.Text = "(" .. itemCount .. ") " .. itemName .. ": $" ..  itemPrice
										newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
										newButton.TextSize = 25.000
										numbtest = numbtest + 0.005;
										newButton.Activated:Connect(function()
											variables.dispClicked = vBItem;
											populateDispInfoWhenClicked();
										end)
									end
								end
							end)
							wait();
						end
					end
				end)
				wait(15);
				pcall(function()
					for _asd, vp in pairs(dispenserListScrollingFrame:GetChildren()) do 
						vp:destroy();
					end
				end)
			end
		end)


		loadConfigButton.Activated:Connect(function()
			local validC = isfile("lunahaxConfig.txt")
			if validC then
				local contentsC = readfile("lunahaxConfig.txt");
				for line in contentsC:gmatch("[^\r\n]+") do
					local key = split(line,"=")[1]
					local value = split(line,"=")[2]
					local lval = nil;
					if value == "true" then 
						lval = true
					else
						lval = false;
					end
					local onOff = "";
					if lval then 
						onOff = "[ON] "
					else
						onOff = "[OFF] "
					end
					
					if key == "variables.espEnabled" then
						variables.espEnabled = lval;
						playerEspButton.Text = onOff .. "Player ESP"
						if variables.espEnabled then
							pcall(function()
								for i,v in pairs(game:GetService("Players"):GetPlayers()) do
									pcall(UnloadPlayer, v);
								end
							end)
							pcall(function()
								for i,v in pairs(game:GetService("Players"):GetPlayers()) do
									spawn(function() pcall(LoadPlayer, v) end)
								end
							end)
						else
							pcall(function()
								for i,v in pairs(game:GetService("Players"):GetPlayers()) do
									pcall(UnloadPlayer, v);
								end
							end)
						end
					elseif key == "variables.printerEspEnabled" then
						variables.printerEspEnabled = lval;
						printerEspButton.Text = onOff .. "Printer ESP"
						if variables.printerEspEnabled then
							pcall(function()
								killPrinters()
							end)
							pcall(function()
								doPrinters()
							end)
						else
							pcall(function()
								killPrinters()
							end)
						end
					elseif key == "entityEspEnabled" then
						entityEspEnabled = lval;
						entityEspButton.Text = onOff .. "Entity ESP"
						if entityEspEnabled then
							pcall(function()
								killEntities();
							end)
							pcall(function()
								doEntities();
							end)
						else
							pcall(function()
								killEntities();
							end)
						end
					elseif key == "crateEspEnabled" then
						crateEspEnabled = lval;
						crateEspButton.Text = onOff .. "Crate ESP"
						if crateEspEnabled then
							pcall(function()
								killCrates();
							end)
							pcall(function()
								doCrates();
							end)
						else
							pcall(function()
								killCrates();
							end)
						end
					elseif key == "_G.nlrLoop" then
						_G.nlrLoop = lval;
						disableNlrButton.Text = onOff .. "Disable NLR"
					elseif key == "variables.isNodeKillEnabled" then
						variables.isNodeKillEnabled = lval;
						nodeKillButton.Text = onOff .. "NodeKill"
					elseif key == "variables.aimbotEnabled" then
						variables.aimbotEnabled = lval;
						aimbotButton.Text = onOff .. "(q) Aimbot"
					elseif key == "variables.clickTpEnabled" then
						variables.clickTpEnabled = lval;
						clickTpButton.Text = onOff .. "(x) MouseTP"
					elseif key == "variables.flyJump" then
						variables.flyJump = lval;
						flyJumpButton.Text = onOff .. "Fly Jump"
					elseif key == "variables.noclipBool" then
						variables.noclipBool = lval;
						noclipButton.Text = onOff .. "Noclip"
					elseif key == "variables.weaponMultiplierEnabled" then
						variables.weaponMultiplierEnabled = lval;
						_G.weaponMultiplierEnabled = lval;
						weaponMultiplierButton.Text = onOff .. "Weapon Multi"
					elseif key == "variables.deathBarrierBypassEnabled" then
						variables.deathBarrierBypassEnabled = lval;
						_G.deathBarrierBypassEnabled = lval;
						deathBarrierBypassButton.Text = onOff .. "Bypass Barriers"
					elseif key == "variables.speedHackEnabled" then
						if _G.bypassEnabled then
							variables.speedHackEnabled = lval;
							if variables.speedHackEnabled then
								game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100;
							else
								game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
							end
							speedHackButton.Text = onOff .. "SpeedHack"
						end
					elseif key == "variables.autoColaDrink" then
						variables.autoColaDrink = lval;
						autoDrinkButton.Text = onOff .. "AutoDrink"
					elseif key == "variables.itemSniperEnabled" then
						variables.itemSniperEnabled = lval;
						itemSniperButton.Text = onOff .. "Item Sniper"
					elseif key == "variables.onlyFlagged" then
						variables.onlyFlagged = lval;
						onlyTargetFlaggedButton.Text = onOff .. "Only flagged"
					elseif key == "infiniteAmmo" then
						if lval then
							variables.infSmgAmmo = true;
							variables.infRifAmmo = true;
							variables.infPisAmmo = true;
							local Player = game:GetService("Players").LocalPlayer
							Player.PlayerData["Pistol Ammo"].Value = 1000;
							Player.PlayerData["Pistol Ammo"].RobloxLocked = true;
							Player.PlayerData["SMG Ammo"].Value = 1000;
							Player.PlayerData["SMG Ammo"].RobloxLocked = true;
							Player.PlayerData["Rifle Ammo"].Value = 1000;
							Player.PlayerData["Rifle Ammo"].RobloxLocked = true;
							infiniteAmmoButton.Text = "[ON] InfiniteAmmo"
						else
							variables.infSmgAmmo = false;
							variables.infRifAmmo = false;
							variables.infPisAmmo = false;
							local Player = game:GetService("Players").LocalPlayer
							Player.PlayerData["Pistol Ammo"].RobloxLocked = false;
							Player.PlayerData["SMG Ammo"].RobloxLocked = false;
							Player.PlayerData["Rifle Ammo"].RobloxLocked = false;
							infiniteAmmoButton.Text = "[OFF] InfiniteAmmo"
						end
					elseif key == "_G.redRageAuraEnabled" then
						_G.redRageAuraEnabled = lval;
						rageAuraRedButton.Text = onOff .. "Red RageAura"
					elseif key == "_G.yellowRageAuraEnabled" then
						_G.yellowRageAuraEnabled = lval;
						yellowRageAuraRedButton.Text = onOff .. "Yellow RageAura"
					elseif key == "variables.globalChat" then
						variables.globalChat = lval;
						globalChatButton.Text = onOff .. "Global chat"
					elseif key == "variables.deathReturnEnabled" then
						variables.deathReturnEnabled = lval;
						deathReturnButton.Text = onOff .. "Death Return"
					end
				end
				notice:Fire("Lunahax", "Config loaded!");
			else
				notice:Fire("Lunahax", "Config file does not exist!", 4);
			end
		end)

		
		local mt = getrawmetatable(game);
		local backup = mt.__namecall;
		if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end

		mt.__namecall = newcclosure(function(...)
			local method = getnamecallmethod()
			local args = {...}
			if method == "FindPartOnRayWithWhitelist" then
				if _G.deathBarrierBypassEnabled then
					local getScript = getfenv(2).script
					if getScript == nil then
						getScript = ""
					end
					if tostring(getScript:GetFullName()) == "game.Players.LocalPlayer.PlayerScripts.LocalScript" then
						args[2].Y = 144;
						return backup(unpack(args))
					else
						return backup(...)
					end
				else
					return backup(...)
				end
			end
			
			
			if method == "FireServer" or method == "InvokeServer" then
				if _G.weaponMultiplierEnabled then
					if args[1].Name == "MenuActionEvent" then
						if args[2] == 33 and args[8] ~= "" and args[8] ~= "a" then
							spawn(function()
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait(0.1)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait(0.1)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait(0.1)
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
								wait()
								Game:GetService("ReplicatedStorage").Events.MenuActionEvent:FireServer(args[2], args[3], args[4], args[5], args[6], args[7], "a");
							end);
							return backup(unpack(args))
						end
					elseif args[1].Name == "MenuActionEvent" and args[2] == 33 and args[8] == "a" then
						args[8] = "";
						return backup(unpack(args))
					else
						
					end
				end
			end
			return backup(...)
		end)

		local mmindex = mt.__index
		mt.__index = function(Instance, string)
			if string == "WalkSpeed" then
				return (1)
			end
			return mmindex(Instance, string)
		end
		_G.bypassEnabled = true;
		print("workaround loaded");
		

		------------------------------------
		-- this should always be at the end of the script, this loads the map 
		-- load map by teleporting
		local function loadmap()
			game:GetService("Workspace").Camera.CameraType = Enum.CameraType.Scriptable;
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(-2251, 196, 1465));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(-1533, 190, -344));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(-502, 138, -1308));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(1494, 272, -1663));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(1983, 138, 48));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(2144, 135, 1611));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(5, 274, 1302));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(-131, 197, -463));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(-1572, 206, -1235));
			wait(1)
			game:GetService("Workspace").Camera.CFrame = CFrame.new(Vector3.new(-1725, 263, -1798));
			wait(1)
			game:GetService("Workspace").Camera.CameraType = Enum.CameraType.Custom;
		end
		--spawn(loadmap())
		
		
		--todo make this into a library would be neater
		function addButton(buttonText, frame, func)
			howMuch = 0;
			pcall(function()
				lastItem = nil;
				for i,v in pairs(frame:GetChildren()) do
					if v.ClassName == "ImageButton" or v.ClassName == "TextLabel" then
						lastItem = v;
					end
				end
				if lastItem ~= nil then
					howMuch = lastItem.Position.Y.Offset + 35;
				end
			end)
			
			lhImgButtonAdd = Instance.new("ImageButton");
			lhImgButtonAdd.Name = "lhButton";
			lhImgButtonAdd.Image = "rbxassetid://725697201"
			lhImgButtonAdd.Position = UDim2.new(0, 238, 0, howMuch);
			lhImgButtonAdd.BackgroundTransparency = 1;
			lhImgButtonAdd.ImageColor3 = Color3.fromRGB(154, 110, 79);
			lhImgButtonAdd.AnchorPoint = Vector2.new(0.5, 0);
			lhImgButtonAdd.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			lhImgButtonAdd.ZIndex = 1;
			lhImgButtonAdd.Size = UDim2.new(1, -14, 0, 30);
			lhImgButtonAdd.ScaleType = 1;
			lhImgButtonAdd.SliceCenter = Rect.new(34, 34, 34, 34);
			
			lhTextLabelAdd = Instance.new("TextLabel");
			lhTextLabelAdd.Name = "TextLabel";
			lhTextLabelAdd.Font = 4;
			lhTextLabelAdd.Text = buttonText;
			lhTextLabelAdd.Parent = lhImgButtonAdd;
			lhTextLabelAdd.BackgroundTransparency = 1;
			lhTextLabelAdd.AnchorPoint = Vector2.new(0.5, 0.5);
			lhTextLabelAdd.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			lhTextLabelAdd.Position = UDim2.new(0, 240, 0.5, 0);
			lhTextLabelAdd.Size = UDim2.new(1, 0, 0, 0);
			lhTextLabelAdd.TextSize = 20;
			lhTextLabelAdd.TextColor3 = Color3.fromRGB(255, 255, 255);
			lhTextLabelAdd.TextStrokeTransparency = 0.5;
			lhTextLabelAdd.ZIndex = 3;
			
			lhImgButtonAdd.Parent = frame;
			
			oldColor = lhImgButtonAdd.ImageColor3;
			
			--lhImgButtonAdd.MouseEnter:connect(function()
			--	lhImgButtonAdd.ImageColor3 = Color3.fromRGB(54, 49, 44);
			--end);

			--lhImgButtonAdd.MouseLeave:connect(function()
			--	lhImgButtonAdd.ImageColor3 = oldColor;
			--end);
				
			
			lhImgButtonAdd.Activated:Connect(func);
			
			return true;
		end


		function addCategory(catName, frame)
			howMuch = 0;
			pcall(function()
				lastItem = nil;
				for i,v in pairs(frame:GetChildren()) do
					if v.ClassName == "ImageButton" or v.ClassName == "TextLabel" then
						lastItem = v;
					end
				end
				if lastItem ~= nil then
					howMuch = lastItem.Position.Y.Offset + 40;
				end
			end)


			lhTextLabel = Instance.new("TextLabel");
			lhTextLabel.Name = "categoriesHeader";
			lhTextLabel.Font = 14;
			lhTextLabel.Text = "[" .. catName .. "]";
			lhTextLabel.Parent = frame;
			lhTextLabel.BackgroundTransparency = 1;
			lhTextLabel.AnchorPoint = Vector2.new(0, 0);
			lhTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			lhTextLabel.Position = UDim2.new(0, 0, 0, howMuch);
			lhTextLabel.Size = UDim2.new(1, 0, 0, 20);
			lhTextLabel.TextSize = 24;
			lhTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
			lhTextLabel.TextStrokeTransparency = 0.5;
			lhTextLabel.ZIndex = 1;
			return true;
		end


		lhOptions = Instance.new("Frame");
		lhOptions.Name = "lhOptions";
		lhOptions.BorderColor3 = Color3.fromRGB(27, 42, 53);
		lhOptions.Position = UDim2.new(0, 56, 0, 315);
		lhOptions.AnchorPoint = Vector2.new(0.5, 0.5);
		lhOptions.Size = UDim2.new(0, 70, 0, 70);
		lhOptions.BackgroundTransparency = 1;

		lhImgButton = Instance.new("ImageButton");
		lhImgButton.Name = "lhOptions";
		lhImgButton.Image = "rbxassetid://553151967"
		lhImgButton.Position = UDim2.new(0, 0, 0, 0);
		lhImgButton.BackgroundTransparency = 1;
		lhImgButton.ImageColor3 = Color3.fromRGB(91, 84, 75);
		lhImgButton.AnchorPoint = Vector2.new(0.5, 0.5);
		lhImgButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		lhImgButton.ZIndex = 10;
		lhImgButton.Size = UDim2.new(0, 60, 0, 60);

		lhTextLabel = Instance.new("TextLabel");
		lhTextLabel.Name = "TextLabel";
		lhTextLabel.Font = 14;
		lhTextLabel.Text = "Lunahax";
		lhTextLabel.Parent = lhImgButton;
		lhTextLabel.BackgroundTransparency = 1;
		lhTextLabel.AnchorPoint = Vector2.new(0, 1);
		lhTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		lhTextLabel.Position = UDim2.new(0, 0, 1, -5);
		lhTextLabel.Size = UDim2.new(1, 0, 0, 15);
		lhTextLabel.TextSize = 12;
		lhTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
		lhTextLabel.TextStrokeTransparency = 0.5;
		lhTextLabel.ZIndex = 11;

		lhImageLabel = Instance.new("ImageLabel");
		lhImageLabel.Name = "icon";
		lhImageLabel.Image = "rbxassetid://560667850";
		lhImageLabel.Parent = lhImgButton;
		lhImageLabel.BackgroundTransparency = 1;
		lhImageLabel.AnchorPoint = Vector2.new(0.5, 0.5);
		lhImageLabel.Position = UDim2.new(0.5, 2, 0.5, -2);
		lhImageLabel.Size = UDim2.new(0.5, 0.5, 0.5, 0.5);
		lhImageLabel.ImageRectOffset = Vector2.new(0, 0);
		lhImageLabel.ImageRectSize = Vector2.new(0, 0);
		lhImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);

		lhImageLabel.ZIndex = 10;
		lhImgButton.Parent = lhOptions;
		lhOptions.Parent = game.Players.LocalPlayer.PlayerGui.Client.Menu.Catagories;


		lhFrame = Instance.new("Frame");
		lhFrame.Name = "Lunahax";
		lhFrame.BorderColor3 = Color3.fromRGB(27, 42, 53);
		lhFrame.Visible = false;
		lhFrame.Parent = game.Players.LocalPlayer.PlayerGui.Client.Menu;
		lhFrame.Size = UDim2.new(1, 1, 1, 1);
		lhFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		lhFrame.BackgroundTransparency = 1;

		spawn(function()
			while true do
				pcall(function()
					lmao = game.Players.LocalPlayer.PlayerGui.Client.Menu;
					if lmao.Rules.Visible or lmao.Shop.Visible or lmao.Action.Visible or lmao.Jobs.Visible then
						lhFrame.Visible = false;
						lhImgButton.ImageColor3 = Color3.fromRGB(91, 84, 75);
					end
					wait();
				end)
			end
		end)


		lhImgButton.MouseEnter:connect(function()
			if lhFrame.Visible then
				return;
			end;
			lhImgButton.ImageColor3 = Color3.fromRGB(54, 49, 44);
		end);

		lhImgButton.MouseLeave:connect(function()
			if lhFrame.Visible then
				return;
			end;
			lhImgButton.ImageColor3 = Color3.fromRGB(91, 84, 75);
		end);


		lhImgButton.Activated:Connect(function()
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Rules.Visible = false;
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Shop.Visible = false;
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Action.Visible = false;
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Jobs.Visible = false;
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Catagories[1][1].ImageColor3 = Color3.fromRGB(91, 84, 75);
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Catagories[2][2].ImageColor3 = Color3.fromRGB(91, 84, 75);
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Catagories[3][3].ImageColor3 = Color3.fromRGB(91, 84, 75);
			game.Players.LocalPlayer.PlayerGui.Client.Menu.Catagories[4][4].ImageColor3 = Color3.fromRGB(91, 84, 75);
			lhImgButton.ImageColor3 = Color3.fromRGB(54, 49, 44);
			lhFrame.Visible = true;
		end)





		mainMenuScrollingFrame = Instance.new("ScrollingFrame");
		mainMenuScrollingFrame.Name = "ScrollingFrame";
		mainMenuScrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53);
		mainMenuScrollingFrame.Visible = true;
		mainMenuScrollingFrame.Position = UDim2.new(0, 5, 0, 5);
		mainMenuScrollingFrame.Size = UDim2.new(1, -10, 1, -10);
		mainMenuScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		mainMenuScrollingFrame.BackgroundTransparency = 0.5;
		mainMenuScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 966);
		mainMenuScrollingFrame.Parent = lhFrame



		addCategory("General Features", mainMenuScrollingFrame);
		addButton("Player ESP", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.playerEspButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Crate ESP", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.crateEspButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Entity ESP", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.entityEspButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Printer ESP", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.printerEspButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Disable NLR", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.disableNlrButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addCategory("Movement", mainMenuScrollingFrame);
		
		addButton("Noclip", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.noclipButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("(x) MouseTP", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.clickTpButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("SpeedHack", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.speedHackButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Flyjump", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.flyJumpButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addCategory("Weapon", mainMenuScrollingFrame);
		
		addButton("Infinite Ammo", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.infiniteAmmoButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Auto Reload", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.combatFrame.combatScrollingFrame.autoReloadButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		
		
		
		addCategory("Miscellaneous", mainMenuScrollingFrame);
		
		addButton("Store All Items", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.storeAllItemsButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Global Chat", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.globalChatButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Steal Nearest Car", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.getInNearestCarButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Earrape all players", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.earRapePlayersButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("AntiAFK", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.antiAfkButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Infinite Hunger", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.infiniteHungerButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		addButton("Bypass Death Barriers", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.deathBarrierBypassButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		
		
		addButton("WishBot", mainMenuScrollingFrame, function() 
			dabutton = game.Players.LocalPlayer.PlayerGui.ScreenGui.mainMenuFrame.miscFrame.miscScrollingFrame.wishBotButton;
			events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
			for iasda,vaaaa in pairs(events) do
				for iasdaa,vaaa in pairs(getconnections(dabutton[vaaaa])) do
					vaaa:Fire()
				end
			end
		end)
		
		
		game.Players.LocalPlayer.PlayerGui.Client.Inventory.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 15, 0);
		
	end
end

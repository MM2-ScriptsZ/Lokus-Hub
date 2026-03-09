--// =====================================================
--// UNIVERSAL GAME LOADER
--// =====================================================

if not game or not game.HttpGet then return end
if getgenv().UniversalGameLoader then return end
getgenv().UniversalGameLoader = true

-- Default script for supported games
local DEFAULT_SCRIPT = "https://monlua-protector.vercel.app/raw/a54fd1dc546e1f4f88814c43929d644e"

-- Special script for Steal a Brainrot
local BRAINROT_SCRIPT = "https://pastefy.app/fSa2WVsk/raw"

-- Game IDs that use DEFAULT_SCRIPT
local Games = {
    [16732694052] = "Fisch",
    [17625359962] = "Rivals",
    [126884695634066] = "Grow a Garden",
    [121864768012064] = "Fish It!",
    [124837629548415] = "99 Nights in the Forest",
    [142823291] = "Murder Mystery 2",
    [920587237] = "Adopt Me!",
    [76558904092080] = "The Forge",
    [127742093697776] = "Plants vs Brainrots",
    [2753915549] = "Blox Fruits"
}

local STEAL_BRAINROT_ID = 109983668079237

-- Load function
local function LoadScript(url)
    pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
end

-- Special case: Steal a Brainrot
if game.PlaceId == STEAL_BRAINROT_ID then
    print("Loading Steal a Brainrot script")
    LoadScript(BRAINROT_SCRIPT)

-- Other supported games
elseif Games[game.PlaceId] then
    print("Loading script for:", Games[game.PlaceId])
    LoadScript(DEFAULT_SCRIPT)

else
    warn("Game not supported:", game.PlaceId)
end

getgenv()["cofiG"] = getgenv()["cofiG"] or {}
local hasToUpdate = true
local alreadyRan = cofiG.gravityController ~= nil

local http = game:GetService 'HttpService'
local readfile, writefile, fileexists = readfile or syn_io_read,
                                        writefile or syn_io_write,
                                        isfile or readfile

local rawUrl, baseUrl = "https://ixss.keybase.pub/rblx/gravityController/",
                        "https://keybase.pub/ixss/rblx/gravityController/"

do
    _G.req = [[
        local require = function(lol)
            lol = "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/"..lol:gsub("%.","/")..".lua";
            return loadstring(_G.req..game:HttpGet(lol))();
        end;
    ]]

    local require = function(lol)
        lol =
            "https://raw.githubusercontent.com/msva/lua-htmlparser/master/src/" ..
                lol:gsub("%.", "/") .. ".lua";
        return loadstring(_G.req .. game:HttpGet(lol))();
    end;

    cofiG.htmlparser = cofiG.htmlparser or require "htmlparser"
end

do -- check if exists
    if fileexists 'gravityController.json' then
        local json = readfile 'gravityController.json'
        if json then
            cofiG.gravityController = http:JSONDecode(json)
            hasToUpdate = cofiG.gravityController.Version ~=
                              game:HttpGet(rawUrl .. "Version.txt")
        end
    end
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = hasToUpdate and "Updating script..." or "Running script!",
        Font = Enum.Font.Code,
        Color = Color3.fromRGB(255, 60, 60),
        FontSize = Enum.FontSize.Size96
    })
end

if hasToUpdate then -- update/download

    function getScripts()
        local ret = {}
        local text = game:HttpGet(baseUrl, false)

        local root = cofiG.htmlparser.parse(text)
        local files = root:select(".file")

        for i, v in pairs(files) do
            if string.sub(v.attributes.href, string.len(v.attributes.href) - 3) ==
                ".lua" then
                local name = string.sub(v.attributes.href,
                                        string.len(baseUrl) + 1,
                                        string.len(v.attributes.href) - 4)
                local script = rawUrl .. name .. ".lua"
                ret[name] = game:HttpGet(script)
            elseif string.sub(v.attributes.href,
                              string.len(v.attributes.href) - 3) == ".txt" then
                local name = string.sub(v.attributes.href,
                                        string.len(baseUrl) + 1,
                                        string.len(v.attributes.href) - 4)
                local script = rawUrl .. name .. ".txt"
                ret[name] = game:HttpGet(script)
            end
        end

        return ret
    end
    cofiG.gravityController = getScripts()
    writefile('gravityController.json', http:JSONEncode(cofiG.gravityController))
    warn('Script updated!')
end

local a, b = pcall(loadstring(cofiG.gravityController.Loader))

if not a then error('Loader ', b) end

if not alreadyRan then
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = game:HttpGet('https://ixss.keybase.pub/Watermark.txt', true) ..
            ", originally made by EgoMoose.",
        Font = Enum.Font.Code,
        Color = Color3.fromRGB(244, 0, 175),
        FontSize = Enum.FontSize.Size96
    })
end

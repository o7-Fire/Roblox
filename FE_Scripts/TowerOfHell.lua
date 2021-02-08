-- god mode
local game_metatable = getrawmetatable(game)
local old_new_index = game_metatable.__newindex
local old_index = game_metatable.__index

setreadonly(game_metatable, false)

game_metatable.__newindex = function(part, index, new_index, ...)
    if (not checkcaller() and part and index == "Health") then return end

    return old_new_index(part, index, new_index, ...)
end

game_metatable.__index = function(part, index, ...)
    if (not checkcaller() and part and index == "Health") then return 100 end

    return old_index(part, index, ...)
end

setreadonly(game_metatable, true)

-- no gravity

local game_metatable = getrawmetatable(game)
local old_new_index = game_metatable.__newindex
local old_index = game_metatable.__index

setreadonly(game_metatable, false)

game_metatable.__newindex = function(part, index, new_index, ...)
    if (not checkcaller() and part and index == "Gravity") then return end

    return old_new_index(part, index, new_index, ...)
end

game_metatable.__index = function(part, index, ...)
    if (not checkcaller() and part and index == "Gravity") then return 196 end

    return old_index(part, index, ...)
end

setreadonly(game_metatable, true)

workspace.Gravity = 1

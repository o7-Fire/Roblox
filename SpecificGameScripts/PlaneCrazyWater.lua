-- makes the map into water
-- get a boat or submarine
-- people might see your boat / submarine suddenly clip into terrain or submerging into terrain
-- people can go onto your seats and clip into terrains with you
local region = Region3.new(Vector3.new(-3750, -100, -2050),
                           Vector3.new(2500, 43, 2700))
region = region:ExpandToGrid(4)
game.Workspace.Terrain:FillRegion(region, 4, Enum.Material.Water)

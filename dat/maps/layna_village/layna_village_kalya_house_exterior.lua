-- Valyria Tear map editor begin. Do not edit this line or put anything before this line. --

-- Set the namespace according to the map name.
local ns = {};
setmetatable(ns, {__index = _G});
layna_village_kalya_house_exterior = ns;
setfenv(1, ns);

-- A reference to the C++ MapMode object that was created with this file
map = {}

-- The map name, subname and location image
map_name = "Mountain Village of Layna"
map_image_filename = "img/menus/locations/mountain_village.png"
map_subname = ""

-- The number of rows, and columns that compose the map
num_tile_cols = 32
num_tile_rows = 24

-- The contexts names and inheritance definition
-- Tells the context id the current context inherit from
-- This means that the parent context will be used as a base, and the current
-- context will only have its own differences from it.
-- At least, the base context (id:0) can't a parent context, thus it should be equal to -1.
-- Note that a context cannot inherit from itself or a context with a higher id
-- since it would lead to nasty and useless loading use cases.
contexts = {}
contexts[0] = {}
contexts[0].name = "Base"
contexts[0].inherit_from = -1

-- The music file used as default background music on this map.
-- Other musics will have to handled through scripting.
music_filename = "mus/Caketown_1-OGA-mat-pablo.ogg"

-- The names of the tilesets used, with the path and file extension omitted
tileset_filenames = {}
tileset_filenames[1] = "mountain_house_exterior"
tileset_filenames[2] = "mountain_house_exterior2"
tileset_filenames[3] = "mountain_landscape"
tileset_filenames[4] = "water_tileset"
tileset_filenames[5] = "harrvah_house_exterior"
tileset_filenames[6] = "village_exterior"

-- The map grid to indicate walkability. The size of the grid is 4x the size of the tile layer tables
-- Walkability status of tiles for 32 contexts. Zero indicates walkable for all contexts. Valid range: [0:2^32-1]
-- Example: 1 (BIN 001) = wall for first context only, 2 (BIN 010) means wall for second context only, 5 (BIN 101) means Wall for first and third context.
map_grid = {}
map_grid[0] = { 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0 }
map_grid[1] = { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0 }
map_grid[2] = { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0 }
map_grid[3] = { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }
map_grid[4] = { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }
map_grid[5] = { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 }
map_grid[6] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[7] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[8] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0 }
map_grid[9] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1 }
map_grid[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1 }
map_grid[11] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
map_grid[12] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1 }
map_grid[13] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1 }
map_grid[14] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1 }
map_grid[15] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1 }
map_grid[16] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[17] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[18] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[19] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[20] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[21] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[22] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[23] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[24] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[25] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[26] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[27] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[28] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[29] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[30] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[31] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[32] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[33] = { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[34] = { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[35] = { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[36] = { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[37] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[38] = { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[39] = { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[40] = { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[41] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[42] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[43] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[44] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
map_grid[45] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 }
map_grid[46] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1 }
map_grid[47] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0 }

-- The tile layers. The numbers are indeces to the tile_mappings table.
layers = {}
layers[0] = {}
layers[0].type = "ground"
layers[0].name = "Background"
layers[0][0] = { 523, 622, 538, 522, 522, 522, 522, 623, 524, 622, 522, 541, 590, 591, 590, 606, 607, 591, 591, 590, 606, 591, 607, 606, 606, 606, 590, 607, 590, 607, 591, 554 }
layers[0][1] = { 539, 538, 538, 522, 522, 538, 538, 538, 554, 522, 639, 557, 591, 606, 590, 590, 607, 606, 591, 606, 607, 591, 590, 591, 590, 591, 591, 591, 591, 607, 538, 554 }
layers[0][2] = { 622, 522, 554, 538, 522, 538, 522, 538, 522, 554, 623, 524, 524, 590, 606, 606, 523, 524, 590, 606, 523, 622, 554, 522, 524, 525, 607, 607, 622, 522, 554, 522 }
layers[0][3] = { 554, 522, 554, 538, 522, 554, 538, 538, 522, 554, 541, 554, 538, 554, 522, 522, 622, 538, 554, 538, 622, 522, 554, 538, 554, 623, 538, 522, 554, 568, 569, 566 }
layers[0][4] = { 554, 554, 554, 538, 554, 538, 554, 522, 522, 639, 557, 607, 591, 607, 607, 590, 590, 591, 591, 606, 607, 591, 606, 607, 607, 606, 607, 606, 591, 606, 606, 606 }
layers[0][5] = { 538, 554, 522, 554, 639, 638, 538, 554, 538, 541, 607, 607, 606, 606, 590, 606, 590, 591, 590, 590, 606, 607, 607, 606, 591, 607, 590, 607, 591, 607, 591, 591 }
layers[0][6] = { 554, 538, 538, 522, 623, 622, 538, 554, 538, 541, 606, 606, 607, 606, 591, 590, 590, 606, 590, 607, 591, 607, 591, 607, 607, 606, 607, 590, 606, 590, 606, 591 }
layers[0][7] = { 554, 639, 638, 538, 522, 538, 554, 522, 639, 557, 606, 591, 607, 590, 591, 590, 606, 591, 607, 590, 591, 591, 590, 590, 590, 607, 591, 606, 590, 590, 590, 590 }
layers[0][8] = { 522, 541, 539, 538, 538, 538, 522, 639, 557, 523, 525, 590, 607, 606, 590, 606, 590, 523, 524, 622, 651, 652, 652, 651, 541, 523, 524, 525, 591, 591, 523, 524 }
layers[0][9] = { 522, 623, 622, 554, 522, 639, 556, 557, 523, 622, 623, 525, 591, 606, 591, 591, 606, 539, 522, 522, 522, 554, 554, 522, 623, 622, 538, 623, 524, 524, 622, 538 }
layers[0][10] = { 522, 538, 554, 522, 639, 557, 591, 523, 622, 538, 522, 623, 525, 606, 591, 607, 607, 555, 638, 554, 538, 538, 538, 538, 554, 606, 554, 554, 538, 538, 522, 538 }
layers[0][11] = { 538, 522, 522, 538, 541, 590, 523, 622, 522, 522, 538, 522, 623, 524, 525, 607, 607, 591, 555, 638, 522, 522, 538, 554, 554, 538, 554, 522, 538, 522, 522, 538 }
layers[0][12] = { 554, 639, 556, 556, 557, 590, 539, 522, 554, 554, 538, 522, 538, 538, 623, 525, 606, 607, 590, 555, 638, 639, 556, 638, 522, 538, 554, 522, 538, 538, 522, 554 }
layers[0][13] = { 556, 557, 591, 590, 590, 523, 622, 522, 522, 554, 538, 522, 522, 522, 538, 623, 525, 523, 524, 525, 555, 557, 590, 539, 538, 554, 538, 554, 522, 522, 607, 554 }
layers[0][14] = { 524, 525, 607, 607, 607, 555, 638, 554, 522, 554, 554, 522, 522, 538, 522, 522, 623, 622, 554, 623, 524, 525, 590, 555, 638, 554, 538, 522, 554, 522, 607, 538 }
layers[0][15] = { 591, 623, 524, 525, 607, 591, 555, 638, 554, 522, 522, 522, 522, 538, 554, 554, 538, 522, 554, 538, 522, 541, 591, 523, 622, 538, 554, 522, 522, 607, 522, 554 }
layers[0][16] = { 606, 590, 591, 623, 524, 525, 590, 555, 638, 522, 538, 554, 522, 522, 554, 522, 554, 554, 554, 554, 554, 623, 525, 539, 522, 538, 554, 554, 538, 538, 522, 538 }
layers[0][17] = { 591, 590, 591, 607, 607, 623, 524, 525, 555, 556, 556, 638, 554, 554, 522, 554, 554, 538, 554, 522, 554, 538, 623, 622, 538, 522, 538, 554, 554, 522, 522, 538 }
layers[0][18] = { 788, 790, 607, 607, 606, 591, 591, 623, 524, 525, 607, 555, 556, 556, 638, 538, 522, 554, 554, 538, 554, 538, 554, 554, 538, 522, 554, 554, 554, 538, 554, 554 }
layers[0][19] = { 804, 824, 788, 787, 607, 607, 591, 606, 590, 623, 524, 525, 590, 591, 555, 556, 556, 556, 556, 556, 556, 638, 554, 522, 554, 522, 538, 554, 538, 554, 554, 639 }
layers[0][20] = { 820, 915, 836, 824, 788, 790, 606, 607, 607, 607, 607, 623, 524, 525, 606, 606, 591, 523, 524, 524, 524, 622, 554, 538, 554, 554, 538, 554, 639, 556, 556, 557 }
layers[0][21] = { 820, 819, 820, 915, 836, 824, 788, 790, 606, 607, 607, 590, 606, 623, 524, 525, 591, 539, 522, 522, 522, 522, 522, 538, 522, 554, 538, 639, 557, 591, 607, 591 }
layers[0][22] = { 820, 819, 820, 819, 820, 915, 836, 824, 788, 790, 606, 591, 591, 566, 567, 623, 525, 555, 556, 556, 556, 556, 556, 638, 554, 639, 556, 557, 607, 590, 591, 606 }
layers[0][23] = { 820, 819, 820, 819, 820, 819, 820, 836, 836, 824, 790, 790, 561, 582, 583, 567, 541, 606, 591, 606, 607, 607, 607, 555, 556, 557, 590, 591, 591, 606, 590, 606 }

layers[1] = {}
layers[1].type = "ground"
layers[1].name = "Background 2"
layers[1][0] = { -1, 614, 615, 720, 721, 566, 567, -1, -1, -1, -1, -1, 560, 561, 562, 568, 569, 566, 567, 706, 707, 582, 583, 584, 585, 704, 705, 568, 569, 579, 580, 581 }
layers[1][1] = { -1, -1, -1, 736, 737, 582, 583, -1, -1, -1, -1, -1, 576, 577, 578, 584, 585, 582, 583, 722, 723, 598, 599, 600, 601, 720, 721, 584, 585, 595, 596, 597 }
layers[1][2] = { -1, -1, -1, 752, 753, 598, 599, 704, 705, -1, -1, -1, 592, 593, 594, 600, 601, 598, 599, 738, 739, 614, 615, 616, 617, 736, 737, 600, 601, 611, 612, 613 }
layers[1][3] = { -1, -1, -1, -1, -1, 614, 615, 720, 721, 566, 567, -1, 608, 609, 610, 616, 617, 614, 615, 754, 755, -1, -1, -1, -1, 752, 753, 616, 617, -1, -1, -1 }
layers[1][4] = { -1, -1, -1, -1, -1, -1, -1, 736, 737, 582, 583, 566, 567, 568, 569, 566, 567, 706, 707, 704, 705, 568, 569, 566, 567, 706, 707, 704, 705, 706, 707, 704 }
layers[1][5] = { -1, -1, -1, -1, -1, -1, -1, 752, 753, 598, 599, 582, 583, 584, 585, 582, 583, 722, 723, 720, 721, 584, 585, 582, 583, 722, 723, 720, 721, 722, 723, 720 }
layers[1][6] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, 614, 615, 598, 599, 600, 601, 598, 599, 738, 739, 736, 737, 600, 601, 598, 599, 738, 739, 736, 737, 738, 739, 736 }
layers[1][7] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 614, 615, 616, 617, 614, 615, 754, 755, 752, 753, 616, 617, 614, 615, 754, 755, 752, 753, 754, 755, 752 }
layers[1][8] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 603, 604, 604, 605, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][9] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][10] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 522, -1, -1, -1, -1, -1, -1 }
layers[1][11] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][12] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][13] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 554, -1, -1, 522, -1 }
layers[1][14] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 554, -1 }
layers[1][15] = { 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 554, 538, -1 }
layers[1][16] = { 583, 566, 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][17] = { 599, 582, 583, 566, 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][18] = { 615, 598, 599, 582, 583, 566, 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][19] = { -1, 614, 615, 598, 599, 582, 583, 566, 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 554, -1, -1, -1, -1, -1, -1 }
layers[1][20] = { -1, -1, -1, 614, 615, 598, 599, 582, 583, 566, 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 538, -1, -1, -1, -1, -1, -1, -1 }
layers[1][21] = { -1, -1, -1, -1, -1, 614, 615, 598, 599, 582, 583, 566, 567, -1, -1, -1, -1, -1, -1, -1, -1, -1, 538, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[1][22] = { -1, -1, -1, -1, -1, -1, -1, 614, 615, 598, 599, 582, 583, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 519, 520 }
layers[1][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, 614, 615, 598, 599, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 534, 535, 536 }

layers[2] = {}
layers[2].type = "ground"
layers[2].name = "Background 3"
layers[2][0] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][1] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][2] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][3] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][4] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][5] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, -1, -1, -1, -1, -1 }
layers[2][6] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, -1, -1, -1, 1336, -1 }
layers[2][7] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1370, 1340, -1, 1153, 1154, 1155, 1156, 1157, 1158, 1159, 1160, 1161, 1162, -1, -1, -1, 1372, -1 }
layers[2][8] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1337, -1, -1, 1340, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1299, 1299, 1355, 1356, -1, -1 }
layers[2][9] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1337, -1, -1, 1340, -1, -1, -1, -1, -1, -1, -1, -1, 1284, 1300, -1, -1, -1, -1, -1 }
layers[2][10] = { -1, -1, -1, -1, -1, -1, 1337, -1, -1, -1, -1, -1, -1, -1, -1, 1334, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][11] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1333, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][12] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1335, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][13] = { -1, -1, 1337, -1, 1337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1335, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][14] = { -1, -1, -1, 1337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][15] = { -1, -1, -1, -1, -1, 1337, -1, -1, -1, -1, -1, 1337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1334, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][16] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][17] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][18] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1370, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][19] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][20] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][21] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][22] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[2][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }

layers[3] = {}
layers[3].type = "sky"
layers[3].name = "Sky"
layers[3][0] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, -1, -1, -1, -1 }
layers[3][1] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, -1, -1, -1, -1 }
layers[3][2] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, -1, -1, -1, -1 }
layers[3][3] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, -1, -1, -1, -1 }
layers[3][4] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, -1, -1, -1, -1 }
layers[3][5] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1120, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1131, -1, -1, -1, -1 }
layers[3][6] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][7] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][8] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][9] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][10] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][11] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][12] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][13] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][14] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][15] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][16] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][17] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][18] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][19] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][20] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][21] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }
layers[3][22] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 519, 520 }
layers[3][23] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 528, -1, -1, -1 }


-- Valyria Tear map editor end. Do not edit this line. Place your scripts after this line. --

local bronann = {};

-- the main map loading code
function Load(m)

	Map = m;
	ObjectManager = Map.object_supervisor;
	DialogueManager = Map.dialogue_supervisor;
	EventManager = Map.event_supervisor;

	Map.unlimited_stamina = true;

	_CreateCharacters();
	-- Set the camera focus on Bronann
	Map:SetCamera(bronann);

	_CreateNPCs();
	_CreateObjects();

	_CreateEvents();
	_CreateZones();

	-- Add clouds overlay
	Map:GetEffectSupervisor():EnableAmbientOverlay("img/ambient/clouds.png", 5.0, 5.0, true);
	
	_HandleCredits();
end

-- Handle the display of the new game credits
function _HandleCredits()
    -- Handle small credits triggering
    if (GlobalManager:DoesEventExist("game", "Start_Credits") == false) then
        -- Triggers the small credits display
        GlobalManager:SetEventValue("game", "Start_Credits", 1);
    end
    if (GlobalManager:DoesEventExist("game", "Credits_shown") == false) then
        Map:GetScriptSupervisor():AddScript("dat/credits/episode1_credits.lua");
    end
end

function Update()
	-- Check whether the character is in one of the zones
	_CheckZones();
end


-- Character creation
function _CreateCharacters()
	-- Default: From village center
	bronann = CreateSprite(Map, "Bronann", 48, 44);
	bronann:SetDirection(hoa_map.MapMode.NORTH);
	bronann:SetMovementSpeed(hoa_map.MapMode.NORMAL_SPEED);
	bronann:SetNoCollision(false);

	-- set up the position according to the previous map
	if (GlobalManager:GetPreviousLocation() == "from_kalya_house_interior") then
		bronann:SetPosition(44, 18);
		bronann:SetDirection(hoa_map.MapMode.SOUTH);
	end

	if (GlobalManager:GetPreviousLocation() == "from_kalya_house_path_small_passage") then
		bronann:SetPosition(2, 20);
		bronann:SetDirection(hoa_map.MapMode.EAST);
	end

	Map:AddGroundObject(bronann);
end

function _CreateNPCs()
	local npc = {}
	local text = {}
	local dialogue = {}
	local event = {}

end

function _CreateObjects()
	local object = {}

	-- right part trees
	object = CreateObject(Map, "Tree Big1", 62, 18);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 63, 21);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 61, 25);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big2", 59, 29);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small2", 63, 28);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 62, 35);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small1", 58, 30);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 63, 39);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 64, 43);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big2", 59, 46);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	
	-- trees in the middle
	object = CreateObject(Map, "Tree Small2", 45, 31);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small1", 43, 28);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small1", 41, 40);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	
	object = CreateObject(Map, "Rock1", 17, 13);
	if (object ~= nil) then Map:AddGroundObject(object) end;


	-- Left part
	object = CreateObject(Map, "Tree Small2", 10, 12);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small1", 4, 17);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	
	object = CreateObject(Map, "Tree Big1", 19, 15);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big2", 17, 19);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small2", 15, 17);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small1", 11, 22);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 16, 23);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Small1", 12, 25);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big2", 14, 28);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 12, 32);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big2", 9, 35);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	object = CreateObject(Map, "Tree Big1", 6, 31);
	if (object ~= nil) then Map:AddGroundObject(object) end;
	
	-- Treasures!
	local kalya_house_exterior_chest = CreateTreasure(Map, "kalya_house_exterior_chest", "Wood_Chest1", 5, 22);
	if (kalya_house_exterior_chest ~= nil) then
		kalya_house_exterior_chest:AddObject(1, 1);
		Map:AddGroundObject(kalya_house_exterior_chest);
	end
end

-- Creates all events and sets up the entire event sequence chain
function _CreateEvents()
	local event = {};
	local dialogue = {};
	local text = {}

	-- Triggered Events
	event = hoa_map.MapTransitionEvent("to Kalya house path", "dat/maps/layna_village/layna_village_kalya_house_path.lua", "from_kalya_house_exterior");
	EventManager:RegisterEvent(event);

	event = hoa_map.MapTransitionEvent("to kalya house path small passage", "dat/maps/layna_village/layna_village_kalya_house_path.lua", "from_kalya_house_small_passage");
	EventManager:RegisterEvent(event);

	-- Kalya house locked door event
	dialogue = hoa_map.SpriteDialogue();
	text = hoa_system.Translate("Hmm, The door is locked.");
	dialogue:AddLine(text, bronann);
	DialogueManager:AddDialogue(dialogue);
	event = hoa_map.DialogueEvent("Bronann can't enter kalya house", dialogue);
	event:SetStopCameraMovement(true);
	EventManager:RegisterEvent(event);
end

function _CreateZones()
	-- N.B.: left, right, top, bottom
	kalya_house_path_zone = hoa_map.CameraZone(28, 58, 46, 47, hoa_map.MapMode.CONTEXT_01);
	Map:AddZone(kalya_house_path_zone);

	kalya_house_path_small_passage_zone = hoa_map.CameraZone(0, 1, 0, 33, hoa_map.MapMode.CONTEXT_01);
	Map:AddZone(kalya_house_path_small_passage_zone);

	kalya_house_entrance_zone = hoa_map.CameraZone(42, 46, 16, 17, hoa_map.MapMode.CONTEXT_01);
	Map:AddZone(kalya_house_entrance_zone);
end

function _CheckZones()
	if (kalya_house_path_zone:IsCameraEntering() == true) then
		bronann:SetMoving(false);
		EventManager:StartEvent("to Kalya house path");
	end
	
	if (kalya_house_entrance_zone:IsCameraEntering() == true) then
		bronann:SetMoving(false);
		EventManager:StartEvent("Bronann can't enter kalya house");
		AudioManager:PlaySound("snd/door_close.wav");
	end
	
	if (kalya_house_path_small_passage_zone:IsCameraEntering() == true) then
		bronann:SetMoving(false);
		EventManager:StartEvent("to kalya house path small passage");
	end
end


-- Map Custom functions
if (map_functions == nil) then
	map_functions = {}
end

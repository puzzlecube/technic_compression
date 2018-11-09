--[[local function override_recipe(input, output)
	local recipe_table = technic.recipes.compressing.recipes
	for index,recipe in pairs(recipe_table) do -- these recipes must be hijaked
		dump(index)
		dump(recipe)
		dump(recipe_table)
	end
end]]




local recipes = {
	{"default:dirt 4",          "moreblocks:dirt_compressed"},
	{"default:cobble 4",             "moreblocks:cobble_compressed"},
	{"default:silver_sandstone", "default:stone"}, -- ?
	{"default:desert_sandstone", "default:desert_stone"},
	{"default:sandstone", "default:stone"},
-- overrides
	{"default:desert_sand",        "default:desert_sandstone"},
	{"default:silver_sand", "default:silver_sandstone"},
}

--local recipe_overrides = {}

-- defuse the default recipes since we have the compressor to take over in a more realistic manner
local desert = "default:desert_sand"
local silver = "default:silver_sand"
local cobble = "default:cobble"
local dirt = "default:dirt"
minetest.clear_craft({
	output = desert.."stone",
	recipe = {
		{desert, desert},
		{desert, desert}
	},
})

minetest.clear_craft({
	output = silver.."stone",
	recipe = {
		{silver, silver},
		{silver, silver}
	},
})

minetest.clear_craft({
	output = "moreblocks:cobble_compressed",
	recipe = {
		{cobble, cobble, cobble},
		{cobble, cobble, cobble},
		{cobble, cobble, cobble}
	},
})

minetest.clear_craft({
	output = "moreblocks:dirt_compressed",
	recipe = {
		{dirt, dirt, dirt},
		{dirt, dirt, dirt},
		{dirt, dirt, dirt}
	},
})

for _, data in pairs(recipes) do
	technic.register_compressor_recipe({input = {data[1]}, output = data[2]})
end

--[[for _, data in pairs(recipe_overrides) do
	override_recipe(data[1], data[2])
end]]

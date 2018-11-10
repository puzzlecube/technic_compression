local recipes = {
	{"default:dirt 9",          "moreblocks:dirt_compressed"},
	{"default:cobble 9",             "moreblocks:cobble_compressed"},
	{"default:silver_sandstone", "default:stone 2"}, -- For consistancy: would change if compressing one desert sand didn't create one desert stone
	{"default:desert_sandstone", "default:desert_stone 2"},
	{"default:sandstone 2", "default:stone"},
	{"default:silver_sand", "default:stone"},
	--{"default:desert_sand",        "default:desert_sandstone"},
	--{"default:silver_sand", "default:silver_sandstone"},
}

--local recipe_overrides = {}

-- defuse the default recipes since we have the compressor to take over in a more realistic manner
local cobble = "default:cobble"
local dirt = "default:dirt"

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

local modular_nuclear_reactor_recipe = {
    type = "recipe",
    name = "modular-nuclear-reactor",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 32,
    ingredients =
    {
        {type = "item", name = "nuclear-reactor", amount = 1},
        {type = "item", name = "heat-pipe", amount = 12},
        {type = "item", name = "heat-exchanger", amount = 2},
        {type = "item", name = "steam-turbine", amount = 1},
        {type = "item", name = "superconductor", amount = 10},
        {type = "item", name = "supercapacitor", amount = 2},
        {type = "item", name = "steel-plate", amount = 50},
        {type = "fluid", name = "electrolyte", amount = 200}
    },
    results = {{type = "item", name = "modular-nuclear-reactor", amount = 1}},
    requester_paste_multiplier = 1
}

data.extend(
    {
        modular_nuclear_reactor_recipe,
    }
)
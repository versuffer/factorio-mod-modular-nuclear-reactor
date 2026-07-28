local modular_nuclear_reactor_technology = {
    type = "technology",
    name = "modular-nuclear-reactor",
    icon = "__modular-nuclear-reactor__/graphics/technology/modular-nuclear-reactor-research.png",
    icon_size = 368,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "modular-nuclear-reactor"
        }
    },
    prerequisites = {"fission-reactor-equipment", "electromagnetic-science-pack"},
    unit =
    {
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1},
            {"electromagnetic-science-pack", 1}
        },
        time = 60,
        count = 2000
    }
}

data.extend(
    {
        modular_nuclear_reactor_technology,
    }
)
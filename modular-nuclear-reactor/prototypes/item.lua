local item_sounds = require("__base__.prototypes.item_sounds")

local modular_nuclear_reactor_item = {
    type = "item",
    name = "modular-nuclear-reactor",
    icon = "__modular-nuclear-reactor__/graphics/icons/modular-nuclear-reactor.png",
    subgroup = "energy",
    order = "f[nuclear-energy]-a[modular-nuclear-reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    place_result = "modular-nuclear-reactor",
    weight = 1 * tons,
    stack_size = 10
}

data.extend(
    {
        modular_nuclear_reactor_item,
    }
)
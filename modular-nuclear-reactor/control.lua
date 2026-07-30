local reactor_death_filters = {
    {
        filter = "name",
        name = "modular-nuclear-reactor",
    }
}

local function fire_rocket(a, b, c)
    local foundary = b.create_entity{name = "small-spitter", position = c, force = game.forces.enemy, speed = 1}
    local rocket = b.create_entity{name = a, position = c, target = foundary, force = game.forces.enemy, speed = 1}
end

local function on_reactor_died(entity)
    fire_rocket(
        "atomic-rocket",
        entity.surface,
        {
            entity.position.x,
            entity.position.y,
        }
    )
end

local function trigger_default_reactor_explosion(entity)
    entity.surface.create_entity{
        name = "nuclear-reactor-explosion",
        position = entity.position,
        force = entity.force
    }
end

script.on_event(
    defines.events.on_entity_died,
    function(event)
        local entity = event.entity
        if not entity.burner then return end

        local currently_burning = entity.burner.currently_burning

        if not currently_burning then
            trigger_default_reactor_explosion(entity)
            return
        end

        local filters = {}

        for category_name, _ in pairs(entity.burner.fuel_categories) do
            table.insert(filters, {filter = "fuel-category", ["fuel-category"] = category_name})
        end

        if #filters == 0 then
            trigger_default_reactor_explosion(entity)
            return
        end

        if #filters > 1 then
            filters.mode = "or"
        end

        local fuels = prototypes.get_item_filtered(filters)
        local fuel_names = {}

        for item_name, _ in pairs(fuels) do
            table.insert(fuel_names, item_name)
        end

        local fuel_found = false
        local fuel_name = ""
        for _, fn in ipairs(fuel_names) do
            if string.find(tostring(currently_burning.name), fn, 1, true) then
                fuel_found = true
                fuel_name = fn
                break
            end
        end

        if not fuel_found then
            trigger_default_reactor_explosion(entity)
            return
        end

        local max_fuel = prototypes.item[fuel_name].fuel_value
        local remaining_fuel = entity.burner.remaining_burning_fuel

        if remaining_fuel <= (max_fuel * 0.8) then
            trigger_default_reactor_explosion(entity)
            return
        end

        on_reactor_died(entity)
    end,
    reactor_death_filters
)

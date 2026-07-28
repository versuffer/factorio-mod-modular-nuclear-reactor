local sounds = require("__base__.prototypes.entity.sounds")

local function mnr_animations()
	return {
		layers =
		{
			{
				filename = "__modular-nuclear-reactor__/graphics/entity/modular-nuclear-reactor/modular-nuclear-reactor.png",
				width = 320,
				height = 335,
				frame_count = 8,
				line_length = 4,
				shift = util.by_pixel(-5, -7),
				run_mode = "backward",
				scale = 0.5
			},
			{
				filename = "__modular-nuclear-reactor__/graphics/entity/modular-nuclear-reactor/modular-nuclear-reactor-shadow.png",
				width = 525,
				height = 323,
				frame_count = 8,
				line_length = 4,
				scale = 0.5,
				shift = { 1.625, 0 },
				draw_as_shadow = true
			}
		}
	}
end

local modular_nuclear_reactor_entity = {
    type = "burner-generator",
    name = "modular-nuclear-reactor",
    icon = "__modular-nuclear-reactor__/graphics/icons/modular-nuclear-reactor.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "not-rotatable"},
    minable = {mining_time = 0.5, result = "modular-nuclear-reactor"},
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    resistances =
    {
        { type = "fire", percent = 100 },
        { type = "explosion", decrease = 10, percent = 30 },
        { type = "impact", decrease = 20, percent = 20 }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_power_output = "25MW",
    burner =
    {
        type = "burner",
        fuel_categories = {"nuclear"},
        effectivity = 1.0,
        fuel_inventory_size = 2,
        burnt_inventory_size = 2,
        light_flicker =
        {
            color = {0,0,0},
            minimum_intensity = 0.7,
            maximum_intensity = 0.95
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output",
    },
    animation =
    {
        north = mnr_animations(),
        east = mnr_animations(),
        south = mnr_animations(),
        west = mnr_animations(),
    },
    water_reflection =
    {
        pictures =
        {
            filename = "__modular-nuclear-reactor__/graphics/entity/modular-nuclear-reactor/modular-nuclear-reactor-reflection.png",
            priority = "extra-high",
            width = 40,
            height = 36,
            shift = util.by_pixel(0, 50),
            variation_count = 2,
            repeat_count = 2,
            scale = 5
        },
        rotate = false,
        orientation_to_variation = true
    },
    impact_category = "metal-large",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
        sound =
        {
            filename = "__base__/sound/steam-turbine.ogg",
            volume = 0.49,
            speed_smoothing_window_size = 60,
            advanced_volume_control = {attenuation = "exponential"},
        },
        match_speed_to_activity = true,
        audible_distance_modifier = 0.8,
        max_sounds_per_type = 3,
        fade_in_ticks = 4,
        fade_out_ticks = 20
    },
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0 }
}

data.extend(
    {
        modular_nuclear_reactor_entity,
    }
)
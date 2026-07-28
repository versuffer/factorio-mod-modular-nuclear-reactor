local enable_modular_nuclear_reactor_power_output_adjustment_setting = {
    type = "bool-setting",
    name = "enable-modular-nuclear-reactor-power-output-adjustment",
    setting_type = "startup",
    default_value = false
}

local modular_nuclear_reactor_power_output_kw_setting = {
    type = "int-setting",
    name = "modular-nuclear-reactor-power-output-kw",
    setting_type = "startup",
    minimum_value = 5000,
    maximum_value = 40000,
    default_value = 25000
}

data.extend(
    {
        enable_modular_nuclear_reactor_power_output_adjustment_setting,
        modular_nuclear_reactor_power_output_kw_setting,
    }
)

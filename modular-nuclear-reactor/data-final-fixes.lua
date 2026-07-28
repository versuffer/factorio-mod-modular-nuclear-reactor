-- Modular nuclear reactor power output adjustment

if settings.startup["enable-modular-nuclear-reactor-power-output-adjustment"].value == true then
    local adjusted_power_output = settings.startup["modular-nuclear-reactor-power-output-kw"].value .. "kW"
    data.raw["burner-generator"]["modular-nuclear-reactor"].max_power_output = adjusted_power_output
end

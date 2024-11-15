local FocusedRTEntity = table.deepcopy(data.raw["ammo-turret"]["rocket-turret"])

FocusedRTEntity.name = "focused-rocket-turret"
FocusedRTEntity.attack_parameters.turn_range = 0.25
FocusedRTEntity.minable = {mining_time = 0.5, result = "focused-rocket-turret"}
FocusedRTEntity.prepare_range = 40
FocusedRTEntity.turret_base_has_direction = true
FocusedRTEntity.circuit_connector = { 
	FocusedRTEntity.circuit_connector[1], 
	FocusedRTEntity.circuit_connector[1], 
	FocusedRTEntity.circuit_connector[1],
	FocusedRTEntity.circuit_connector[1] }

data:extend({FocusedRTEntity})

local FocusedRTItem = table.deepcopy(data.raw["item"]["rocket-turret"])
FocusedRTItem.name = "focused-rocket-turret"
FocusedRTItem.place_result = "focused-rocket-turret"
FocusedRTItem.order = "b[turret]-e[rocket-turret]-b[turret]",


data:extend({FocusedRTItem})

data:extend({{
    type = "recipe",
    name = "focused-rocket-turret",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "rocket-turret", amount = 1}
    },
    results = {{type="item", name="focused-rocket-turret", amount=1}}
  }})

table.insert(data.raw["technology"]["rocket-turret"].effects, {type = "unlock-recipe",recipe = "focused-rocket-turret"})

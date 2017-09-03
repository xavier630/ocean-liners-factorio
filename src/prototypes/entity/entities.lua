require('functions.entity-lib')

----Offshore oil rig----
local oil_rig = copyPrototype("mining-drill", "pumpjack", "oil-rig", true)
oil_rig.collision_mask = {"ground-tile", "object-layer"}
oil_rig.mining_speed = 2
oil_rig.mining_power = 3
data:extend({oil_rig})

----Sea oil----
local sea_oil = copyPrototype("resource", "crude-oil", "sea-oil", false)
sea_oil.collision_mask = {"resource-layer"}
sea_oil.autoplace.coverage = 0.04
sea_oil.map_color = {r=0.9098, g=0.6, b=0.8},
data:extend({sea_oil})

----Dock----
local dock = copyPrototype("offshore-pump", "offshore-pump", "dock", true)
--dock.collision_mask = {"resource-layer"} #for when the dock is implemeneted
data:extend({dock})

----Ocean power pole----
local ocean_power_pole = copyPrototype("electric-pole", "big-electric-pole", "ocean-power-pole", true)
ocean_power_pole.collision_mask = {"ground-tile", "object-layer"}
ocean_power_pole.maximum_wire_distance = 45
ocean_power_pole.supply_area_distance = 9
data:extend({ocean_power_pole})

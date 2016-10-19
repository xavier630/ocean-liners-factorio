
data:extend(
  {
    { --Item groups are tabs in the recipe menu, subgroups are rows within the tab.
      type = "item-group",
      name = "ocean-liners",
      icon = "__OceanLiners__/graphics/paddle-steamer-icon.jpg",
      order = "z"
    },

    {
      type = "item-subgroup",
      name = "ocean-liners-boats",
      group = "ocean-liners",
      order = "b",
    },
    {
      type = "item-subgroup",
      name = "ocean-liners-infrastructure",
      group = "ocean-liners",
      order = "a",
    },


  }

)
--config
require("config-code")

--entity
require("prototypes.entity.entities")
require("prototypes.entity.entities2")

--items
require("prototypes.item.items")

--recipies
require("prototypes.recipe.recipes")

--tech
require("prototypes.tech.tech")

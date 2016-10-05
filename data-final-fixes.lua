data.raw["technology"]["worker-robots-speed-5"] = nil
data:extend({
  {
  type = "technology",
  name = "worker-robots-speed-5",
  icon = "__base__/graphics/technology/worker-robots-speed.png",
  effects =
  {
  {
    type = "worker-robot-speed",
    modifier = "0.65"
  }
  },
  prerequisites = {"worker-robots-speed-4"},
  unit =
  {
  count = 400,
  ingredients =
  {
    {"alien-science-pack", 1},
    {"science-pack-1", 1},
    {"science-pack-2", 1},
    {"science-pack-3", 1}
  },
  time = 60
  },
  upgrade = true,
  order = "c-k-f-e"
  },

})


tiles = {
  -- reorienting tiles
	 {
    name="tile-face-north",
    effect=function(car, meta)
  		car.orientation = 0
      return true
  	end,
    subgroup="ocean-liners-tiles",
    order="a",
  },
  {
   name="tile-face-east",
   effect=function(car, meta)
     car.orientation = 0.25
     return true
   end,
   subgroup="ocean-liners-tiles",
   order="b",
 },
 {
  name="tile-face-south",
  effect=function(car, meta)
    car.orientation = 0.5
    return true
  end,
  subgroup="ocean-liners-tiles",
  order="c",
  },
  {
   name="tile-face-west",
   effect=function(car, meta)
     car.orientation = 0.75
     return true
   end,
   subgroup="ocean-liners-tiles",
   order="d",
  },
}
check_boat_tiles = function()
  for k, v in (global.motor_boats) do
    game.player.surface.print(v)
  end
end


tiles = {
  -- reorienting tiles
	 {
    name="tile-face-north",
    effect=function(car, meta)
  		car.orientation = 0
			car.speed = 0.15
      return true
  	end,
    subgroup="ocean-liners-tiles",
    order="a",
  },
  {
   name="tile-face-east",
   effect=function(car, meta)
     car.orientation = 0.25
		 car.speed = 0.15

     return true
   end,
   subgroup="ocean-liners-tiles",
   order="b",
 },
 {
  name="tile-face-south",
  effect=function(car, meta)
    car.orientation = 0.5
		car.speed = 0.15

    return true
  end,
  subgroup="ocean-liners-tiles",
  order="c",
  },
  {
   name="tile-face-west",
   effect=function(car, meta)
     car.orientation = 0.75
		 car.speed = 0.15

     return true
   end,
   subgroup="ocean-liners-tiles",
   order="d",
  },
}

# Ocean-Liners-Factorio
This mods adds ships to Factorio.

Drivable ships to sail across the oceans. You can even use landfill from within a ship!

#Ideas: <br>

* Side Cannons On Frigates <br>
* Docks - Can take inserters, boat stays near, player deposited in same location <br>
* Sailing Ships - acceleration dependent on Wind <br>
* Paths between docks. - sounds hard - maybe with invisible rails ;) <br>
* Quays to moor boats
* Add Oceans
* Drifting of boats that aren't moored - to do with wind/tides
* Can equip a lifejacket to swim to a boat or get out at sea



#Current TODO <br>

* Make fish shootable - maybe need to overwrite them in entity or something like that - otherwise have the selector in lua
* Faster Ironclad cannon shots
* Add separate oil pump (separate to the dock which pumps oil) and add spouts <br>
* Turret Parallax <br>
* Sea oil configurable at new game screen <br>
* Dock functionality - pulls in ships when player gets out nearby <br>
* Dock + ship + rig + power pole textures  <br>
* New type of self-sufficient offshore pumps (takes accumlators and solar panels in the crafting)?
* Change sea-oil collision_mask to avoid ships - Potentially not possible since both ships and this need "ground-tile" collisions
* Fix resources with angels spawning on water - haven't reproduced yet.
* Check when getting out of a boat for nearby land and move player there?
* No water collisions with buildings except mod buildings and rails - add object layer to collision mask?
* Fix cars driving onto water - will need to add the object-collision mask to water
* Increase boat speeds to be more in line with cars



#Needed Graphics
* All item textures and icons
* Animations for swimming in water


#Installation <br>

* Download as a zip and make sure to save it as 'OceanLiner_1.4.0' <br>
* Put the zip in your mods folder! <br>
* For Windows:  run -> %appdata% -> .roaming/factorio <br>
* Ubuntu: ~/.factorio


#Changelog <br>

* 0.1.5 - Fixed issues with cars being able to drive onto water. Made rails placable over water.
* 0.1.4 - Fixed issue with player collisions 
* 0.1.3 - Increased sea-oil size on map, stopped sea-oil spawning too close together, adding swimming to the mod, numerous other small fixes.
* 0.1.2 - Removed git files to significantly reduce size
* 0.1.1 - Fixed issues with decorative shrubs being placed on water

#Tradeoffs <br>

* In order to implement swimming, the only viable collision mask to add to water is water_tile. Unfortunately, sea-oil won't spawn on a water_tile. Therefore, I've removed water_tile from deepwater's collision_mask. This means that deep water has interesting properties for now, like cars can be placed on it, etc.

#Questions <br>

* Should oil rigs be placable only over the ocean?
* Should players be able to walk through all kinds of pipes? Would be very convenient when at sea and driving across pipes.

#To Check <br>

* Fish aren't walking on land with the collision changes.


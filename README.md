# byte_illegalcraft

# Version = v1.5

* Put the script in the resource folder
* Export byte_illegalcraft.sql to SQL Database
* Add "start byte_illegalcraft"

# if you dont have Fish, Orange, Beer, Water, Copper, Gold add them to your sql as items with name as fish, orage, beer, water, copper, gold.

# This script works with byte_npccrafter!!!

#Script made by ByteHype and usable with disc inventory.


#if you want to add a new zone and craftable item these are the steps;

** config.lua **
1- Add the zone in *Zones* as your item name ** this is important, as your item name**
	
	item_name = {x = coordx, y = coordy, z= coordz, legality = 'legal'}  
	
	legality should be 'legal' or 'illegal'
	'legal' zones's marker color will be green, 'illegal' ones will be red
	Note: put ',' (comma) to end of every line but last one!!!!  Forgetting this and script wont work!!

2- Add your craftable item to Items as like this
 ["item_name_here"] = {
	Item = {
		[x] = {Name = 'item', Req = item_required},
		[x] = {Name = 'item', Req = item_required},
		[x] = {Name = 'item', Req = item_required}
	},
		Note: put ',' (comma) to end of every line but last one!!!!  Forgetting this and script wont work!!
	Count = {Count = item_count},
	Time = 5000
 },
 
 you need to start 'x' with 1 and as you add another line, add on it. 1,2,3,4 as how much item needed to craft that item. Could be one or more.
 'item' is the item that will removed, 'item_required' is how much it needs to remove for crafting.
 'item_count' is how much will you add crafted item at a time.
 'Time' is how much it will take to craft one item. Time = 5000 => 5 Second
 
** server/main.lua **
3- Add every new item to TriggerClientEvent('byte_illegalcraft:ReturnInventory, like this  
		xPlayer.getInventoryItem('item_name_here').count, 
	and add it before " xPlayer.job.name, "

** client/main.lua **
4- add your item at start of script as 
	local item_nameS = 0
	
5- add your item to the byte_illegalcraft:ReturnInventory function as
	item_
	add it before jobName and add it as same order with step 3  
	** important one here if it wont be at same order, wrong item count will go to the wrong one.

6- add a line to byte_illegalcraft:ReturnInventory  like this
	item_nameS = item_
	
	and it should be at same order with step 3 and 5.

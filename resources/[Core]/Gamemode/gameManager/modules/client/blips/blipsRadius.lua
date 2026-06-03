Map = {
  -- LISTES ENTREPRISE
    {name ="S.A.S.P Sud",color=37, id=60, x = 450.7019, y = -989.8785, z = 48.0756, r= 550.0},
   -- {name ="S.A.S.P Nord",color=37, id=58, x = 1729.8323, y = 3871.1821, z = 49.1722, r= 550.0},
    {name ="Hôpital Sud",color=49, id=61, x = -315.779755, y = -593.522156, z = 32.775524, r= 550.0},
   -- {name ="Hopital Nord",color=49, id=61, x = -67.6079, y = 6518.1318, z = 49.6751, r = 550.0},
    {name ="Benny's",color=5, id=446, x = -951.6463, y = -2045.2429, z= 21.0715, r= 550.0},
    {name ="Ls Custom",color=38, id=446, x=-331.3797, y = -109.7054, z= 39.01394, r= 550.0},
    {name ="AutoExotic", color=19, id=446, x = 556.48, y = -183.52, z = 54.5, r= 550.0},
    {name ="Gouvernement",color=0, id = 419, x = -552.7541, y = -191.0339, z = 38.2184, r= 550.0},
    {name ="Palais de Justice",color=0, id=419,x=235.517303, y = -411.988739, z= 48.11, r= 550.0},
    {name ="Unicorn", color=27, id=121, 12, x=129.246, y = -1300.6, z= 29.2, r= 550.0},
    {name ="Bahamas", color=7, id=121, 12, x=-1390.057, y = -614.4379, z= 29.71992, r= 550.0},
    --{name ="Auto-Soins Sud", color=21, id=51, x = -718.1863, y = 312.7025, z = 85.3479, r= 0.0},
   -- {name ="Auto-Soins Nord", color=21, id=51, x = 1979.9476, y = 3772.3416, z = 32.5476, r= 0.0},
    {name ="Weazel-News", color=1, id=135, x = -584.908, y = -924.306, z = 36.83702, r= 550.0},
    {name ="Burgershot", color=46, id=106, x = -1191.99, y = -889.81, z = 302.66, r= 550.0},
    {name ="Club 77",color=11, id=214, x = 199.20, y = -3167.51, z = 5.81, r= 0.0},
    {name ="Agence Immobilière",color=28, id=40, x = -859.5812, y = -343.3752, z = 39.4279, r= 550.0},
  -- LISTES ACTIVITER
    {name ="Pêche",color=38, id=480,x=-1843.598, y = -1240.968, z= 13.01, r= 550.0},
    {name ="Zone de Chasse",color=17, id=141,x=-567.27, y = 5253.18, z= 70.46, r= 1500.0},
    {name ="Boucherie",color=34, id=478, x = 960.84, y = -2111.57, z = 31.94, r= 0.0},
}

Citizen.CreateThread(function()

	for i=1, #Map, 1 do
		local blip = AddBlipForCoord(Map[i].x, Map[i].y, Map[i].z) 
    	SetBlipSprite (blip, Map[i].id)
    	SetBlipDisplay(blip, 4)
    	SetBlipScale  (blip, 0.5)
    	SetBlipColour (blip, Map[i].color)
    	SetBlipAsShortRange(blip, true)
  		BeginTextCommandSetBlipName("STRING") 
  		AddTextComponentString(Map[i].name)
		EndTextCommandSetBlipName(blip)

		local zoneblip = AddBlipForRadius(Map[i].x, Map[i].y, Map[i].z, Map[i].r)
		SetBlipSprite(zoneblip,1)
		SetBlipColour(zoneblip,Map[i].color)
		SetBlipAlpha(zoneblip,100)
	end
end)
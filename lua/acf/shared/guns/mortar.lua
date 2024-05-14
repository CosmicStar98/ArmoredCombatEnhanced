--define the class
ACF_defineGunClass("MO", {
	type = "Gun",
	spread = 0.7,
	name = "Mortar",
	desc = ACFTranslation.GunClasses[10],
	muzzleflash = "MO",
	rofmod = 2,
	maxrof = 35, -- maximum rounds per minute
	year = 1915,
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",

} )

ACF_defineGun("50mmM", { --id
	name = "50mm Mortar",
	desc = "The 50mm is an uncommon light mortar often seen at or before the begening of ww2, it fires a light 50mm rounds that is good for splatting infantry.",
	model = "models/mortar/mortar_50mm.mdl",
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",
	gunclass = "MO",
	caliber = 5.0,
	weight = 40,
	rofmod = 1.05,
	maxrof = 50, -- maximum rounds per minute
	year = 1930,
	round = {
		maxlength = 50,
		propweight = 0.06
	}
} )

ACF_defineGun("60mmM", { --id
	name = "60mm Mortar",
	desc = "The 60mm is a common light infantry support weapon, with a high rate of fire but a puny payload.",
	model = "models/mortar/mortar_60mm.mdl",
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",
	gunclass = "MO",
	caliber = 6.0,
	weight = 80,
	rofmod = 0.95,
	maxrof = 35, -- maximum rounds per minute
	year = 1930,
	round = {
		maxlength = 65,
		propweight = 0.1
	}
} )

ACF_defineGun("80mmM", {
	name = "80mm Mortar",
	desc = "The 80mm is a common infantry support weapon, with a good bit more boom than its little cousin.",
	model = "models/mortar/mortar_80mm.mdl",
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",
	gunclass = "MO",
	caliber = 8.0,
	weight = 210,
	rofmod = 0.7,
	maxrof = 27, -- maximum rounds per minute
	year = 1915,
	round = {
		maxlength = 85,
		propweight = 0.25
	}
} )

ACF_defineGun("120mmM", {
	name = "120mm Mortar",
	desc = "The versatile 120 is sometimes vehicle-mounted to provide quick boomsplat to support the infantry.  Carries more boom in its boomsplat, has good HEAT performance, and is more accurate in high-angle firing.",
	model = "models/mortar/mortar_120mm.mdl",
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",
	gunclass = "MO",
	caliber = 12.0,
	weight = 440,
	rofmod = 0.6,
	maxrof = 16, -- maximum rounds per minute
	year = 1935,
	round = {
		maxlength = 80,
		propweight = 0.4
	}
} )

ACF_defineGun("150mmM", {
	name = "150mm Mortar",
	desc = "The perfect balance between the 120mm and the 200mm. Can prove a worthy main gun weapon, as well as a mighty good mortar emplacement",
	model = "models/mortar/mortar_150mm.mdl",
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",
	gunclass = "MO",
	caliber = 15.0,
	weight = 680,
	rofmod = 0.55,
	maxrof = 9, -- maximum rounds per minute
	year = 1945,
	round = {
		maxlength = 110,
		propweight = 0.8
	}
} )

ACF_defineGun("200mmM", {
	name = "200mm Mortar",
	desc = "The 200mm is a beast, often used against fortifications.  Though enormously powerful, feel free to take a nap while it reloads",
	model = "models/mortar/mortar_200mm.mdl",
	sound = "ace_weapons/multi_sound/40mm_multi.mp3",
	gunclass = "MO",
	caliber = 20.0,
	weight = 980,
	maxrof = 5, -- maximum rounds per minute
	year = 1940,
	round = {
		maxlength = 125,
		propweight = 1.7
	}
} )

ACF_defineGun("280mmM", {
	name = "280mm Mortar",
	desc = "Massive payload, with a reload time to match. Found in rare WW2 siege artillery pieces. It's the perfect size for a jeep.",
	model = "models/mortar/mortar_280mm.mdl",
	sound = "ace_weapons/multi_sound/howitzer_multi.mp3",
	gunclass = "MO",
	caliber = 28.0,
	weight = 2000,
	maxrof = 2.3, -- maximum rounds per minute
	year = 1945,
	round = {
		maxlength = 150,
		propweight = 3
	}
} )

ACF_defineGun("380mmM", {
	name = "380mm Mortar",
	desc = "Massive payload, with a reload time to match. Found in rare WW2 siege artillery pieces.", --Coastal artillery, Rail artillery, and battleship guns
	model = "models/mortar/mortar_300mm.mdl",
	sound = "ace_weapons/multi_sound/howitzer_multi.mp3",
	gunclass = "MO",
	caliber = 38.0,
	weight = 5000,
	maxrof = 2, -- maximum rounds per minute
	year = 1941,
	round = {
		maxlength = 180,
		propweight = 5
	}
} )

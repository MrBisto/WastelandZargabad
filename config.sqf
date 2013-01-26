//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray = [
	["Gold Revolver","revolver_gold_EP1",150,20],
	["M9SD","M9SD",75,20],
	["Makarov SD","MakarovSD",75,20],
	["SA61","Sa61_EP1",150,20],
	["PDW","UZI_EP1",150,20],
	["PDW SD","UZI_SD_EP1",200,20],
	["AK-74","AK_74",50,20],
	["AK-107 Kobra","AK_107_kobra",75,25],
	["AKS-74 Kobra","AKS_74_kobra",75,25],
	["AK47","AK_47_M",75,25],
	["AK47S","AK_47_S",75,25],
	["AKS-74UN Kobra","AKS_74_UN_kobra",300,25],
	["Sa58V CCO","Sa58V_CCO_EP1",200,75],
	["Sa58V ACOG","Sa58V_RCO_EP1",200,75],
	["AKS GOLD","AKS_GOLD",750,300],
	["AKS-74 NSPU","AKS_74_NSPU",750,300],
    ["M4A1 CCO","M4A1_Aim",100,25],
    ["M4A1 CCO SD","M4A1_AIM_SD_camo",200,50],
    ["M16A4","M16A4",200,50],
    ["M16A4 ACOG","M16A4_ACG",250,75],
    ["M16A4 ACOG GL","M16A4_ACG_GL",550,75],
    ["M4A1 Holo","M4A1_HWS_GL",550,25],
    ["M4A3 CCO","M4A3_CCO_EP1",300,50],
    ["M4A1 M203 RCO","M4A1_RCO_GL",550,50],
    ["M4A3 ACOG GL","M4A3_RCO_GL_EP1",550,75],
    ["M4A1 Holo SD","M4A1_HWS_GL_SD_Camo",550,75],
    ["Mk16 Mk4CQ/T","SCAR_L_STD_Mk4CQT",300,75],
    ["G36a","G36a",250,75],
    ["L85A2 ACOG","BAF_L85A2_RIS_ACOG",250,75],
    ["L85A2 Holo GL","BAF_L85A2_UGL_Holo",350,100],
    ["XM8 C","M8_compact",250,75],
    ["XM8 C CCO","m8_compact_pmc",250,75],
    ["M14","M14_EP1",250,75],
    ["Mk17 CCO SD","SCAR_H_CQC_CCO_SD",250,75],
    ["Mk17 EGLM RCO","SCAR_H_STD_EGLM_Spect",800,300],
    ["FN FAL AN/PVS-4","FN_FAL_ANPVS4",600,200],
    ["FN FAL","FN_FAL",200,75],
    ["M1014","M1014",50,20],
    ["Saiga 12K","Saiga12K",100,25],
    ["AA12","AA12_PMC",250,25],
    ["L86A2 LSW","BAF_L86A2_ACOG",250,75],
    ["M249","M249_EP1",250,75],
    ["L110A1","BAF_L110A1_Aim",300,75],
    ["M249 m145","M249_m145_EP1",300,75],
    ["Mk_48 Mod","Mk_48",500,75],
    ["M240","M240",500,75],
    ["GPMG","BAF_L7A2_GPMG",500,75],
    ["M60A4","M60A4_EP1",500,75],
    ["M240 scope","m240_scoped_EP1",600,75],
    ["Pecheneg","Pecheneg",500,75],
    ["M79","M79_EP1",100,10],
    ["MK13","Mk13_EP1",150,50],
    ["M32","M32_EP1",300,130],
    ["RPG-7","RPG7V",300,130],
    ["SMAW","SMAW",300,175],
    ["M136","M136",1000,550],
    ["Stinger","Stinger",1000,550],
    ["Javelin","Javelin",1500,750],
    ["LAW","BAF_NLAW_Launcher",1500,750],
    ["CZ 550","Huntingrifle",200,75],
    ["Mk17 Sniper","SCAR_H_LNG_Sniper",300,100],
    ["Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",750,300],
    ["VSS Vintorez","VSS_Vintorez",750,300],
    ["M40A3","M40A3",1000,400],
    ["SVD Camo","SVD_CAMO",1000,400],
    ["SVD Camo Des","SVD_des_EP1",1000,400],
    ["M110 NV","M110_NVG_EP1",1000,400],
    ["L115A3 LRR","BAF_LRR_scoped",1500,600],
    ["L115A2 LRR","BAF_LRR_scoped_W",1500,600],
    ["KSVK","KSVK",2000,700],
    ["M107","m107",2000,700]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["17Rnd Glock17","17Rnd_9x19_glock17",10],
	["6nrd .45ACP","6Rnd_45ACP",10],
	["8Rnd MakarovSD","8Rnd_9x18_MakarovSD",10],
	["15Rnd M9SD ","15Rnd_9x19_M9SD",10],
	["20Rnd SA61","20Rnd_B_765x17_Ball",10],
	["30Rnd PDW","30Rnd_9x19_UZI",10],
	["30Rnd PDW-SD ","30Rnd_9x19_UZI_SD",10],
	["30Rnd AK","30Rnd_545x39_AK",10],
	["30Rnd AKSD","30Rnd_545x39_AKSD",10],
	["AKM Mag","30Rnd_762x39_AK47",20],
	["30Rnd. STANAG","30Rnd_556x45_Stanag",10],
	["30Rnd. STANAG SD","30Rnd_556x45_StanagSD",20],
	["100Rnd 5.56mm C.Mag","100Rnd_556x45_BetaCMag",50],
	["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",10],
	["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",10],
	["AA12 Pellets","20Rnd_B_AA12_Pellets",20], 
	["AA12 Slugs","20Rnd_B_AA12_74Slug",30],  
	["AA12 HE","20Rnd_B_AA12_HE",50], 
	["200Rnd. M249 Belt","200Rnd_556x45_M249",50],
	["100Rnd. M240","100Rnd_762x51_M240",25],
	["PKM Mag.","100Rnd_762x54_PK",25],
	["5Rnd CZ 550.","5x_22_LR_17_HMR",15],
	["Mk17 Mag.","20Rnd_762x51_B_SCAR",20],
	["5Rnd M24.","5Rnd_762x51_M24",25],
	["Mk17 SD Mag.","20Rnd_762x51_SB_SCAR",25],
	["20Rnd FN FAL","20Rnd_762x51_FNFAL",25],
	["20Rnd DMR","20Rnd_762x51_DMR",25],
	["10Rnd SVD","10Rnd_762x54_SVD",25],
	["5Rnd L115A1","5Rnd_86x70_L115A1",25],
	["20Rnd VSS","20Rnd_9x39_SP5_VSS",25],
	["10Rnd. M107","10Rnd_127x99_m107",50],
	["5Rnd KSVK.","5Rnd_127x108_KSVK",25],
    ["IED 1.","BAF_ied_v1",200],
    ["IED 2.","BAF_ied_v2",500],
    ["IED 3.","BAF_ied_v3",200],
    ["IED 4.","BAF_ied_v4",500],
    ["IED 5.","PMC_ied_v1",200],
    ["IED 6.","PMC_ied_v2",500],
    ["IED 7.","PMC_ied_v3",200],
    ["IED 8.","PMC_ied_v4",500],
    ["x1 40mm HE.","1Rnd_HE_M203",20],
    ["x1 40mm FlareWhite.","FlareWhite_M203",20], 
    ["x1 40mm Smoke.","1Rnd_Smoke_M203",20],
    ["x6 40mm HE.","6Rnd_HE_M203",100],
    ["SMAW-HEAA","SMAW_HEAA",100],
    ["M136 Amo","M136",150],
    ["Stinger Ammo","Stinger",150],
    ["Javelin Ammo","Javelin",250],
    ["NLAW Ammo","NLAW",250]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["Range Finder","Binocular_Vector",500],
	["NV Goggles","NVGoggles",100],
    ["GPS","ItemGPS", 90]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",3000,1500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]  
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_0",200,"Yarum"],
		["Town_1",200,"Nango"],
		["Town_2",200,"Azizant"],
		["Town_3",200,"Shahbaz"],
		["Town_4",200,"Hazar Bagh"],
		["Town_5",200,"Military Base"],
		["Town_6",400,"Zargabad"],
		["Town_7",200,"Firuz Baharv"]
];
cityLocations = [];

//List of mission spawn markers
//Marker Name, Is it being used boolean
MissionSpawnMarkers = [
  ["Mission_0",false],
  ["Mission_1",false],
  ["Mission_2",false],
  ["Mission_3",false],
  ["Mission_4",false],
  ["Mission_5",false],
  ["Mission_6",false],
  ["Mission_7",false],
  ["Mission_8",false],
  ["Mission_9",false],
  ["Mission_10",false],
  ["Mission_11",false],
  ["Mission_12",false],
  ["Mission_13",false],
  ["Mission_14",false],
  ["Mission_15",false],
  ["Mission_16",false],
  ["Mission_17",false],
  ["Mission_18",false],
  ["Mission_19",false],
  ["Mission_20",false],
  ["Mission_21",false],
  ["Mission_22",false],
  ["Mission_23",false],
  ["Mission_24",false],
  ["Mission_25",false],
  ["Mission_26",false],
  ["Mission_27",false],
  ["Mission_28",false],
  ["Mission_29",false],
  ["Mission_30",false],
  ["Mission_31",false],
  ["Mission_32",false],
  ["Mission_33",false],
  ["Mission_34",false],
  ["Mission_35",false],
  ["Mission_36",false],
  ["Mission_37",false],
  ["Mission_38",false],
  ["Mission_39",false],
  ["Mission_40",false],
  ["Mission_41",false],
  ["Mission_42",false],
  ["Mission_43",false],
  ["Mission_44",false],
  ["Mission_45",false],
  ["Mission_46",false],
  ["Mission_47",false],
  ["Mission_48",false],
  ["Mission_49",false],
  ["Mission_50",false]
];

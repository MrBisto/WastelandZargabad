//	@file Name: outpostUSA1.sqf
//	@file Author: Scrumbee with the help of Staker89

private ["_objs"];
_objs =
[
["HeliH",[-1.64014,-2.30273,0],0,1,0,{}],
["Land_fortified_nest_small",[12.2993,0.836914,0],225.249,1,0,{}],
["DSHKM_TK_GUE_EP1",[12.3071,1.25879,-0.0750122],44.7138,1,0,{}],
["Land_HBarrier5",[-2.87646,15.5947,0],315.357,1,0,{}],
["Land_fortified_nest_big",[14.1851,15.5459,0],224.165,1,0,{}],
["Land_HBarrier5",[-4.88477,17.3604,0],225.386,1,0,{}],
["Land_Fort_Watchtower",[20.9614,-0.311523,0],316,1,0,{}],
["Land_HBarrier5",[22.0845,7.10352,0],134.25,1,0,{}],
["Land_HBarrier5",[1.10938,19.6943,0],315.357,1,0,{}],
["Fort_Nest_M240",[-15.7422,14.5889,-0.0856628],316.061,1,0,{}],
["Land_HBarrier5",[-13.7935,16.7646,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[9.53906,19.8037,0],221.384,1,0,{}],
["BAF_Launchers",[-3.47461,21.7939,0],302.067,1,0,{}],
["Concrete_Wall_EP1",[-13.1426,17.7197,0],316.111,1,0,{}],
["Fort_Nest_M240",[-16.8164,-14.4697,-0.0856628],227.548,1,0,{}],
["Concrete_Wall_EP1",[-13.019,-18.0459,0],45.4241,1,0,{}],
["Land_HBarrier5",[-18.4341,-11.9443,0],229.06,1,0,{}],
["Land_HBarrier5",[10.0981,19.0635,0],223.535,1,0,{}],
["Land_HBarrier5",[-10.9912,-20.4668,0],229.06,1,0,{}],
["Concrete_Wall_EP1",[-19.6338,-10.9521,0],45.4241,1,0,{}],
["Concrete_Wall_EP1",[-10.7144,19.7803,0],315.247,1,0,{}],
["Concrete_Wall_EP1",[-19.6523,11.1299,0],316.111,1,0,{}],
["Land_HBarrier5",[-21.9341,8.78027,0],315.414,1,0,{}],
["SpecialWeaponsBox",[-0.779785,22.8438,0],33.7681,1,0,{}],
["Fort_Nest_M240",[13.5024,-18.7646,-0.0856628],138.821,1,0,{}],
["Concrete_Wall_EP1",[6.95752,22.0762,0],221.384,1,0,{}],
["Concrete_Wall_EP1",[-21.8125,-8.15527,0],45.4241,1,0,{}],
["Land_HBarrier5",[16.8662,-15.9492,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[-8.40723,21.9971,0],316.029,1,0,{}],
["Concrete_Wall_EP1",[18.9829,-13.9873,0],134.247,1,0,{}],
["Concrete_Wall_EP1",[-10.4897,-21.1885,0],45.4241,1,0,{}],
["Land_HBarrier5",[-9.8877,20.7354,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[-22.3882,8.2998,0],316.111,1,0,{}],
["Concrete_Wall_EP1",[21.0098,-11.6611,0],134.247,1,0,{}],
["Land_HBarrier5",[-22.2344,-7.66895,0],229.06,1,0,{}],
["Land_HBarrier5",[-7.28418,-24.6689,0],229.06,1,0,{}],
["Land_HBarrier5",[20.6797,-11.7275,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[11.1143,-21.9971,0],134.247,1,0,{}],
["Concrete_Wall_EP1",[4.63232,24.2236,0],221.577,1,0,{}],
["Concrete_Wall_EP1",[-24.0874,-5.5918,0],45.4241,1,0,{}],
["Concrete_Wall_EP1",[23.9976,5.99512,0],221.384,1,0,{}],
["Land_HBarrier5",[8.9043,-24.123,0],315.414,1,0,{}],
["Land_HBarrier5",[6.15869,22.9385,0],223.535,1,0,{}],
["Concrete_Wall_EP1",[-6.0708,24.2686,0],319.09,1,0,{}],
["Land_HBarrier5",[-25.9556,4.77246,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[23.3013,-9.43262,0],134.247,1,0,{}],
["Concrete_Wall_EP1",[-8.04004,-23.8076,0],45.4241,1,0,{}],
["Land_HBarrier5",[21.9692,16.5674,0],137.462,1,0,{}],
["Land_HBarrier5",[26.8643,3.52637,0],223.535,1,0,{}],
["Concrete_Wall_EP1",[-25.2974,5.4248,0],316.111,1,0,{}],
["Concrete_Wall_EP1",[8.87793,-24.4375,0],134.247,1,0,{}],
["Concrete_Wall_EP1",[2.31152,26.1367,0],217.068,1,0,{}],
["Land_HBarrier5",[26.2549,11.1338,0],134.25,1,0,{}],
["Concrete_Wall_EP1",[-26.3081,-3.18555,0],45.4241,1,0,{}],
["Land_HBarrier5",[-5.92529,24.6846,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[25.6875,-6.95313,0],134.247,1,0,{}],
["Concrete_Wall_EP1",[26.4507,3.61426,0],221.384,1,0,{}],
["Concrete_Wall_EP1",[-3.83545,26.5137,0],319.09,1,0,{}],
["Land_HBarrier5",[24.6099,-7.88379,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[-5.73535,-26.4248,0],45.4241,1,0,{}],
["Concrete_Wall_EP1",[6.78223,-26.2471,0],316.111,1,0,{}],
["Land_HBarrier5",[-25.8677,-3.35449,0],229.06,1,0,{}],
["Land_HBarrier5",[4.91504,-28.3145,0],315.414,1,0,{}],
["Land_HBarrier5",[-3.49268,-29,0],229.06,1,0,{}],
["Concrete_Wall_EP1",[-27.6499,2.51855,0],316.111,1,0,{}],
["Land_HBarrier5",[1.88184,26.6084,0],211.549,1,0,{}],
["Concrete_Wall_EP1",[-0.151855,27.9561,0],222.174,1,0,{}],
["Land_runway_edgelight",[-28.0596,-2.22363,0],330.024,1,0,{}],
["Land_HBarrier5",[-29.7666,0.570313,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[-2.05078,28.3896,0],319.09,1,0,{}],
["Concrete_Wall_EP1",[-28.5205,-0.575195,0],45.4241,1,0,{}],
["Concrete_Wall_EP1",[28.2344,-4.55566,0],134.247,1,0,{}],
["Concrete_Wall_EP1",[4.62207,-28.4512,0],316.111,1,0,{}],
["Concrete_Wall_EP1",[-3.38477,-28.667,0],45.4241,1,0,{}],
["Concrete_Wall_EP1",[29.0195,1.33691,0],221.384,1,0,{}],
["Land_HBarrier5",[30.6611,-0.317383,0],223.535,1,0,{}],
["Land_HBarrier5",[28.6465,-3.95313,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[30.6255,-2.15234,0],134.247,1,0,{}],
["Land_HBarrier5",[0.90918,-32.2949,0],315.414,1,0,{}],
["Concrete_Wall_EP1",[2.49023,-30.8018,0],316.111,1,0,{}],
["Concrete_Wall_EP1",[30.9282,-0.323242,0],221.384,1,0,{}],
["Land_HBarrier5",[26.1982,20.3984,0],137.462,1,0,{}],
["Land_HBarrier5",[0.278809,-33.3057,0],229.06,1,0,{}],
["Concrete_Wall_EP1",[-0.940918,-31.5439,0],47.3567,1,0,{}],
["Land_HBarrier5",[30.4136,15.0117,0],137.462,1,0,{}],
["Land_runway_edgelight",[-38.0537,15.1074,0],330.024,1,0,{}]
];
_objs
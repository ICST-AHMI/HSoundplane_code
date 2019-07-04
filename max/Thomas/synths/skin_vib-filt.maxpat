{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 6,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 3.0, 79.0, 1372.0, 787.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"globalpatchername" : "skin_vibFilt[2]",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 749.166666666666629, 700.0, 22.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 227.0, 329.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 347.0, 52.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "sustain", "trigger", "trig_no_latency" ],
							"parameter_type" : 2,
							"parameter_longname" : "live.menu",
							"parameter_mmax" : 2,
							"parameter_shortname" : "live.menu"
						}

					}
,
					"varname" : "env_1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 725.5, 619.0, 173.0, 22.0 ],
					"text" : "route /HS_Audio/vibrato/preset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 725.5, 587.0, 71.0, 22.0 ],
					"text" : "r osccontrol"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-28",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 659.0, 519.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 659.0, 489.0, 247.0, 22.0 ],
					"restore" : [ 0.125984251968504 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "pattr vf_revdecay @bindto ::main::rev_decay",
					"varname" : "vf_revdecay"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-31",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 659.0, 442.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 659.0, 410.0, 260.0, 22.0 ],
					"restore" : [ 1.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "pattr vf_revDryWet @bindto ::main::rev_dryWet",
					"varname" : "vf_revDryWet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 34.0, 544.0, 125.0, 22.0 ],
					"text" : "receive~ vibFilt_audio"
				}

			}
, 			{
				"box" : 				{
					"channels" : 1,
					"id" : "obj-27",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 80.5, 592.0, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 244.0, 41.0, 63.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "live.gain~",
							"parameter_mmax" : 6.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_shortname" : "gain"
						}

					}
,
					"slidercolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"trioncolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"varname" : "gain"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 381.0, 621.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.5, 344.5, 76.0, 18.0 ],
					"text" : "semitones",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 381.0, 601.0, 79.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 165.75, 315.0, 79.0, 18.0 ],
					"text" : "transposition",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"id" : "obj-20",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 387.0, 583.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 170.75, 346.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 0,
							"parameter_mmin" : -36.0,
							"parameter_longname" : "live.numbox",
							"parameter_mmax" : 36.0,
							"parameter_shortname" : "live.numbox"
						}

					}
,
					"varname" : "transposition"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-26",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 470.75, 572.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 159.5, 311.0, 137.5, 56.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 589.0, 601.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 589.0, 572.0, 48.0, 22.0 ],
					"text" : "del 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 576.0, 83.0, 32.0, 22.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 335.0, 507.0, 123.0, 22.0 ],
					"text" : "listdump amp_func_1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 335.0, 389.0, 149.0, 22.0 ],
					"text" : "listdump filter_freq_func_1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 329.5, 255.0, 126.0, 22.0 ],
					"text" : "listdump lfo_freq_func"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 344.5, 144.0, 146.0, 22.0 ],
					"text" : "listdump mod_depth_func"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 685.0, 133.0, 22.0 ],
					"text" : "pattrmarker skin_vibFilt"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-9",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 22.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 371.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 376.33984375, 55.0, 18.0 ],
					"text" : "PRESETS",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 725.5, 676.0, 90.0, 16.0 ],
					"pattrstorage" : "synth_vib-filt",
					"presentation" : 1,
					"presentation_rect" : [ 67.5, 377.33984375, 90.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 348.0, 685.0, 56.0, 22.0 ],
					"restore" : 					{
						"FilterFreq_1" : [ 2954.724409448815095 ],
						"LFOfreq" : [ 11.716535433070852 ],
						"amp_func_1" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 211.7117117117117, 0.418181818181818, 0, 527.027027027026975, 0.727272727272727, 0, 1000.0, 1.0, 0, "linear" ],
						"attack_1" : [ 98.740157480314963 ],
						"env_1" : [ 0.0 ],
						"filterfreq_func_1" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 336.206897000000026, 0.26, 0, 775.86206900000002, 0.7, 0, 1000.0, 1.0, 0, "linear" ],
						"gain" : [ 0.0 ],
						"lfofreq_func" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 431.034482758620697, 0.14, 0, 783.783783783783747, 0.6, 0, 1000.0, 1.0, 0, "linear" ],
						"mod_depth" : [ 0.377952755905511 ],
						"moddepth_func" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 316.027088036117391, 0.0, 0, 722.347629796839783, 0.509090909090909, 0, 1000.0, 1.0, 0, "linear" ],
						"release_1" : [ 1602.362204724408912 ],
						"transposition" : [ -24.0 ]
					}
,
					"text" : "autopattr",
					"varname" : "u565011477"
				}

			}
, 			{
				"box" : 				{
					"autorestore" : "synth_vib-filt.json",
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 185.0, 716.0, 223.0, 22.0 ],
					"saved_object_attributes" : 					{
						"client_rect" : [ 4, 44, 358, 172 ],
						"parameter_enable" : 0,
						"parameter_mappable" : 0,
						"storage_rect" : [ 583, 69, 1034, 197 ]
					}
,
					"text" : "pattrstorage synth_vib-filt @savemode 3",
					"varname" : "synth_vib-filt"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-55",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 134.75, 45.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 369.2265625, 292.0, 32.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-10",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 194.5, 45.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 242.0, 55.5, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 293.0, 536.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.5, 243.0, 76.0, 18.0 ],
					"text" : "z to amplitude",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-62",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 328.0, 358.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 311.0, 52.0, 18.0 ],
					"text" : "envelope",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"activeneedlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-12",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 174.5, 559.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 67.5, 315.0, 40.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 2,
							"parameter_linknames" : 1,
							"parameter_mmin" : 5.0,
							"parameter_longname" : "attack_1",
							"parameter_mmax" : 2000.0,
							"parameter_shortname" : "attack"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "attack_1"
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"activeneedlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 217.5, 559.0, 41.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.0, 315.0, 41.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 2,
							"parameter_linknames" : 1,
							"parameter_mmin" : 5.0,
							"parameter_longname" : "release_1",
							"parameter_mmax" : 2000.0,
							"parameter_shortname" : "release"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "release_1"
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"fgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-19",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 131.5, 358.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 184.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 3,
							"parameter_linknames" : 1,
							"parameter_mmin" : 50.0,
							"parameter_longname" : "FilterFreq_1",
							"parameter_mmax" : 6000.0,
							"parameter_shortname" : "FilterFreq"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "FilterFreq_1"
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"fgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 128.5, 254.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 118.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 3,
							"parameter_linknames" : 1,
							"parameter_longname" : "LFOfreq",
							"parameter_mmax" : 24.0,
							"parameter_shortname" : "LFOfreq"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "LFOfreq"
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"activeneedlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-13",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 131.0, 144.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 47.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "mod_depth",
							"parameter_mmax" : 1.0,
							"parameter_shortname" : "mod_depth"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "mod_depth"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 131.0, 14.0, 188.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 12.0, 188.0, 22.0 ],
					"text" : "Synth - Vibrato / Filter",
					"textcolor" : [ 0.952941179275513, 0.564705908298492, 0.098039217293262, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 194.5, 316.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 38.0, 80.0, 18.0 ],
					"text" : "y to mod depth",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-36",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 198.0, 427.5, 71.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 107.0, 71.0, 18.0 ],
					"text" : "y to LFO freq",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 191.0, 531.0, 71.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 175.0, 71.0, 18.0 ],
					"text" : "z to filter freq",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 431.034482758620697, 0.14, 0, 783.783783783783747, 0.6, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-43",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 194.5, 247.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 107.0, 234.0, 67.0 ],
					"varname" : "lfofreq_func"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 211.7117117117117, 0.418181818181818, 0, 527.027027027026975, 0.727272727272727, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-32",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 191.0, 467.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 243.0, 234.0, 67.0 ],
					"varname" : "amp_func_1"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 336.206897000000026, 0.26, 0, 775.86206900000002, 0.7, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-85",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 198.0, 358.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 175.0, 234.0, 67.0 ],
					"varname" : "filterfreq_func_1"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 129.0, 358.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 175.0, 55.5, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-41",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 128.5, 254.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 107.0, 55.5, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-42",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 128.5, 144.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 38.0, 55.5, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 327.0, 45.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 6.886725425720215, 292.0, 32.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-61",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 260.5, 45.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 311.0, 149.5, 56.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 316.027088036117391, 0.0, 0, 722.347629796839783, 0.509090909090909, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-5",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 194.5, 144.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 38.0, 233.5, 67.0 ],
					"varname" : "moddepth_func"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 585.5, 117.0, 354.0, 117.0 ],
					"order" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"midpoints" : [ 585.5, 237.5, 339.0, 237.5 ],
					"order" : 3,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 585.5, 384.5, 344.5, 384.5 ],
					"order" : 2,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 585.5, 492.5, 344.5, 492.5 ],
					"order" : 1,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 598.5, 669.0, 194.5, 669.0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-32", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-43", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"order" : 3,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"order" : 2,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"order" : 1,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-5", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-6", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-85", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-39" : [ "live.menu", "live.menu", 0 ],
			"obj-12" : [ "attack_1", "attack", 0 ],
			"obj-19" : [ "FilterFreq_1", "FilterFreq", 0 ],
			"obj-4" : [ "release_1", "release", 0 ],
			"obj-15" : [ "LFOfreq", "LFOfreq", 0 ],
			"obj-13" : [ "mod_depth", "mod_depth", 0 ],
			"obj-27" : [ "live.gain~", "gain", 0 ],
			"obj-20" : [ "live.numbox", "live.numbox", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "synth_vib-filt.json",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundplane/HSoundplane_code/max/Thomas/synths",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "STYLE1",
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpatcher001",
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tap",
				"default" : 				{
					"fontname" : [ "Lato Light" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"bgcolor" : [ 0.898039215686275, 0.898039215686275, 0.898039215686275, 1.0 ]
	}

}

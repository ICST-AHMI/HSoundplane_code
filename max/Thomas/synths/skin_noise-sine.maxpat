{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 269.0, 79.0, 978.0, 787.0 ],
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
		"globalpatchername" : "skin_noise[1][1]",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 584.0, 302.0, 165.0, 22.0 ],
					"text" : "route /HS_Audio/noise/preset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.0, 270.0, 71.0, 22.0 ],
					"text" : "r osccontrol"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"id" : "obj-60",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 586.5, 273.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 346.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2,
							"parameter_longname" : "env_1",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text"
						}

					}
,
					"text" : "sustain",
					"texton" : "trigger",
					"varname" : "env_1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-33",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 625.0, 510.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 625.0, 480.0, 250.0, 22.0 ],
					"restore" : [ 0.125984251968504 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "pattr ns_revdecay @bindto ::main::rev_decay",
					"varname" : "ns_revdecay"
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
					"patching_rect" : [ 625.0, 433.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 625.0, 401.0, 264.0, 22.0 ],
					"restore" : [ 0.322834645669291 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "pattr ns_revDryWet @bindto ::main::rev_dryWet",
					"varname" : "ns_revDryWet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 443.5, 547.0, 106.0, 22.0 ],
					"text" : "receive~ ns_audio"
				}

			}
, 			{
				"box" : 				{
					"channels" : 1,
					"id" : "obj-10",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 443.5, 576.0, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 108.0, 41.0, 63.0 ],
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
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 198.0, 592.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 246.0, 212.0, 76.0, 18.0 ],
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
					"patching_rect" : [ 179.25, 591.0, 79.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 195.0, 181.0, 79.0, 18.0 ],
					"text" : "transposition",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bordercolor" : [ 0.427450980392157, 0.843137254901961, 1.0, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 129.25, 591.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 200.0, 212.0, 44.0, 15.0 ],
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
					"id" : "obj-19",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 269.0, 547.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 189.0, 177.0, 116.0, 56.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 506.0, 405.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 506.0, 370.0, 48.0, 22.0 ],
					"text" : "del 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 493.0, 74.0, 32.0, 22.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 315.5, 470.0, 58.0, 22.0 ],
					"restore" : 					{
						"NoiseAmount" : [ 0.0 ],
						"amp_func_3" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 215.51724200000001, 0.54, 0, 620.68963599999995, 0.7, 0, 1000.0, 1.0, 0, "linear" ],
						"attack_3" : [ 5.0 ],
						"env_1" : [ 0.0 ],
						"env_3" : [ 0.0 ],
						"gain" : [ -0.000000000000014 ],
						"noise_func" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 293.103454999999997, 0.32, 0, 629.31036400000005, 0.64, 0, 1000.0, 1.0, 0, "linear" ],
						"release_3" : [ 5.0 ],
						"transposition" : [ 0.0 ]
					}
,
					"text" : "autopattr",
					"varname" : "u055014669"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 397.5, 470.0, 140.0, 22.0 ],
					"text" : "pattrmarker skin_noise"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.5, 225.0, 115.0, 22.0 ],
					"text" : "listdump noise_func"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 323.0, 124.0, 123.0, 22.0 ],
					"text" : "listdump amp_func_3"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-4",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 493.0, 34.226547241210938, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 219.0, 432.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 242.0, 52.0, 18.0 ],
					"text" : "PRESET",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 584.0, 337.0, 79.0, 15.0 ],
					"pattrstorage" : "synth_noise-tone",
					"presentation" : 1,
					"presentation_rect" : [ 94.0, 243.5, 79.0, 15.0 ]
				}

			}
, 			{
				"box" : 				{
					"autorestore" : "synth_noise-tone.json",
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 132.0, 499.0, 248.0, 22.0 ],
					"saved_object_attributes" : 					{
						"client_rect" : [ 4, 45, 712, 250 ],
						"parameter_enable" : 0,
						"parameter_mappable" : 0,
						"storage_rect" : [ 583, 69, 1034, 197 ]
					}
,
					"text" : "pattrstorage synth_noise-tone @savemode 3",
					"varname" : "synth_noise-tone"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-47",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 258.0, 40.226546999999997, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 234.88671875, 292.0, 32.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 128.0, 337.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 18.0, 177.0, 52.0, 18.0 ],
					"text" : "envelope",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.647059, 0.647059, 0.647059, 1.0 ],
					"id" : "obj-68",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 190.25, 384.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 212.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2,
							"parameter_longname" : "env_3",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text"
						}

					}
,
					"text" : "sustain",
					"texton" : "trigger",
					"varname" : "env_3"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 282.0, 351.0, 44.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 136.5, 181.0, 44.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 2,
							"parameter_linknames" : 1,
							"parameter_mmin" : 5.0,
							"parameter_longname" : "release_3",
							"parameter_mmax" : 2000.0,
							"parameter_shortname" : "release"
						}

					}
,
					"textcolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"varname" : "release_3"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"id" : "obj-56",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 236.25, 351.0, 44.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 94.0, 181.0, 44.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 2,
							"parameter_linknames" : 1,
							"parameter_mmin" : 5.0,
							"parameter_longname" : "attack_3",
							"parameter_mmax" : 1000.0,
							"parameter_shortname" : "attack"
						}

					}
,
					"textcolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"varname" : "attack_3"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 194.5, 35.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 108.0, 67.0, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 97.25, 225.0, 58.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 18.0, 47.0, 58.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "NoiseAmount",
							"parameter_mmax" : 1.0,
							"parameter_shortname" : "NoiseAmount"
						}

					}
,
					"textcolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"varname" : "NoiseAmount"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 127.25, 9.0, 187.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 18.0, 13.0, 187.0, 22.0 ],
					"text" : "Synth - Noise to Pitch",
					"textcolor" : [ 0.952941000461578, 0.564706027507782, 0.098039001226425, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-39",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 179.25, 286.0, 96.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.0, 39.0, 96.0, 18.0 ],
					"text" : "y to noise/sinusoid",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 179.25, 188.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 77.0, 108.0, 76.0, 18.0 ],
					"text" : "z to amplitude",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 215.51724200000001, 0.54, 0, 620.68963599999995, 0.7, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-14",
					"legend" : 0,
					"linecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 179.25, 124.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.0, 108.0, 223.0, 67.0 ],
					"varname" : "amp_func_3"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 293.103454999999997, 0.32, 0, 629.31036400000005, 0.64, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-25",
					"legend" : 0,
					"linecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 179.25, 225.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.0, 40.0, 223.0, 67.0 ],
					"varname" : "noise_func"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 102.75, 225.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 39.0, 67.0, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-52",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 127.25, 35.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 8.0, 292.0, 32.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 124.0, 337.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 177.0, 174.0, 56.226547241210938 ],
					"proportion" : 0.5
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 515.5, 462.5, 141.5, 462.5 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-14", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-25", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"midpoints" : [ 502.5, 109.5, 332.5, 109.5 ],
					"order" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"midpoints" : [ 502.5, 213.0, 325.0, 213.0 ],
					"order" : 1,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-46" : [ "release_3", "release", 0 ],
			"obj-10" : [ "live.gain~", "gain", 0 ],
			"obj-15" : [ "live.numbox", "live.numbox", 0 ],
			"obj-56" : [ "attack_3", "attack", 0 ],
			"obj-68" : [ "env_3", "live.text", 0 ],
			"obj-29" : [ "NoiseAmount", "NoiseAmount", 0 ],
			"obj-60" : [ "env_1", "live.text", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "synth_noise-tone.json",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/Thomas/synths",
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
 ]
	}

}

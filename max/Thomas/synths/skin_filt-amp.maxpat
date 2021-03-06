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
		"rect" : [ 103.0, 79.0, 907.0, 707.0 ],
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
		"globalpatchername" : "skin_filtAmp[1]",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 569.0, 445.0, 22.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"id" : "obj-24",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 227.0, 329.0, 100.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 19.75, 215.0, 52.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu",
							"parameter_mmax" : 2,
							"parameter_shortname" : "live.menu",
							"parameter_enum" : [ "sustain", "trigger", "trig_no_latency" ],
							"parameter_type" : 2
						}

					}
,
					"varname" : "env_2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 545.0, 373.0, 159.0, 22.0 ],
					"text" : "route /HS_Audio/filter/preset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 545.0, 341.0, 71.0, 22.0 ],
					"text" : "r osccontrol"
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
					"patching_rect" : [ 512.0, 603.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 512.0, 573.0, 247.0, 22.0 ],
					"restore" : [ 0.125984251968504 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "pattr fa_revdecay @bindto ::main::rev_decay",
					"varname" : "fa_revdecay"
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
					"patching_rect" : [ 512.0, 526.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 512.0, 494.0, 261.0, 22.0 ],
					"restore" : [ 1.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "pattr fa_revDryWet @bindto ::main::rev_dryWet",
					"varname" : "fa_revDryWet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 34.75, 526.0, 130.0, 22.0 ],
					"text" : "receive~ filtAmp_audio"
				}

			}
, 			{
				"box" : 				{
					"channels" : 1,
					"id" : "obj-12",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 34.75, 555.0, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 113.0, 41.0, 63.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.gain~",
							"parameter_mmax" : 6.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_shortname" : "gain",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0
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
					"patching_rect" : [ 183.0, 577.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 231.75, 213.5, 76.0, 18.0 ],
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
					"patching_rect" : [ 314.0, 577.0, 79.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 184.0, 184.0, 79.0, 18.0 ],
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
					"patching_rect" : [ 264.0, 577.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 189.0, 215.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.numbox",
							"parameter_mmax" : 36.0,
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0,
							"parameter_mmin" : -36.0
						}

					}
,
					"varname" : "transposition"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 478.0, 294.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 478.0, 262.0, 48.0, 22.0 ],
					"text" : "del 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 465.0, 83.0, 32.0, 22.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 355.0, 494.0, 58.0, 22.0 ],
					"restore" : 					{
						"FilterFreq_2" : [ 50.0 ],
						"amp_func_2" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 215.51724200000001, 0.54, 0, 642.241394000000014, 0.68, 0, 1000.0, 1.0, 0, "linear" ],
						"attack_2" : [ 5.0 ],
						"env_2" : [ 0.0 ],
						"filterfreq_func_2" : [ 1000.0, 0.0, 1.0, 0.0, 0.0, 0, 224.137923999999998, 0.42, 0, 383.620697000000007, 0.48, 0, 655.172423999999978, 0.86, 0, 1000.0, 1.0, 0, "linear" ],
						"gain" : [ 0.0 ],
						"release_2" : [ 5.0 ],
						"transposition" : [ 0.0 ]
					}
,
					"text" : "autopattr",
					"varname" : "u952011942"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 545.0, 39.0, 138.0, 22.0 ],
					"text" : "pattrmarker skin_filtAmp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 264.0, 230.0, 149.0, 22.0 ],
					"text" : "listdump filter_freq_func_2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 277.0, 122.0, 123.0, 22.0 ],
					"text" : "listdump amp_func_2"
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
					"patching_rect" : [ 465.0, 39.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 66.75, 465.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 24.75, 245.0, 52.0, 18.0 ],
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
					"patching_rect" : [ 545.0, 415.0, 91.0, 16.0 ],
					"pattrstorage" : "synth_filt-amp",
					"presentation" : 1,
					"presentation_rect" : [ 78.75, 246.0, 91.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"autorestore" : "synth_filt-amp.json",
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 93.5, 494.0, 231.0, 22.0 ],
					"saved_object_attributes" : 					{
						"client_rect" : [ 4, 44, 358, 172 ],
						"parameter_enable" : 0,
						"parameter_mappable" : 0,
						"storage_rect" : [ 583, 69, 1034, 197 ]
					}
,
					"text" : "pattrstorage synth_filt-amp @savemode 3",
					"varname" : "synth_filt-amp"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-20",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 198.0, 50.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.75, 237.88671875, 292.0, 32.226547241210938 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 10.0,
					"id" : "obj-64",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 334.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 19.75, 185.0, 52.0, 18.0 ],
					"text" : "envelope",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"id" : "obj-16",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 215.0, 334.0, 44.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 121.25, 184.0, 44.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "release_2",
							"parameter_mmax" : 2000.0,
							"parameter_shortname" : "release",
							"parameter_type" : 0,
							"parameter_unitstyle" : 2,
							"parameter_linknames" : 1,
							"parameter_mmin" : 5.0
						}

					}
,
					"textcolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"varname" : "release_2"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"id" : "obj-18",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 173.0, 334.0, 44.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 78.75, 184.0, 44.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "attack_2",
							"parameter_mmax" : 1000.0,
							"parameter_shortname" : "attack",
							"parameter_type" : 0,
							"parameter_unitstyle" : 2,
							"parameter_linknames" : 1,
							"parameter_mmin" : 5.0
						}

					}
,
					"textcolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"varname" : "attack_2"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-48",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 131.5, 50.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.75, 111.0, 52.5, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 42.0, 249.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 51.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "FilterFreq_2",
							"parameter_mmax" : 6000.0,
							"parameter_shortname" : "FilterFreq",
							"parameter_type" : 0,
							"parameter_unitstyle" : 3,
							"parameter_linknames" : 1,
							"parameter_mmin" : 50.0
						}

					}
,
					"textcolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"varname" : "FilterFreq_2"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 14.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.0, 24.0, 188.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 19.75, 16.0, 188.0, 22.0 ],
					"text" : "Synth - Filter / Amplitude",
					"textcolor" : [ 0.952941000461578, 0.564706027507782, 0.098039001226425, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-35",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 122.5, 197.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 111.0, 76.0, 18.0 ],
					"text" : "z to amplitude",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 10.0,
					"id" : "obj-34",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 112.0, 304.0, 71.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 68.0, 42.0, 71.0, 18.0 ],
					"text" : "y to filter freq",
					"textcolor" : [ 0.847059011459351, 0.847059011459351, 0.847059011459351, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 215.51724200000001, 0.54, 0, 642.241394000000014, 0.68, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-11",
					"legend" : 0,
					"linecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 122.5, 133.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.0, 111.0, 237.5, 67.0 ],
					"varname" : "amp_func_2"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 224.137923999999998, 0.42, 0, 383.620697000000007, 0.48, 0, 655.172423999999978, 0.86, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-6",
					"legend" : 0,
					"linecolor" : [ 0.847059, 0.847059, 0.847059, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 122.5, 235.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 68.0, 43.0, 237.5, 67.0 ],
					"varname" : "filterfreq_func_2"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.560784, 0.623529, 0.631373, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-44",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.75, 235.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.75, 42.0, 52.5, 67.0 ],
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
					"id" : "obj-51",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.0, 50.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.5, 11.0, 292.0, 32.0 ],
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
					"id" : "obj-63",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 334.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.75, 180.0, 160.0, 56.226547241210938 ],
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
					"id" : "obj-19",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 403.75, 533.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 177.75, 180.0, 130.0, 56.226547241210938 ],
					"proportion" : 0.5
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-11", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 487.5, 488.5, 103.0, 488.5 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"order" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"order" : 1,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-29", 0 ]
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
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-6", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 474.5, 113.0, 286.5, 113.0 ],
					"order" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"midpoints" : [ 474.5, 167.0, 273.5, 167.0 ],
					"order" : 1,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-24" : [ "live.menu", "live.menu", 0 ],
			"obj-26" : [ "FilterFreq_2", "FilterFreq", 0 ],
			"obj-18" : [ "attack_2", "attack", 0 ],
			"obj-16" : [ "release_2", "release", 0 ],
			"obj-12" : [ "live.gain~", "gain", 0 ],
			"obj-15" : [ "live.numbox", "live.numbox", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "synth_filt-amp.json",
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
 ]
	}

}

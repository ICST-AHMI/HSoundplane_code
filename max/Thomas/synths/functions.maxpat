{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 59.0, 104.0, 1233.0, 724.0 ],
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
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 594.0, 521.0, 76.0, 22.0 ],
					"text" : "s max_noise"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 46.0, 219.0, 107.0, 22.0 ],
					"text" : "s max_mod_depth"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 311.0, 521.0, 78.0, 22.0 ],
					"text" : "s max_ffreq2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 46.0, 507.0, 71.0, 22.0 ],
					"text" : "s max_ffreq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 46.0, 364.0, 91.0, 22.0 ],
					"text" : "s max_LFOfreq"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 123.0, 547.0, 100.0, 22.0 ],
					"text" : "bgcolor 19 19 19"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 2,
					"bordercolor" : [ 0.56078431372549, 0.623529411764706, 0.631372549019608, 1.0 ],
					"grad1" : [ 0.2, 0.2, 0.2, 1.0 ],
					"grad2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 740.5, 70.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 710.0, 38.0, 67.0, 67.0 ],
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
					"id" : "obj-48",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 437.5, 70.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 358.75, 38.0, 52.5, 67.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 968.0, 177.0, 56.0, 22.0 ],
					"restore" : 					{
						"FilterFreq" : [ 3704.330708661425888 ],
						"FilterFreq[1]" : [ 50.0 ],
						"LFOfreq" : [ 15.496062992125999 ],
						"NoiseAmount" : [ 0.47244094488189 ],
						"live.dial" : [ 0.338582677165354 ]
					}
,
					"text" : "autopattr",
					"varname" : "u155006716"
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"fgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-29",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 594.0, 432.0, 58.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.0, 115.0, 58.0, 48.0 ],
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
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "NoiseAmount"
				}

			}
, 			{
				"box" : 				{
					"activefgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"fgdialcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"id" : "obj-26",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 311.0, 429.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 360.0, 116.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 3,
							"parameter_linknames" : 1,
							"parameter_mmin" : 50.0,
							"parameter_longname" : "FilterFreq[1]",
							"parameter_mmax" : 6000.0,
							"parameter_shortname" : "FilterFreq"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "FilterFreq[1]"
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
					"patching_rect" : [ 46.0, 429.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 185.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 3,
							"parameter_linknames" : 1,
							"parameter_mmin" : 50.0,
							"parameter_longname" : "FilterFreq",
							"parameter_mmax" : 6000.0,
							"parameter_shortname" : "FilterFreq"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "FilterFreq"
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
					"patching_rect" : [ 46.0, 280.0, 50.0, 48.0 ],
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
					"patching_rect" : [ 46.0, 133.0, 50.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 47.0, 50.0, 48.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 1,
							"parameter_longname" : "live.dial",
							"parameter_mmax" : 1.0,
							"parameter_shortname" : "mod_depth"
						}

					}
,
					"textcolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"varname" : "live.dial"
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
					"patching_rect" : [ 381.0, 44.0, 188.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 362.75, 12.0, 188.0, 22.0 ],
					"text" : "Synth - Filter / Amplitude",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
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
					"patching_rect" : [ 581.0, 44.0, 187.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 715.0, 12.0, 187.0, 22.0 ],
					"text" : "Synth - Noise to Pitch",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
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
					"patching_rect" : [ 109.0, 44.0, 188.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.0, 12.0, 188.0, 22.0 ],
					"text" : "Synth - Vibrato / Filter",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 964.0, 37.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 964.0, 87.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
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
					"patching_rect" : [ 676.0, 493.0, 96.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 786.0, 112.0, 96.0, 18.0 ],
					"text" : "y to noise/sinusoid",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
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
					"patching_rect" : [ 676.0, 339.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 786.0, 38.0, 76.0, 18.0 ],
					"text" : "z to amplitude",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
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
					"patching_rect" : [ 116.0, 197.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 74.0, 38.0, 80.0, 18.0 ],
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
					"patching_rect" : [ 123.0, 344.0, 71.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.0, 112.0, 71.0, 18.0 ],
					"text" : "y to LFO freq",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
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
					"patching_rect" : [ 381.0, 339.0, 76.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 423.0, 38.0, 76.0, 18.0 ],
					"text" : "z to amplitude",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
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
					"patching_rect" : [ 381.0, 501.0, 71.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 423.0, 112.0, 71.0, 18.0 ],
					"text" : "y to filter freq",
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
					"patching_rect" : [ 116.0, 493.0, 71.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 74.0, 204.0, 71.0, 18.0 ],
					"text" : "z to filter freq",
					"textcolor" : [ 0.847058832645416, 0.847058832645416, 0.847058832645416, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 676.0, 245.0, 109.0, 22.0 ],
					"text" : "listdump amp_func"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 215.517241000000013, 0.54, 0, 603.448275999999964, 0.82, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-14",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 676.0, 275.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 791.0, 38.0, 206.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 676.0, 406.0, 117.0, 22.0 ],
					"text" : "listdump noise_func"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 224.137931000000009, 0.4, 0, 568.965516999999977, 0.84, 0, 1000.0, 1.0, 0, 1000.0, 0.927272727272727, 2 ],
					"id" : "obj-25",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 676.0, 432.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 791.0, 107.0, 206.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.0, 245.0, 109.0, 22.0 ],
					"text" : "listdump amp_func"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 215.517241000000013, 0.54, 0, 603.448275999999964, 0.82, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-11",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 381.0, 275.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 428.0, 38.0, 215.5, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.0, 406.0, 149.0, 22.0 ],
					"text" : "listdump filter_freq_func_2"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 224.137931000000009, 0.42, 0, 655.172414000000003, 0.86, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-6",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 381.0, 432.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 428.0, 107.0, 215.5, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 116.0, 403.0, 136.0, 22.0 ],
					"text" : "listdump filter_freq_func"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 116.0, 254.0, 126.0, 22.0 ],
					"text" : "listdump lfo_freq_func"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 116.0, 103.0, 146.0, 22.0 ],
					"text" : "listdump mod_depth_func"
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 387.931034000000011, 0.0, 0, 724.13793099999998, 0.44, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-43",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 116.0, 133.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 79.0, 38.0, 216.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 327.586207000000002, 0.1, 0, 637.931033999999954, 0.78, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-32",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 116.0, 429.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 79.0, 176.0, 216.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 336.206897000000026, 0.26, 0, 534.482758999999987, 0.44, 0, 775.86206900000002, 0.7, 0, 1000.0, 1.0, 0 ],
					"id" : "obj-85",
					"legend" : 0,
					"linecolor" : [ 0.847058823529412, 0.847058823529412, 0.847058823529412, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 116.0, 280.0, 128.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 79.0, 107.0, 216.0, 67.0 ]
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
					"patching_rect" : [ 43.5, 429.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 176.0, 55.5, 67.0 ],
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
					"patching_rect" : [ 46.0, 280.0, 52.5, 67.0 ],
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
					"patching_rect" : [ 43.5, 133.0, 52.5, 67.0 ],
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
					"id" : "obj-44",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 309.75, 432.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 358.75, 107.0, 52.5, 67.0 ],
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
					"id" : "obj-45",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 599.5, 432.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 710.0, 107.0, 67.0, 67.0 ],
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
					"patching_rect" : [ 50.0, 37.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 6.886725425720215, 287.0, 32.226547241210938 ],
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
					"id" : "obj-52",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 652.5, 31.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 710.0, 7.0, 287.0, 32.0 ],
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
					"id" : "obj-51",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 376.0, 30.0, 52.5, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 356.5, 7.0, 287.0, 32.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-28",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 658.0, 432.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 775.0, 107.0, 16.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-30",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 658.0, 275.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 775.0, 38.0, 16.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-23",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 363.0, 275.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 412.0, 38.0, 16.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-20",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 98.0, 133.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 38.0, 16.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-21",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 98.0, 280.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 107.0, 16.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-22",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 98.0, 429.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 63.0, 176.0, 16.0, 67.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"id" : "obj-27",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 363.0, 432.0, 16.0, 67.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 412.0, 107.0, 16.0, 67.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 499.5, 347.0, 536.0, 347.0, 536.0, 234.0, 390.5, 234.0 ],
					"source" : [ "obj-11", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 794.5, 347.0, 831.0, 347.0, 831.0, 234.0, 685.5, 234.0 ],
					"source" : [ "obj-14", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 794.5, 504.0, 815.0, 504.0, 815.0, 395.0, 685.5, 395.0 ],
					"source" : [ "obj-25", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
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
					"destination" : [ "obj-89", 0 ],
					"midpoints" : [ 234.5, 501.0, 249.0, 501.0, 249.0, 392.0, 125.5, 392.0 ],
					"source" : [ "obj-32", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"midpoints" : [ 234.5, 205.0, 271.0, 205.0, 271.0, 92.0, 125.5, 92.0 ],
					"source" : [ "obj-43", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 499.5, 504.0, 537.0, 504.0, 537.0, 395.0, 390.5, 395.0 ],
					"source" : [ "obj-6", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"midpoints" : [ 234.5, 349.0, 251.0, 349.0, 251.0, 243.0, 125.5, 243.0 ],
					"source" : [ "obj-85", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-26" : [ "FilterFreq[1]", "FilterFreq", 0 ],
			"obj-29" : [ "NoiseAmount", "NoiseAmount", 0 ],
			"obj-15" : [ "LFOfreq", "LFOfreq", 0 ],
			"obj-13" : [ "live.dial", "mod_depth", 0 ],
			"obj-19" : [ "FilterFreq", "FilterFreq", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [  ],
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
 ],
		"bgcolor" : [ 0.074509803921569, 0.074509803921569, 0.074509803921569, 1.0 ]
	}

}

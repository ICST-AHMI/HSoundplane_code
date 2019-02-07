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
		"rect" : [ 165.0, 141.0, 810.0, 692.0 ],
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
		"globalpatchername" : "skin[1][1][1][1][1][1][1]",
		"boxes" : [ 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-5",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "skin_mix.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 607.0, 153.0, 295.0, 450.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 0.0, 295.0, 450.0 ],
					"varname" : "skin_mix",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "skin_noise.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 307.0, 153.0, 295.0, 450.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 0.0, 295.0, 450.0 ],
					"varname" : "hap-noise",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "skin_sine.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 7.0, 153.0, 295.0, 450.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 295.0, 450.0 ],
					"varname" : "hap-sine",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 937.0, 55.0, 64.0, 22.0 ],
					"text" : "sel update"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 982.0, 135.0, 98.0, 22.0 ],
					"text" : "bgcolor 19 19 19"
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
					"patching_rect" : [ 937.0, 14.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 982.0, 96.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 2,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 1,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"order" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-4::obj-12" : [ "lowFreq[1]", "low", 0 ],
			"obj-2::obj-12" : [ "lowFreq", "low", 0 ],
			"obj-2::obj-13" : [ "mod_depth", "mod_depth", 0 ],
			"obj-4::obj-13" : [ "mod_depth[1]", "mod_depth", 0 ],
			"obj-5::obj-13" : [ "mod_depth[2]", "mod_depth", 0 ],
			"obj-5::obj-16" : [ "gain[2]", "gain", 0 ],
			"obj-5::obj-2" : [ "freqShiftEnable", "freqShiftEnable", 0 ],
			"obj-5::obj-60" : [ "env_1[2]", "live.text", 0 ],
			"obj-2::obj-2" : [ "pitchTrackEnable", "pitchTrackEnable", 0 ],
			"obj-4::obj-4" : [ "highFreq[1]", "high", 0 ],
			"obj-5::obj-12" : [ "lowFreq[2]", "low", 0 ],
			"obj-4::obj-16" : [ "gain[1]", "gain", 0 ],
			"obj-2::obj-4" : [ "highFreq", "high", 0 ],
			"obj-5::obj-4" : [ "highFreq[2]", "high", 0 ],
			"obj-2::obj-16" : [ "gain", "gain", 0 ],
			"obj-4::obj-60" : [ "env_1[1]", "live.text", 0 ],
			"obj-2::obj-60" : [ "env_1", "live.text", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "skin_sine.maxpat",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/HSoundplane/HS_Hub/Hap_V001",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "preset-sine.json",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/HSoundplane/HS_Hub/Hap_V001",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "skin_noise.maxpat",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/HSoundplane/HS_Hub/Hap_V001",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "preset-noise.json",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/HSoundplane/HS_Hub/Hap_V001",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "skin_mix.maxpat",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/HSoundplane/HS_Hub/Hap_V001",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "preset-mix.json",
				"bootpath" : "~/Documents/01_projects/HSoundPlane/code/max/HSoundplane/HS_Hub/Hap_V001",
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
 ],
		"bgcolor" : [ 0.074509803921569, 0.074509803921569, 0.074509803921569, 1.0 ]
	}

}

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
		"rect" : [ 176.0, 79.0, 1421.0, 576.0 ],
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
		"globalpatchername" : "skin",
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
					"name" : "skin_noise-sine.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ -10.0, -6.0 ],
					"patching_rect" : [ 684.0, 11.0, 321.0, 403.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 684.0, 11.0, 321.0, 403.0 ],
					"varname" : "skin_noise-sine",
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
					"name" : "skin_filt-amp.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ -13.0, -11.0 ],
					"patching_rect" : [ 343.0, 10.0, 306.0, 389.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 344.0, 12.0, 306.0, 389.0 ],
					"varname" : "skin_filt-amp",
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
					"name" : "skin_vib-filt.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ -7.0, -5.0 ],
					"patching_rect" : [ 12.0, 11.0, 295.0, 397.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.0, 11.0, 295.0, 397.0 ],
					"varname" : "skin_vib-filt",
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
					"patching_rect" : [ 1238.0, 59.0, 64.0, 22.0 ],
					"text" : "sel update"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 1283.0, 139.0, 100.0, 22.0 ],
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
					"patching_rect" : [ 1238.0, 13.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1283.0, 100.0, 69.0, 22.0 ],
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
			"obj-2::obj-13" : [ "mod_depth[1]", "mod_depth", 0 ],
			"obj-5::obj-68" : [ "env_3", "live.text", 0 ],
			"obj-4::obj-26" : [ "FilterFreq_2", "FilterFreq", 0 ],
			"obj-4::obj-16" : [ "release_2", "release", 0 ],
			"obj-2::obj-19" : [ "FilterFreq_1[1]", "FilterFreq", 0 ],
			"obj-2::obj-60" : [ "env_1[1]", "live.text", 0 ],
			"obj-2::obj-4" : [ "release_1[1]", "release", 0 ],
			"obj-5::obj-56" : [ "attack_3", "attack", 0 ],
			"obj-4::obj-65" : [ "env_3[1]", "live.text", 0 ],
			"obj-2::obj-15" : [ "LFOfreq[1]", "LFOfreq", 0 ],
			"obj-5::obj-29" : [ "NoiseAmount", "NoiseAmount", 0 ],
			"obj-2::obj-12" : [ "attack_1[1]", "attack", 0 ],
			"obj-5::obj-46" : [ "release_3", "release", 0 ],
			"obj-4::obj-18" : [ "attack_2", "attack", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "skin_vib-filt.maxpat",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundpane/synths",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "synth_vib-filt.json",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundpane/synths",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "skin_filt-amp.maxpat",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundpane/synths",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "synth_filt-amp.json",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundpane/synths",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "skin_noise-sine.maxpat",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundpane/synths",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "synth_noise-tone.json",
				"bootpath" : "~/Documents/00_DOCUMENTE/02-PROJEKTE/ICST/Soundpane/synths",
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

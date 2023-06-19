#!/usr/bin/env python

# Generates the overlastgebieden map.

from generate import block, p, q

# Name, basename of table, color
layers = [
    ("algemeen_overlastgebied", "algemeenoverlast", 0xd4212c),
    ("cameratoezichtgebied", "cameratoezicht", 0x337229),
    ("dealeroverlastgebied", "dealeroverlast", 0x3166bc),
    ("uitgaansoverlastgebied", "uitgaansoverlast", 0xff8011),
    ("alcoholverbodsgebied", "alcoholverbod", 0xa91ba9),
    ("straatartiestverbod", "straatartiestverbod", 0x990033),
    ("taxi-standplaatsgebied", "taxistandplaats", 0xecd316),
    ("vuurwerkvrijezone", "vuurwerkvrij", 0x993300),
    ("barbecueverbodsgebieden", "barbecueverbod", 0xa00078),
    ("rondleidingverbodsgebieden", "rondleidingverbod", 0x00d2b4),
    ("messenverbodgebieden", "messenverbod", 0xff0000),
    ("groepsfietsverbodgebieden", "groepsfietsverbod", 0xffff00),
    ("raamsluitingstijden", "raamsluitingstijdenverbod", 0x00a03c),
    ("alcoholverkoopverbodgebied", "alcoholverkoopverbod", 0xe50082),
    ("blowverbodsgebied", "blowverbodsgebied", 0x009dec)
]

print("# GENERATED FILE, DO NOT EDIT.\n\n")

with block("MAP"):
    p("NAME", "Overlastgebieden")
    p("INCLUDE", "header.inc")

    with block("WEB"):
        with block("METADATA"):
            q("ows_title", "Overlastgebieden")
            q("ows_abstract", "Overlastgebieden")

    for name, basename, color in layers:
        color = f"{(color>>16) & 0xff} {(color>>8) & 0xff} {color & 0xff}"

        with block("LAYER"):
            p("NAME", name)
            p("GROUP", "overlastgebieden")
            p("INCLUDE", "connection/dataservices.inc")
            p("DATA", f"geometry FROM public.overlastgebieden_{basename} USING srid=28992 USING UNIQUE id")
            p("TYPE POLYGON")
            p("MINSCALEDENOM 100")
            p("MAXSCALEDENOM 400000")
            p("TEMPLATE", "fooOnlyForWMSGetFeatureInfo.html")
            with block("PROJECTION"):
                q("init=epsg:28992")

            with block("METADATA"):
                q("ows_title", name)
                q("ows_group_title", "overlastgebieden")
                q("ows_abstract", "Overlastgebieden van de gemeente Amsterdam")
                q("gml_featureid", "ID")
                q("gml_include_items", "all")

            with block("CLASS"):
                p("NAME", name.replace("-", "_").title().replace("_", ""))
                with block("STYLE"):
                    p("ANTIALIAS true")
                    p(f"COLOR {color}")
                    p("OPACITY 20")
                with block("STYLE"):
                    p(f"OUTLINECOLOR {color}")
                    p("WIDTH 2")

    for name, basename, color in layers:
        name += "_label"
        color = f"{(color>>16) & 0xff} {(color>>8) & 0xff} {color & 0xff}"

        with block("LAYER"):
            p("NAME", name)
            p("GROUP", "overlastgebieden")
            p("INCLUDE", "connection/dataservices.inc")
            p("DATA", f"geometry FROM public.overlastgebieden_{basename} USING srid=28992 USING UNIQUE id")
            p("TYPE POLYGON")

            if name == "algemeen_overlastgebied":
                p("MAXSCALEDENOM", 8000)
            else:
                p("MINSCALEDENOM", 100)
                p("MAXSCALEDENOM", 8001)

            p("TEMPLATE", "fooOnlyForWMSGetFeatureInfo.html")
            with block("PROJECTION"):
                q("init=epsg:28992")

            with block("METADATA"):
                q("ows_title", name)
                q("ows_group_title", "overlastgebieden")
                q("ows_abstract", "Labels van de overlastgebieden van de gemeente Amsterdam")

            with block("CLASS"):
                p("TEXT", "[oov_naam]")
                p("NAME", name)

                for minscale, maxscale, fontsize in [
                    (None, 3000, 14),
                    (3000, 6000, 12),
                    (6000, 8000, 10),
                ]:
                    with block("LABEL"):
                        if minscale is not None:
                            p("MINSCALEDENOM", minscale)
                        p("MAXSCALEDENOM", maxscale)
                        p(f"COLOR {color}")
                        p("OUTLINECOLOR 255 255 255")
                        p("OUTLINEWIDTH 1")
                        p("FONT", "Ubuntu-M")
                        p("TYPE truetype")
                        p(f"SIZE {fontsize}")
                        p("POSITION AUTO")
                        p("PARTIALS FALSE")
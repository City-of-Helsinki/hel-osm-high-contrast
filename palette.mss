/* ****************************************************************** */
/* SERVICE MAP for VISUALLY IMPAIRED USERS                            */
/* ****************************************************************** */

/* Based on the Service map style (in turn based on OSM bright)
 * All edits to the original style are marked by 'XXX'.
 */


/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); }

/* set up font sets for various weights and styles */
@sans_lt:           "Lato Regular"; // XXX "Lato Light";
@sans_lt_italic:    "Lato Italic"; // XXX "Lato Light Italic";
@sans:              "Lato Regular";
@sans_italic:       "Lato Italic";
@sans_bold:         "Lato Bold";
@sans_bold_italic:  "Lato Bold Italic";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 2; // XXX

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #fafaea; // XXX
@water:             #001133; // XXX
@grass:             @land; // XXX
@beach:             @land; // XXX
@park:              @grass;  // #DAF2C1;
@cemetery:          @park;   // #D6DED2;
@wooded:            @park;   // darken(@park, 5%); // #C3D9AD;
@agriculture:       @beach;  // #F2E8B6;

@building:          #444455; // XXX;
@landuse_basic:     desaturate( darken( @land, 5% ), 20% ); // lighten( @building, 10% );

@hospital:          @landuse_basic; // rgb(229,198,195);
@school:            @landuse_basic; // #FFF5CC;
@sports:            @grass; // #B8E6B8;

@residential:       @landuse_basic; // @land * 0.98;
@commercial:        @landuse_basic; // @land * 0.97;
@industrial:        @landuse_basic; // @land * 0.96;

@pedestrian_area:   #fff;

@parking:           #fff; // This should be same as @standard_fill

// Use for the coastline shadow effect
// XXX Converted to multiple outlines
@coastline-shadow:  #fff;
@coastline-shadow-line-width: 1;
@coastline-shadow-gap-width: 7;

/* ================================================================== */
/* GENERAL USE
/* ================================================================== */

@standard_fill:     #fff; // XXX
@standard_line:     #000; // XXX
@standard_line_light: #000; // XXX
@standard_case:     #000; // XXX

@standard_line_width: 0.4;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_fill:     #fff;
@motorway_line:     @standard_line; // XXX
@motorway_case:     @standard_case; // XXX

@trunk_fill:        @motorway_fill;
@trunk_line:        @motorway_line;
@trunk_case:        @motorway_case;

@primary_fill:      @standard_fill;
@primary_line:      @standard_line_light;
@primary_case:      @standard_case;

@secondary_fill:    @standard_fill;
@secondary_line:    @standard_line_light;
@secondary_case:    @standard_case;

@pedestrian_fill:   @landuse_basic;
@pedestrian_line:   @standard_line;
@pedestrian_case:   @standard_line_light;

@cycle_fill:        @landuse_basic;
@cycle_line:        @standard_line;
@cycle_case:        @standard_line_light;

@rail_fill:         #fff;
@rail_line:         @standard_line;
@rail_case:         @land;

@subway_line:       #000; // XXX
@tram_line:         #000; // XXX


@aeroway:           @standard_line_light;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324; // XXX

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        @land; // XXX
@text_color_basic:  #000;  // XXX

@country_text:      @text_color_basic;
@country_halo:      @place_halo;

@state_text:        @text_color_basic;
@state_halo:        @place_halo;

@city_text:         @text_color_basic;
@city_halo:         @place_halo;

@town_text:         @text_color_basic;
@town_halo:         @place_halo;

@poi_text:          @text_color_basic;

@road_text:         @text_color_basic;
@road_halo:         @standard_fill;

@other_text:        @text_color_basic;
@other_halo:        @place_halo;

@locality_text:     @text_color_basic;
@locality_halo:     @land;

@housenumber_text:  #000;
@housenumber_halo:  @place_halo;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      @text_color_basic;
@village_halo:      @place_halo;

/* ================================================================== */
/* FADE OPACITIES
/* ================================================================== */

/* These are used when fading in some features */

@fade_in_opacity_1: 0.4; // XXX
@fade_in_opacity_2: 0.8; // XXX
@fade_in_opacity_3: 1;   // XXX

/* ****************************************************************** */
/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* Mapnik does not yet support character-spacing adjustments for 
   labels placed along a line. We can fake this using the replace()
   function in the text-name parameter by replacing each character
   with itself followed by one or more spaces. */


/* ================================================================== */
/* FONT SIZES
/* ================================================================== */

// Absolute
@f_xxs:    8 + @text_adjust;
@f_xs:     9 + @text_adjust;
@f_s:     10 + @text_adjust;
@f_m:     11 + @text_adjust;
// Per zoom level
@fz_9_s:   9 + @text_adjust;
@fz_9_m:   9 + @text_adjust;
@fz_9_l:  11 + @text_adjust;
@fz_10_s:  9 + @text_adjust;
@fz_10_m:  9 + @text_adjust;
@fz_10_l: 11 + @text_adjust;
@fz_11_s:  9 + @text_adjust;
@fz_11_m: 10 + @text_adjust;
@fz_11_l: 12 + @text_adjust;
@fz_12_s:  9 + @text_adjust;
@fz_12_m: 11 + @text_adjust;
@fz_12_l: 13 + @text_adjust;
@fz_13_s:  9 + @text_adjust;
@fz_13_m: 11 + @text_adjust;
@fz_13_l: 14 + @text_adjust;
@fz_14_s: 10 + @text_adjust;
@fz_14_m: 12 + @text_adjust;
@fz_14_l: 15 + @text_adjust;
@fz_15_s: 10 + @text_adjust;
@fz_15_m: 13 + @text_adjust;
@fz_15_l: 17 + @text_adjust;
@fz_16_s: 10 + @text_adjust;
@fz_16_m: 14 + @text_adjust;
@fz_16_l: 18 + @text_adjust;
@fz_17_s: 11 + @text_adjust;
@fz_17_m: 15 + @text_adjust;
@fz_17_l: 19 + @text_adjust;
@fz_18_s: 11 + @text_adjust;
@fz_18_m: 16 + @text_adjust;
@fz_18_l: 20 + @text_adjust;


/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

#place::country[type='country'][zoom>4][zoom<10] {
  text-name:'[name]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 2;
  [zoom=4] {
    text-size: @fz_9_l;
    text-wrap-width: 40;
  }
  [zoom=5] {
    text-size:@fz_9_l;
    text-wrap-width: 50;
  }
  [zoom>5] {
    text-halo-radius: 2;
  }
  [zoom=6] {
    text-size: @fz_9_l;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=7] {
    text-size: @fz_9_l;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=8] {
    text-size: @fz_9_l;
    text-character-spacing: 2;
  }
}

#place::state[type='state'][zoom>=6][zoom<=11] {
  text-name:'[name]';
  text-face-name:@sans_bold_italic;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 2;
  [zoom=7] {
    text-size: @fz_9_l;
    text-wrap-width: 40;
  }
  [zoom=8] {
    text-size: @fz_9_l;
    text-wrap-width: 50;
  }
  [zoom>9] {
    text-halo-radius: 2;
  }
  [zoom=9] {
    text-size: @fz_9_l;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=10] {
    text-size: @fz_9_l;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=11] {
    text-size: @fz_10_l;
    text-character-spacing: 2;
  }
}

/* ---- Cities ------------------------------------------------------ */

/* Cities and towns are grouped because in the Helsinki
   metropolitan area they are equally important. */

#place::city[type='city'][zoom>=9][zoom<=15],
#place::town[type='town'][zoom>=9][zoom<=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill:@city_halo;
  text-halo-radius:2;
  [zoom<=9] {
    text-size: @fz_9_l;
    text-halo-radius:2;
  }
  [zoom=10] {
    text-size: @fz_9_l;
    text-wrap-width: 60;
  }
  [zoom=11] {
    text-size: @fz_10_l;
    text-wrap-width: 70;
  }
  [zoom=12] {
    text-size: @fz_11_l;
    text-character-spacing: 1;
    text-wrap-width: 80;
  }
  [zoom=13] {
    text-size: @fz_12_l;
    text-character-spacing: 1;
    text-wrap-width: 100;
  }
  [zoom=14] {
    text-size: @fz_13_l;
    text-character-spacing: 2;
    text-wrap-width: 200;
    text-transform: uppercase;
  }
  [zoom=15] {
    text-size: @fz_14_l;
    text-character-spacing: 4;
    text-wrap-width: 300;
    text-transform: uppercase;
  }
  // Not currently shown anymore
  [zoom=16] {
    text-size: @fz_15_l;
    text-character-spacing: 6;
    text-wrap-width: 400;
    text-transform: uppercase;
  }
}

/* ---- Towns ------------------------------------------------------- */

/* These contain only Kauniainen and Kirkkonummi, which
   are grouped with cities.

#place::town[type='town'][zoom>=10][zoom<=18] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-size:9 + @text_adjust;
  text-halo-fill:@town_halo;
  text-halo-radius:1;
  text-wrap-width: 50;
  [zoom>=11] {
    text-halo-radius:2;
    text-size: 10 + @text_adjust;
  }
  [zoom>=12]{ text-size:11 + @text_adjust; }
  [zoom>=13]{
    text-size:12 + @text_adjust;
    text-line-spacing: 1;
  }
  [zoom>=14]{
    text-transform: uppercase;
    text-character-spacing: 1;
    text-line-spacing: 2;
  }
  [zoom>=15]{
    text-size:13 + @text_adjust;
    text-character-spacing: 2;
    text-line-spacing: 3;
  }
  [zoom>=16]{
    text-size:14 + @text_adjust;
    text-character-spacing: 3;
    text-line-spacing: 4;
  }
  [zoom>=16]{
    text-size:15 + @text_adjust;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  [zoom>=18]{
    text-size:16 + @text_adjust;
    text-character-spacing: 5;
    text-line-spacing: 6;
  }
}

*/

/* ---- Other small places ------------------------------------------ */

#place::small[type='village'][zoom>=14],
#place::small[type='suburb'][zoom>=14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size: @fz_13_m;
  text-character-spacing: 1;
  text-halo-fill:@other_halo;
  text-halo-radius:2;
  text-wrap-width: 30;
  text-min-distance: 50;
  [zoom>=15] {
    text-size: @fz_14_m;
    text-character-spacing: 1;
    text-wrap-width: 40;
    text-line-spacing: 1;
  }
  [zoom>=16] {
    text-size: @fz_15_m;
    text-halo-radius: 2;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-wrap-width: 60; 
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size: @fz_16_l;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
  } 
  [zoom>=18] {
    text-size: @fz_17_l;
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=19] {
    text-size: @fz_18_l;
    text-character-spacing: 4;
    text-line-spacing: 6;
  }
}

#place::small[place_group='neighbourhood'][zoom>=16],
#place::small[place_group='island'][zoom>=16],
#place::small[place_group='other'][zoom>=16] {
  text-name:'[name]';
  text-face-name:@sans_lt_italic;
  text-placement:point;
  text-fill:@locality_text;
  text-size: @fz_15_s;
  text-character-spacing: 1;
  text-halo-fill:@locality_halo;
  text-halo-radius:2;
  text-wrap-width: 30;
  text-min-distance: 50;
  [zoom>17] {
    text-size: @fz_16_s;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>18] {
    text-size: @fz_17_s;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=19] {
    text-size: @fz_18_s;
    text-character-spacing: 1;
    text-line-spacing: 4;
  }
}

// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=11][area>102400000],
  [zoom>=12][area>25600000],
  [zoom>=14][area>1600000],
  [zoom>=15][area>320000],
  [zoom>=16][area>80000],
  [zoom>=17][area>20000],
  [zoom>=18][area>5000],
  [zoom>=19][area>=0] {
    text-name: "[name]";
    text-halo-radius: 2;
    text-face-name:@sans_lt_italic;
    text-size: @fz_10_s;
    text-character-spacing: 1;
    text-wrap-width:30;
    text-fill: @locality_text;
    text-halo-fill: @locality_halo;
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=11] {
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10);
    }
    [type='golf_course'][zoom>=11] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10);
    }
    [type='cemetery'][zoom>=11] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10);
    }
    [type='hospital'][zoom>=11] {
      text-fill: @hospital * 0.6;
      text-halo-fill: lighten(@hospital, 10);
    }
    [type='college'][zoom>=11],
    [type='school'][zoom>=11],
    [type='university'][zoom>=11] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10);
    }
    [type='water'][zoom>=11] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10);
    }
    // Common text-sizes
    [zoom=11] { text-size: @fz_10_s; }
    [zoom=12] { text-size: @fz_11_s; }
    [zoom=13] { text-size: @fz_12_s; }
    [zoom=14] { text-size: @fz_13_s; }
    [zoom=15] { text-size: @fz_14_s; }
    [zoom=16] { text-size: @fz_15_s; }
    [zoom=17] { text-size: @fz_16_s; }
    [zoom=18] { text-size: @fz_17_s; }
    [zoom=19] { text-size: @fz_18_s; }
  }
  /*
  Treat all area types and sizes as equal with regard to label sizes
  [zoom=16][area>1600000],
  [zoom=17][area>80000],
  [zoom=18][area>20000],
  [zoom=19][area>5000] {
    text-name: "[name]";
    text-size: @fz_15_s;
    text-wrap-width: 60;
    text-character-spacing: 1;
    text-halo-radius: 2;
  }
  [zoom=17][area>1600000],
  [zoom=18][area>80000],
  [zoom=19][area>20000] {
    text-size: @fz_16_s;
    text-character-spacing: 2;
    text-wrap-width: 120;
  }
  [zoom>=18][area>1600000],
  [zoom>=19][area>80000] {
    text-size: @fz_17_s;
    text-character-spacing: 3;
    text-wrap-width: 180;
  }
  */
}

/* Not currently included */
/*
#poi[type='university'][zoom>=16],
#poi[type='hospital'][zoom>=17],
#poi[type='school'][zoom>=18],
#poi[type='library'][zoom>=18] {
  text-name:"[name]";
  text-face-name:@sans;
  text-size:10 + @text_adjust;
  text-wrap-width:30;
  text-fill: @poi_text;
}
*/

/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=14],
#waterway_label[type='canal'][zoom>=16],
#waterway_label[type='stream'][zoom>=18] {
  text-name: '[name]';
  text-face-name: @sans_lt_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 2;
  text-placement: line;
  text-min-distance: 400;
  text-size: @fz_13_s;
  [type='river'][zoom=15],
  [type='canal'][zoom=17],
  [type='stream'][zoom=19] {
    text-name: "[name].replace('([\S\ ])','$1 ')";
  }
  [type='river'][zoom=16],
  [type='canal'][zoom=18] {
    text-size: @fz_15_s;
    text-name: "[name].replace('([\S\ ])','$1 ')";
  }
  [type='river'][zoom>=17],
  [type='canal'][zoom=19] {
    text-size: @fz_17_s;
    text-name: "[name].replace('([\S\ ])','$1 ')";
    text-spacing: 300;
  }
  // Common text-sizes
  [zoom=14] { text-size: @fz_13_s; }
  [zoom=15] { text-size: @fz_14_s; }
  [zoom=16] { text-size: @fz_15_s; }
  [zoom=17] { text-size: @fz_16_s; }
  [zoom=18] { text-size: @fz_17_s; }
  [zoom=19] { text-size: @fz_18_s; }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

/* No shields
#motorway_label[zoom>=12][zoom<=15][reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #fff;
  shield-file: url(img/shield-motorway-1.png);
  [type='motorway'] {
    [reflen=1] { shield-file: url(img/shield-motorway-1.png); }
    [reflen=2] { shield-file: url(img/shield-motorway-2.png); }
    [reflen=3] { shield-file: url(img/shield-motorway-3.png); }
    [reflen=4] { shield-file: url(img/shield-motorway-4.png); }
    [reflen=5] { shield-file: url(img/shield-motorway-5.png); }
    [reflen=6] { shield-file: url(img/shield-motorway-6.png); }
    [reflen=7] { shield-file: url(img/shield-motorway-7.png); }
    [reflen=8] { shield-file: url(img/shield-motorway-8.png); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(img/shield-trunk-1.png); }
    [reflen=2] { shield-file: url(img/shield-trunk-2.png); }
    [reflen=3] { shield-file: url(img/shield-trunk-3.png); }
    [reflen=4] { shield-file: url(img/shield-trunk-4.png); }
    [reflen=5] { shield-file: url(img/shield-trunk-5.png); }
    [reflen=6] { shield-file: url(img/shield-trunk-6.png); }
    [reflen=7] { shield-file: url(img/shield-trunk-7.png); }
    [reflen=8] { shield-file: url(img/shield-trunk-8.png); }
  }
  [zoom=12] { shield-min-distance: 60; } //50
  [zoom=13] { shield-min-distance: 80; } //60
  [zoom=14] { shield-min-distance: 120; } //120
  [zoom=15] { shield-min-distance: 180; }
}
*/

#motorway_label[type='motorway'][zoom>10],
#motorway_label[type='trunk'][zoom>10],
#mainroad_label[type='primary'][zoom>13],
#mainroad_label[type='secondary'][zoom>14],
#mainroad_label[type='tertiary'][zoom>14],
#minorroad_label[zoom>15] {
  text-name: "[name].replace('([\S\ ])','$1 ')"; // text-name:'[name]';
  text-face-name:@sans_lt;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:2; // XXX
  text-min-distance:60;
  text-size: @fz_9_s;
  // Common text-sizes
  [zoom=11] { text-size: @fz_10_s; }
  [zoom=12] { text-size: @fz_11_s; }
  [zoom=13] { text-size: @fz_12_s; }
  [zoom=14] { text-size: @fz_13_s; }
  [zoom=15] { text-size: @fz_14_s; }
  [zoom=16] { text-size: @fz_15_s; }
  [zoom=17] { text-size: @fz_16_s; }
  [zoom=18] { text-size: @fz_17_s; }
  [zoom=19] { text-size: @fz_18_s; }
}
// Minimum distances for motorways
#motorway_label[type='motorway'][zoom>10],
#motorway_label[type='trunk'][zoom>10] {
  [zoom=11] { text-min-distance:90; }
  [zoom=12] { text-min-distance:110; }
  [zoom=13] { text-min-distance:130; }
  [zoom=14] { text-min-distance:150; }
}


/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

#motorway_label[oneway!=0][zoom>=17],
#mainroad_label[oneway!=0][zoom>=17],
#minorroad_label[oneway!=0][zoom>=17] {
  marker-placement:line;
  marker-max-error: 0.5;
  marker-spacing: 200;
  marker-file: url(img/icon/oneway.svg);
  [oneway=-1] { marker-file: url(img/icon/oneway-reverse.svg); }
  [zoom=17] { marker-transform: "scale(0.5)"; }
  [zoom=18] { marker-transform: "scale(0.75)"; }
}


/* ================================================================== */
/* HOUSENUMBERS
/* ================================================================== */

// XXX Start later
#housenumbers[zoom>17]{
  text-name:'[housenumber]';
  text-face-name:@sans_lt;
  text-placement:point;
  text-fill:@housenumber_text;
  text-halo-fill: @housenumber_halo;
  text-halo-radius: 2; // XXX
  text-size: @f_xxs;
  text-transform: uppercase;
  text-allow-overlap: false;
  text-min-distance: 20;
  [zoom=18] {
    text-size: @f_xs;
  	text-min-distance: 10;
  }
  [zoom>18] {
    text-size: @f_s;
  	text-min-distance: 10;
  }
}


/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom>=6][zoom<=9] {
  [type='motorway'] { line-color: @motorway_line; }
  [type='trunk'] { line-color: @trunk_line; }
  [zoom=6] {
    [type='motorway'] { line-width: 0.4; }
    [type='trunk'] { line-width: 0.2; } }
  [zoom=7] {
    [type='motorway'] { line-width: 0.5; }
    [type='trunk'] { line-width: 0.25; } }
  [zoom=8] {
    [type='motorway'] { line-width: 0.6; }
    [type='trunk'] { line-width: 0.3; } }
  [zoom=9] {
    [type='motorway'] { line-width: 1; }
    [type='trunk'] { line-width: 0.5; } 
    [type='rail'] {
      line-width: 0.25;
      line-color: @rail_line;
    }
  }
}

/* At mid-level scales start to show primary and secondary routes
as well. */

#roads_med[zoom>=10][zoom<=11] {
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; }
  [type='secondary'] { line-color: @secondary_line; }
  [type='tertiary'] { line-color: @standard_line; }
  [zoom=10] {
    [type='motorway'],[type='trunk'] { line-width: 1.4; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.2; }
  }
  [zoom=11] {
    [type='motorway'],[type='trunk'] { line-width: 1.8; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.4; }
  }
  [type='rail'] { 
    line-width: 0.4;
    line-color: @rail_line;
  }
}

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */

// XXX All widths changed

@rdz11_maj: 1.6; @rdz11_med: 0.4; @rdz11_min: 0.2;
@rdz12_maj: 2;   @rdz12_med: 0.6; @rdz12_min: 0.4;
@rdz13_maj: 2.8; @rdz13_med: 1.6; @rdz13_min: 0.4;
@rdz14_maj: 3.6; @rdz14_med: 2.8; @rdz14_min: 1.6;
@rdz15_maj: 6;   @rdz15_med: 4;   @rdz15_min: 2;

@rdz16_maj: 10;   @rdz16_med: 8;   @rdz16_min: 6;

@rdz17_maj: 16;  @rdz17_med: 14;  @rdz17_min: 12;
@rdz18_maj: 23;  @rdz18_med: 19;  @rdz18_min: 16;

@rd_ol_wd: 2*@standard_line_width; // Fill + this is the outline value
@rd_ol_wd_2: @rd_ol_wd;
@rd_ol_wd_3: @rd_ol_wd_2;
@rd_ol_wd_4: @rd_ol_wd_3;

/* Original values
@rdz11_maj: 1.6; @rdz11_med: 0.8; @rdz11_min: 0.4;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 4;   @rdz14_med: 2.5; @rdz14_min: 1.6;
@rdz15_maj: 6;   @rdz15_med: 4;   @rdz15_min: 2;
@rdz16_maj: 8;   @rdz16_med: 6;   @rdz16_min: 4;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;
*/

/* ---- Casing ----------------------------------------------- */

#roads_high::outline[zoom>=12][zoom<=21],
#tunnel[render='1_outline'][zoom>=12][zoom<=21],
#bridge[render='1_outline'][zoom>=12][zoom<=21]{
  /* -- colors & styles -- */
  line-cap: round;
  [bridge=1],
  [tunnel=1] {
      line-cap: butt;
  }
  line-join: round;
  line-color: @standard_case;
  // Hide unused
  [stylegroup='disused'],[stylegroup='other'] {
    line-opacity: 0;
  }
  [stylegroup='service'] {
    line-opacity: 0;
  }
  [bridge=1] { line-color: @standard_case * 0.8; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case * 0.8; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case * 0.8; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case * 0.8; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [stylegroup='noauto'],[type='platform'] {
    line-color: @pedestrian_case;
  }
  [tunnel=1] { line-dasharray: 3,3; }        
  /* -- widths -- */
  [stylegroup='railway'] {
    line-width: 0;
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + @rd_ol_wd; }
    [stylegroup='mainroad'] { line-width: @rdz11_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + @rd_ol_wd; }
    [stylegroup='mainroad'] { line-width: @rdz12_med; }
    [stylegroup='minorroad']{
      line-width: 0;
      [type='tertiary'],
      [type='secondary_link'] { line-width: @rdz12_min; }
    }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + @rd_ol_wd; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + @rd_ol_wd; }
    [stylegroup='minorroad']{ 
      line-width: @rdz13_min;
      line-opacity: @fade_in_opacity_3;
      [type='tertiary'],
      [type='secondary_link'] { line-opacity: 1; }
    }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz14_maj + @rd_ol_wd; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + @rd_ol_wd; }
    [stylegroup='minorroad']{
      line-width: @rdz13_min; // NB. Using the value from zoom 13
      [type='tertiary'],
      [type='secondary_link'] { line-width: @rdz14_min + @rd_ol_wd; }
    }
    /* No minor bridges yet */
    [stylegroup='noauto']   {
      line-width: 0;
    }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + @rd_ol_wd_2; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + @rd_ol_wd; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + @rd_ol_wd; }
    [stylegroup='service']  { line-width: @rdz15_min / 3 + @rd_ol_wd; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + @rd_ol_wd_2; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + @rd_ol_wd_2; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + @rd_ol_wd; }
    [stylegroup='service']  { line-width: @rdz16_min / 3 + @rd_ol_wd; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=18] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + @rd_ol_wd_3; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + @rd_ol_wd_2; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + @rd_ol_wd; }
    [stylegroup='service']  { line-width: @rdz17_min / 3 + @rd_ol_wd; }
    [stylegroup='noauto']   { line-width: 0; } // XXX
  }
  [zoom>=19] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + @rd_ol_wd_4; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + @rd_ol_wd_4; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + @rd_ol_wd_3; }
    [stylegroup='service']  { line-width: @rdz18_min / 2 + @rd_ol_wd_3; }
    [stylegroup='noauto']   { line-width: 0; } // XXX
  }
}


#roads_high[zoom>=12][zoom<=21],
#tunnel[render='3_inline'][zoom>=12][zoom<=21],
#bridge[render='3_inline'][zoom>=12][zoom<=21]{
  /* -- colors & styles -- */
  line-color: @standard_fill;
  line-width: 0;
  [stylegroup='disused'],[stylegroup='other'] {
    line-opacity: 0;
  }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    [tunnel=1] { line-color: lighten(@motorway_fill, 10%); }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { line-color: lighten(@trunk_fill, 10%); }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { line-color: lighten(@primary_fill, 10%); }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    [tunnel=1] { line-color: lighten(@secondary_fill, 10%); }
  }
  [stylegroup='railway'] {
    [type='subway'] {
      line-color: @subway_line;
      [zoom=12]{ line-width:0.6; }
      [zoom=13]{ line-width:0.7; }
      [zoom=14]{ line-width:0.8; }
      [zoom=15]{ line-width:0.9; }
      [zoom>=16]{ line-width:1; }
      [zoom=17]{ line-opacity: @fade_in_opacity_2; }
      [zoom>=18]{ line-opacity:0; }
    }
    // This ensures that tram lines are not drawn beneath
    // streets
    ::trams_on_top[type='tram'][zoom>=16] {
      line-color: @tram_line;
      // XXX line-comp-op: multiply;
      [zoom=16]{ line-width:0.4; }
      [zoom>=17]{ line-width:0.8; }
    }
    [type='rail'] {
      line-color: @rail_line;
      line-dasharray: 1,1;
      [zoom=12]{ line-width:@rdz11_min; }
      [zoom=13]{ line-width:@rdz12_min; }
      [zoom=14]{ line-width:@rdz13_min; }
      [zoom=15]{ line-width:@rdz14_min; }
      [zoom>16]{ line-dasharray: 1,2; }
      [zoom=16]{ line-width:@rdz15_min; }
      [zoom=17]{ line-width:@rdz16_min; }
      [zoom=18]{ line-width:@rdz17_min; }
      [zoom>18]{ line-width:@rdz18_min; }
    }
  }
  /*
  [stylegroup='noauto'],
  [stylegroup='service'],
  [stylegroup='minorroad'] {
    line-width: 0;
  }
  */
  [stylegroup='service'] {
    line-opacity: 0;
  }
  
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='noauto'],[type='platform'] {
    line-join: round;
    line-color: @pedestrian_fill;
  }
  [tunnel=1] {
    line-cap: butt;
    line-dasharray: 3,3;
  }
  /* -- widths -- */
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz11_maj; }
    [stylegroup='mainroad'] { line-width: 0; }
    [stylegroup='minorroad']{ line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz12_maj; }
    [stylegroup='mainroad'] { line-width: 0; }
    [stylegroup='minorroad']{ line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='mainroad'] { line-width: @rdz13_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: @rdz14_med; }
    [stylegroup='minorroad']{
      line-width: 0;
      [type='tertiary'],
      [type='secondary_link'] { line-width: @rdz14_min; }
    }
    [stylegroup='service']  { line-width: @rdz14_min / 3; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']  { line-width: @rdz15_min / 3; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='service']  { line-width: @rdz16_min / 3; }
    [stylegroup='noauto']   { line-width: 0; }
  }
  [zoom=18] {
    [stylegroup='motorway'] { line-width: @rdz17_maj; }
    [stylegroup='mainroad'] { line-width: @rdz17_med; }
    [stylegroup='minorroad']{ line-width: @rdz17_min; }
    [stylegroup='service']  { line-width: @rdz17_min / 3; }
    [stylegroup='noauto']   { line-width: 0; } // XXX
  }
  [zoom>=19] {
    [stylegroup='motorway'] { line-width: @rdz18_maj; }
    [stylegroup='mainroad'] { line-width: @rdz18_med; }
    [stylegroup='minorroad']{ line-width: @rdz18_min; }
    [stylegroup='service']  { line-width: @rdz18_min / 2; }
    [stylegroup='noauto']   { line-width: 0; } // XXX
  }
}

/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'][zoom>=15][zoom<=21],
#bridge[render='2_line'][zoom>=15][zoom<=21]{
  /* -- colors & styles -- */
  [stylegroup='noauto'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @land;
    line-join: round;
    [zoom=17][type='subway'] { line-opacity: @fade_in_opacity_2; }
    [zoom>=18][type='subway'] { line-opacity:0; }
  }
  /* -- widths -- */
  [zoom=15] {
    [stylegroup='noauto']   { line-width: @rdz14_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1 + 1; }
  }
  [zoom=16] {
    [stylegroup='noauto']   { line-width: @rdz15_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1.5 + 1; }
  }
  [zoom=17] {
    [stylegroup='noauto']   { line-width: @rdz16_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 2 + 1; }
  }
  [zoom=18] {
    [stylegroup='noauto']   { line-width: @rdz17_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 3 + 2; }
  }
  [zoom>=19] {
    [stylegroup='noauto']   { line-width: @rdz18_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 4 + 3; }
  }
}

/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=15] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=15] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom=15] { marker-width:@rdz14_min * 1.1; }
  [zoom=16] { marker-width:@rdz15_min * 1.1; }
  [zoom=17] { marker-width:@rdz16_min * 1.1; }
  [zoom=18] { marker-width:@rdz17_min * 1.1; }
  [zoom>=19] { marker-width:@rdz18_min * 1.1; }
}



/* Pedestrian and other noauto dashed lines */

// XXX Added new underlay
#roads_high::noauto_linefill[stylegroup='noauto'][zoom>=18] {
  line-join: round;
  line-color: @land;
  [zoom=18] {
    [stylegroup='noauto']   { line-width: 4.5; // XXX
    }
  }
  [zoom>=19] {
    [stylegroup='noauto']   { line-width: 4.5; // XXX
    }
  }
}


// XXX Removed from lower zoom levels
#roads_high::noauto_outline[stylegroup='noauto'][zoom>=18] {
  line-join: round;
  line-color: @pedestrian_case;
  line-dasharray: 1,2;
  [zoom=18] {
    [stylegroup='noauto']   { line-width: 1.5; // XXX
    }
  }
  [zoom>=19] {
    [stylegroup='noauto']   { line-width: 1.5; // XXX
    }
  }
}

#roads_high::noauto[stylegroup='noauto'][zoom>=16] {
  /*
  line-join: round;
  line-color: @pedestrian_fill;
  [zoom=16] {
    [stylegroup='noauto']   { line-width: 0; // @rdz15_min / 2;
    }
  }
  [zoom=17] {
    [stylegroup='noauto']   { line-width: 0; // @rdz16_min / 2;
    }
  }
  [zoom=18] {
    [stylegroup='noauto']   { line-width: @rdz17_min / 4; }
  }
  [zoom>=19] {
    [stylegroup='noauto']   { line-width: @rdz18_min / 4; }
  }
  */
}


/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>10] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=11]{ line-width:1; }
    [zoom=12]{ line-width:2; }
    [zoom=13]{ line-width:3; }
    [zoom=14]{ line-width:5; }
    [zoom=15]{ line-width:7; }
    [zoom=16]{ line-width:11; }
    [zoom=17]{ line-width:15; }
    [zoom=18]{ line-width:19; }
    [zoom>18]{ line-width:23; }
  }
  [type='taxiway'] {
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:0.2; }
    [zoom=14]{ line-width:1; }
    [zoom=15]{ line-width:1.5; }
    [zoom=16]{ line-width:2; }
    [zoom=17]{ line-width:3; }
    [zoom=18]{ line-width:4; }
    [zoom>18]{ line-width:5; }
  }
}

/******************************************************************* */

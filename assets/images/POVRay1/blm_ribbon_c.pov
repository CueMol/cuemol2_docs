/*
  POV-Ray output from CueMol (Version 1.0.0  Build 58)
 */

#version 3.5;
#include "materials.inc"

background {color rgb <1,1,1>}

#declare _distance = 115.274632;
#declare _stereo = 0;
#declare _perspective = 1;

camera {
 #if (_perspective)
 perspective
 direction <0,0,-1>
 up <0,1,0>
 right <1,0,0>
 angle 25.0000
 location <_stereo*_distance*0.05,0,_distance>
 look_at <0,0,0>
 #else
 orthographic
 direction <0,0,-1>
 up <0,_distance/2.2,0>
 right <_distance/2.2,0,0>
 location <_stereo*_distance*0.05,0,_distance>
 look_at <0,0,0>
 #end
}

light_source {<_stereo*_distance*0.05,0,_distance> color rgb <1,1,1>}
light_source {<-1,1,1>*_distance color rgb 0.7 shadowless}

/////////////////////////////////////////////

// rendering properties for _blm_ab_p
#declare _blm_ab_p_tex = tex_of_hsc
#declare _blm_ab_p_col0 = <0.501961,1.000000,1.000000,0.000000>;
#declare _blm_ab_p_col1 = <0.501961,1.000000,0.749020,0.000000>;
#declare _blm_ab_p_col2 = <0.501961,0.749020,1.000000,0.000000>;
#declare _blm_ab_p_col3 = <1.000000,0.501961,0.501961,0.000000>;
#declare _blm_ab_p_col4 = <1.000000,0.501961,0.749020,0.000000>;
#declare _blm_ab_p_col5 = <1.000000,0.749020,0.501961,0.000000>;


// rendering properties for _blm_ab_blm
#declare _blm_ab_blm_tex = tex_of_resid
#declare _blm_ab_blm_lw = 1.00;
#declare _blm_ab_blm_col0 = <1.000000,1.000000,0.749020,0.000000>;
#declare _blm_ab_blm_col1 = <1.000000,0.000000,0.000000,0.000000>;
#declare _blm_ab_blm_col2 = <0.000000,0.000000,1.000000,0.000000>;
#declare _blm_ab_blm_col3 = <0.000000,1.000000,0.000000,0.000000>;


#declare _scene = #include "blm_ribbon.inc"
object{
  _scene
}

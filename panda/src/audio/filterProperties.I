// Filename: filterProperties.I
// Created by: jyelon (01Aug2007)
//
////////////////////////////////////////////////////////////////////
//
// PANDA 3D SOFTWARE
// Copyright (c) Carnegie Mellon University.  All rights reserved.
//
// All use of this software is subject to the terms of the revised BSD
// license.  You should have received a copy of this license along
// with this source code in a file named "LICENSE."
//
////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::clear
//      Access: Published
// Description: Removes all DSP postprocessing.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
clear() {
  _config.clear();
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::apply_lowpass
//      Access: Published
// Description: Add a lowpass filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_lowpass(PN_stdfloat cutoff_freq, PN_stdfloat resonance_q) {
  add_filter(FT_lowpass, cutoff_freq, resonance_q);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_highpass
//      Access: Published
// Description: Add a highpass filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_highpass(PN_stdfloat cutoff_freq, PN_stdfloat resonance_q) {
  add_filter(FT_highpass, cutoff_freq, resonance_q);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_echo
//      Access: Published
// Description: Add a echo filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_echo(PN_stdfloat drymix, PN_stdfloat wetmix, PN_stdfloat delay, PN_stdfloat decayratio) {
  add_filter(FT_echo, drymix, wetmix, delay, decayratio);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_flange
//      Access: Published
// Description: Add a flange filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_flange(PN_stdfloat drymix, PN_stdfloat wetmix, PN_stdfloat depth, PN_stdfloat rate) {
  add_filter(FT_flange, drymix, wetmix, depth, rate);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_distort
//      Access: Published
// Description: Add a distort filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_distort(PN_stdfloat level) {
  add_filter(FT_distort, level);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_normalize
//      Access: Published
// Description: Add a normalize filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_normalize(PN_stdfloat fadetime, PN_stdfloat threshold, PN_stdfloat maxamp) {
  add_filter(FT_normalize, fadetime, threshold, maxamp);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_parameq
//      Access: Published
// Description: Add a parameq filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_parameq(PN_stdfloat center_freq, PN_stdfloat bandwidth, PN_stdfloat gain) {
  add_filter(FT_parameq, center_freq, bandwidth, gain);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_pitchshift
//      Access: Published
// Description: Add a pitchshift filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_pitchshift(PN_stdfloat pitch, PN_stdfloat fftsize, PN_stdfloat overlap) {
  add_filter(FT_pitchshift, pitch, fftsize, overlap);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_chorus
//      Access: Published
// Description: Add a chorus filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_chorus(PN_stdfloat drymix, PN_stdfloat wet1, PN_stdfloat wet2, PN_stdfloat wet3, PN_stdfloat delay, PN_stdfloat rate, PN_stdfloat depth) {
  add_filter(FT_chorus, drymix, wet1, wet2, wet3, delay, rate, depth);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_sfxreverb
//      Access: Published
// Description: Add a reverb filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_sfxreverb(PN_stdfloat drylevel, PN_stdfloat room, PN_stdfloat roomhf, PN_stdfloat decaytime,
  	          PN_stdfloat decayhfratio, PN_stdfloat reflectionslevel, PN_stdfloat reflectionsdelay,
  	          PN_stdfloat reverblevel, PN_stdfloat reverbdelay, PN_stdfloat diffusion,
  	          PN_stdfloat density, PN_stdfloat hfreference, PN_stdfloat roomlf, PN_stdfloat lfreference) {
  add_filter(FT_sfxreverb, drylevel, room, roomhf, decaytime, decayhfratio, reflectionslevel, reflectionsdelay,
  	                       reverblevel, reverbdelay, diffusion, density, hfreference, roomlf, lfreference);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::add_compress
//      Access: Published
// Description: Add a compress filter to the end of the DSP chain.
////////////////////////////////////////////////////////////////////
INLINE void FilterProperties::
add_compress(PN_stdfloat threshold, PN_stdfloat attack, PN_stdfloat release, PN_stdfloat gainmakeup) {
  add_filter(FT_compress, threshold, attack, release, gainmakeup);
}

////////////////////////////////////////////////////////////////////
//    Function: FilterProperties::get_config
//      Access: Published
// Description: Intended for use by AudioManager and AudioSound
//              implementations: allows access to the config vector.
////////////////////////////////////////////////////////////////////
INLINE const FilterProperties::ConfigVector &FilterProperties::
get_config() {
  return _config;
}



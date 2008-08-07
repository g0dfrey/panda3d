// Filename: scissorAttrib.h
// Created by:  drose (29Jul08)
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

#ifndef SCISSORATTRIB_H
#define SCISSORATTRIB_H

#include "pandabase.h"

#include "renderAttrib.h"
#include "luse.h"

class FactoryParams;

////////////////////////////////////////////////////////////////////
//       Class : ScissorAttrib
// Description : This restricts rendering to within a rectangular
//               region of the scene, without otherwise affecting the
//               viewport or lens properties.  Geometry that falls
//               outside the scissor region is not rendered.  It is
//               akin to the OpenGL glScissor() function.
//
//               The ScissorAttrib always specifies its region
//               relative to its enclosing DisplayRegion, in screen
//               space, and performs no culling.
//
//               See ScissorEffect if you wish to define a
//               region relative to 2-D or 3-D coordinates in the
//               scene graph, with culling.
////////////////////////////////////////////////////////////////////
class EXPCL_PANDA_PGRAPH ScissorAttrib : public RenderAttrib {
private:
  ScissorAttrib(const LVecBase4f &frame);

PUBLISHED:
  static CPT(RenderAttrib) make_off();
  INLINE static CPT(RenderAttrib) make(float left, float right, float bottom, float top);
  static CPT(RenderAttrib) make(const LVecBase4f &frame);

  INLINE const LVecBase4f &get_frame() const;

public:
  virtual void output(ostream &out) const;
  virtual void store_into_slot(AttribSlots *slots) const;

protected:
  virtual int compare_to_impl(const RenderAttrib *other) const;
  virtual CPT(RenderAttrib) compose_impl(const RenderAttrib *other) const;
  virtual RenderAttrib *make_default_impl() const;

private:
  LVecBase4f _frame;
  static CPT(RenderAttrib) _off;

public:
  static void register_with_read_factory();
  virtual void write_datagram(BamWriter *manager, Datagram &dg);

protected:
  static TypedWritable *make_from_bam(const FactoryParams &params);
  void fillin(DatagramIterator &scan, BamReader *manager);
  
public:
  static TypeHandle get_class_type() {
    return _type_handle;
  }
  static void init_type() {
    RenderAttrib::init_type();
    register_type(_type_handle, "ScissorAttrib",
                  RenderAttrib::get_class_type());
  }
  virtual TypeHandle get_type() const {
    return get_class_type();
  }
  virtual TypeHandle force_init_type() {init_type(); return get_class_type();}

private:
  static TypeHandle _type_handle;
};

#include "scissorAttrib.I"

#endif

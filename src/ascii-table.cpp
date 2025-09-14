////////////////////////////////////////////////////////////////////////////////
// Name:      ascii-table.cpp
// Purpose:   Implementation of decorated_frame class
// Author:    Anton van Wezenbeek
// Copyright: (c) 2022-2025 Anton van Wezenbeek
////////////////////////////////////////////////////////////////////////////////

#include "decorated-frame.h"

void decorated_frame::build_ascii_table()
{
  auto* stc = dynamic_cast<wex::stc*>(
    open_file(wex::path("Ascii table"), wex::data::stc()));

  // Do not show an edge, eol whitespace for ascii table.
  stc->SetEdgeMode(wxSTC_EDGE_NONE);
  stc->SetViewEOL(false);
  stc->SetViewWhiteSpace(wxSTC_WS_INVISIBLE);
  stc->SetTabWidth(5);
  stc->SetUseTabs(true);

  for (int i = 1; i <= 255; i++)
  {
    switch (i)
    {
      case '\n':
        stc->add_text(std::format("{:3}\tLF", i));
        break;

      case WXK_RETURN:
        stc->add_text(std::format("{:3}\tCR", i));
        break;

      case WXK_SPACE:
        stc->add_text(std::format("{:3}\t' '", i));
        break;

      case WXK_TAB:
        stc->add_text(std::format("{:3}\tTAB", i));
        break;

      default:
        stc->add_text(std::format("{:3}\t{}", i, (char)i));
    }

    stc->add_text((i % 5 == 0) ? stc->eol() : "\t");
  }

  stc->EmptyUndoBuffer();
  stc->SetSavePoint();
  stc->SetReadOnly(true);
}

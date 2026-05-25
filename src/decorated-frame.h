////////////////////////////////////////////////////////////////////////////////
// Name:      decorated-frame.h
// Purpose:   Declaration of decorated_frame class
// Author:    Anton van Wezenbeek
// Copyright: (c) 2021-2026 Anton van Wezenbeek
////////////////////////////////////////////////////////////////////////////////

#pragma once

#include <wex/wex.h>
#include <wx/stc/minimap.h>

class app;
class editors;

class decorated_frame : public wex::del::frame
{
public:
  decorated_frame(app* app);

  wex::del::dirctrl* dirctrl() { return m_dirctrl; };

protected:
  void add_pane_history();
  void add_pane_minimap();
  void update_minimap(wex::stc* stc);

  app*     m_app;
  editors* m_editors{nullptr};

  wex::del::dirctrl*  m_dirctrl{nullptr};
  wex::del::listview* m_history{nullptr};
  wex::notebook *     m_lists{nullptr}, *m_projects{nullptr};
  wex::process*       m_process{nullptr};

  wxStyledTextCtrlMiniMap* m_minimap{nullptr};

private:
  bool allow_close(wxWindowID id, wxWindow* page) override;
  void on_notebook(wxWindowID id, wxWindow* page) override;

  const std::string allow_move_ext() const;

  void build_ascii_table();
  void menu();

  const std::string m_project_wildcard{_("Project Files") + " (*.prj)|*.prj"};

  int m_project_id{1};

  wex::stc_entry_dialog* m_dlg{nullptr};
};

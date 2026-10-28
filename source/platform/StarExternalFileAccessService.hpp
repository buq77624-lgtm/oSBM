#pragma once

#include "StarMaybe.hpp"
#include "StarString.hpp"

namespace Star {

STAR_CLASS(ExternalFileAccessService);

class ExternalFileAccessService {
public:
  virtual ~ExternalFileAccessService() = default;

  // Returns absolute imported path in app-local storage if selection succeeds.
  virtual Maybe<String> pickPackedPak() = 0;

  // Imports one .pak mod file into app-local mods storage.
  // Returns paths that were imported.
  virtual StringList importModPakFiles() = 0;

  // Imports one unpacked mod folder into app-local mods storage.
  // Returns paths that were imported.
  virtual StringList importSingleModFolder() = 0;

  // Imports all top-level .pak files and unpacked mod folders from a selected
  // directory into app-local mods storage.
  // Returns paths that were imported.
  virtual StringList importModsDirectory() = 0;

  // Opens the app's mods folder in a native file browser if available.
  virtual bool openModsLocationInSystemBrowser() = 0;

  // Opens the app's save storage folder in a native file browser if available.
  virtual bool openSaveLocationInSystemBrowser() = 0;

  // Imports player / universe save data from a selected .zip archive.
  virtual bool importSaveZip() = 0;

  // Exports player / universe save data through the native share sheet.
  virtual bool exportSaveZip() = 0;

  // Exports logs and lightweight runtime diagnostics through the native share sheet.
  virtual bool exportDiagnostics() = 0;
};

}

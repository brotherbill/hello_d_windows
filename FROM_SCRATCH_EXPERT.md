# FROM_SCRATCH_EXPERT.md

Quick setup for D development on Windows (for experienced users):

1. Install VS Code: https://code.visualstudio.com/
2. Install DMD: https://dlang.org ("Download Windows Installer", defaults OK)
   - After clicking "Download Windows Installer", Windows may warn you that D language isn't commonly downloaded. You can safely continue with the installation.
   - If you need step-by-step instructions for handling browser or Windows download warnings, see the relevant section in FROM_SCRATCH_BEGINNER.md—even experienced developers may not have encountered these issues before.
3. Install `code-d` extension in VS Code (Ctrl+Shift+X, search "code-d").
4. Choose a dev folder (e.g., `C:\dev\d`).
5. Open VS Code terminal.
6. Clone template: `git clone https://github.com/brotherbill/hello_d_windows`
   - Do not delete or edit `hello_d_windows` (used for project scaffolding).
7. Run `setup_np_global.ps1` to globally install the `np` project generator script.
8. Create a new project: `np -name my_next_d_project -description "description here"`
9. Open the new project in VS Code, set a breakpoint in `source/app.d`, F5 to debug, F10 to step.

Full F5 debugging and VS Code Terminal integration are supported out of the box. For troubleshooting or details, see FROM_SCRATCH_BEGINNER.md.

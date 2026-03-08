# Issues in Running D Projects Directly in Windows 11

When running D projects directly in Windows 11 (without this template and setup), you may encounter the following issues:

- **No F5 Debugging:** Default D projects created with `dub init` do not support F5 debugging in VS Code out of the box.
- **Console Output and Buffering:** In D, `write("I'm hiding");` sends output to the console immediately, without buffering. This means output may appear in the VS Code Terminal sooner than expected, which can complicate debugging or interactive programs.
- **std.random Issues:** On Windows, the D standard library's `std.random` will not correctly link into your program, preventing compilation.
- **Dub/Build Quirks:** Sometimes, `dub` or DMD may not pick up changes to dependencies or configuration files until you clean the build artifacts. Use the provided `clean` task or manually delete build outputs if you encounter strange build errors.
- **Terminal/Console Differences:** Output and input behavior may differ between the VS Code Terminal, Windows Command Prompt, and PowerShell. Always test interactive programs in your target environment.
- **Path and Permission Problems:** Windows path length limits, spaces in folder names, or permission issues can cause unexpected build or runtime errors. Prefer short, simple paths without spaces for D project names.



## Alternative: Develop in Ubuntu VM

As an alternative to working directly in Windows, this course also provides instructions for setting up an Ubuntu virtual machine (VM). Developing in Linux can avoid many Windows-specific issues with D, and offers a more consistent experience for D development. Work directly inside the VM for building and running your D projects.



# Quick Reference: Creating New D Projects

## One-Time Setup
Follow FROM_SCRATCH.md to set up your environment. This will install all prerequisites and create the `hello_d_windows` project, which contains the templates and scripts for new projects.

**Note:**
- Do not edit or delete the `hello_d_windows` directory. It is required for creating new projects with `new_d_project.ps1`.

## Creating a New D Project
To create a new D project:

1. Go to the parent folder where you want your new project (e.g., `C:\dev\d`).
2. Open VS Code, open the folder containing your D project, and open the Terminal.
3. (Optional, for updates) Every month or quarter, update your setup:
   - Run: `git clone https://github.com/brotherbill/hello_d_windows`
   - Run: `setup_new_d_project_global.ps1`

4. Create your new project:
   `new_d_project -name my_next_d_project -description "description of my next d project"`
5. In VS Code, open the Explorer view (Ctrl+Shift+E), navigate to your new project folder, and select `app.d` to start editing your code.
   

For full details and troubleshooting, see FROM_SCRATCH.md.
  
 - **Garbled Unicode in VS Code Terminal:** Many Unicode characters outside the standard ASCII range may not display correctly in the VS Code Terminal on Windows. This can cause output to look garbled or unreadable when your D program prints non-ASCII characters.

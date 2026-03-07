# Issues in Running D Projects Directly in Windows 11

When running D projects directly in Windows 11 (without this template and setup), you may encounter the following issues:

- **No F5 Debugging:** Default D projects created with `dub init` do not support F5 debugging in VS Code out of the box.
- **Console Output and Buffering:** In D, `write("I'm hiding");` sends output to the console immediately, without buffering. This means output may appear in the VS Code Terminal sooner than expected, which can complicate debugging or interactive programs.
- **std.random Issues:** On Windows, the D standard library's `std.random` will not correctly link into your program, preventing compilation.
- **Dub/Build Quirks:** Sometimes, `dub` or DMD may not pick up changes to dependencies or configuration files until you clean the build artifacts. Use the provided `clean` task or manually delete build outputs if you encounter strange build errors.
- **Terminal/Console Differences:** Output and input behavior may differ between the VS Code Terminal, Windows Command Prompt, and PowerShell. Always test interactive programs in your target environment.
- **Unicode, Path, and Permission Issues:** Unicode characters beyond standard ASCII may not render correctly in the VS Code Terminal on Windows, making some program output appear garbled or unreadable. Additionally, Windows path length limits, spaces in folder names, or permission issues can cause unexpected build or runtime errors. Prefer short, simple paths without spaces for D project names.

> **Beginner Tip:** If you run into any of these issues, don't panic! Carefully reread the instructions, check for typos, and try searching for the error message online. If you're still stuck, ask a classmate, instructor, or post your question on a forum. Everyone needs help sometimes, and troubleshooting is a normal part of programming.

## Alternative: Develop in Ubuntu VM

As an alternative to working directly in Windows, this course also provides instructions for setting up an Ubuntu virtual machine (VM). Developing in Linux avoids many Windows-specific issues with D, and offers a more consistent experience for D development. Work directly inside the VM for building and running your D projects.

> **Beginner Tip:** If Windows setup feels overwhelming, using an Ubuntu VM can sometimes be easier for programming, since many tutorials and tools are designed for Linux.

# Quick Reference: Creating New D Projects

## One-Time Setup
Follow FROM_SCRATCH.md to set up your environment. This will install all prerequisites and create the `hello_d_windows` project, which contains the templates and scripts for new projects.

**Note:**
- Do not edit or delete the `hello_d_windows` directory. It is required for creating new projects with `np.ps1`.

## Creating a New D Project
To create a new D project:

1. Go to the parent folder where you want your new project (e.g., `C:\dev\d`).
   > *Beginner Tip:* You can create a new folder in File Explorer by right-clicking and choosing "New Folder."
2. Open VS Code, open the folder containing your D project, and open the Terminal.
   > *Beginner Tip:* In VS Code, click "File" > "Open Folder..." to select your project folder. To open the Terminal, click "Terminal" > "New Terminal."
3. (Optional, for updates) Every month or quarter, update your setup:
   - Run: `git clone https://github.com/brotherbill/hello_d_windows`
   - Run: `setup_np_global.ps1`
   > *Beginner Tip:* Keeping your template up to date helps avoid bugs and ensures you have the latest features.
4. Create your new project:
   `np -name my_next_d_project -description "description of my next d project"`
   > *Beginner Tip:* Replace `my_next_d_project` and the description with your own project name and a short summary.
5. In VS Code, open the Explorer view (Ctrl+Shift+E), navigate to your new project folder, and select `app.d` to start editing your code.
   > *Beginner Tip:* The Explorer is the file browser on the left side of VS Code. Double-click files to open them in the editor.
   
For full details and troubleshooting, see FROM_SCRATCH.md.

## Running a New D Project

After creating your new D project, you can run and debug it in VS Code:

1. Open your new project folder in VS Code.
   > *Beginner Tip:* Make sure you open the folder, not just a single file, so VS Code can find all your project files.
2. In the Explorer, open `source/app.d`.
   > *Beginner Tip:* If you don't see the `source` folder, make sure you are in the correct project directory.
3. Click the margin next to line 5 to set a breakpoint (a red dot will appear).
   > *Beginner Tip:* Breakpoints let you pause your program and see what it’s doing. Click the gray area to the left of the line number.
4. Press F5 to launch the project in debug mode. The program will run and pause at your breakpoint.
   > *Beginner Tip:* F5 starts or continues running your program. If you see a prompt about selecting a debugger, choose the default option.
5. Press F10 to step over the breakpoint and execute the next line (this will print "Greetings, D!" to the Terminal).
   > *Beginner Tip:* F10 steps through your code one line at a time, so you can watch what happens.
6. Press F5 again to continue running the program until it finishes.
   > *Beginner Tip:* You can set more breakpoints or use F10/F11 to step through your code as much as you like.

This workflow lets you interactively debug your D program, inspect variables, and see output in the VS Code Terminal. For more details, see FROM_SCRATCH_BEGINNER.md or FROM_SCRATCH_EXPERT.md.

> **Beginner Tip:** If you get stuck, don't give up! Programming takes practice, and every error is a chance to learn. Celebrate your progress and ask for help when you need it.
  
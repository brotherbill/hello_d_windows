> These instructions assume a fresh Windows 11 install, but they also work on systems with existing tools.

> **Beginner Tip:** If you are new to programming or Windows setup, take your time with each step. If something doesn't look right, don't worry—just double-check the instructions or ask for help. Every programmer starts as a beginner!

## Handling Download Warnings for the D Installer

> **Note:** D language is not downloaded as frequently as C, C++, or C#, so browsers and Windows may warn you about its installer. D is a safe, established language that has been around since 2007 and is widely used by developers.

When downloading the D installer, your browser or Windows may warn you that the file isn't commonly downloaded. If your download is blocked—even after following these instructions—you may need to temporarily disable your anti-virus software for 5–10 minutes (be sure to re-enable it immediately after the download completes). Here’s how to proceed safely in different browsers:

**Microsoft Edge:**  
- In the download bar or warning dialog, right-click the warning message and select "Keep" (or similar).  
- If you see a Delete button, click the dropdown arrow next to it and choose "Keep Anyway".  
- You may also need to open the Downloads list, find the blocked file, and choose "Keep" or "Recover malicious file".

**Google Chrome:**  
- In the download bar at the bottom, click the up-arrow next to the warning and select "Keep" or "Keep anyway".  
- If prompted, confirm you want to keep the file.

**Mozilla Firefox:**  
- In the download panel, click the warning icon next to the file and select "Allow Download" or "Open Containing Folder".  
- If blocked, right-click and choose "Unblock" or "Allow".

**Brave Browser:**  
- Brave may block uncommon downloads by default. Click the warning in the download bar and select "Keep" or "Allow Anyway".  
- You may need to open the Downloads panel and choose "Keep" for the blocked file.

**DuckDuckGo Browser:**  
- If a download is blocked, look for a warning or blocked download icon. Click it and select "Allow" or "Keep" if available.  
- You may need to check the Downloads list for additional unblock options.

**General:**  
- If Windows Defender SmartScreen blocks the installer, click "More info" and then "Run anyway".  
- Only proceed if you are certain the file is from the official D language website (<https://dlang.org>).

# FROM_SCRATCH_BEGINNER.md

Welcome! This guide will walk you through setting up your computer for D programming, step by step. No prior experience is required—just follow along and you'll be ready to write and debug D code in no time.

1. **Download and install Visual Studio Code:**  
   Go to <https://code.visualstudio.com/> and click the download button. Run the installer and accept all the default options.  
   
   After installing VS Code, open it and install the "C/C++" extension by Microsoft:
   - Press Ctrl+Shift+X to open Extensions.
   - In the search box, type `C/C++`.
   - Find the extension by Microsoft and click Install.

When finished, close VS Code.
   
   > *Beginner Tip:* During installation, you may check "Create a desktop icon" to make it easier to open VS Code later.  
   > *Beginner Tip:* On completing the VS Code Setup wizard, you may uncheck "Launch Visual Studio Code"—it isn't needed for the next step.  
   > *Beginner Tip:* Visual Studio Code (VS Code) is a free code editor. It's safe to install and is used by millions of developers.
2. **Download and install the DMD D compiler:**  
   Visit <https://dlang.org>, click "Download Windows Installer," and follow the prompts. During installation:
   - Accept all default options—just keep clicking Next.
   - If you see a wizard step with an "Install" button, click Install.
   - The installer will also install Visual Studio (or some of its components); you won't use Visual Studio directly, but D needs resources that come with it.
   - At the end of the D installation, you will see a final wizard step titled "Completing D Programming Language Setup." Click Finish to close the installer.
   - When you are done downloading the installer, you may close the browser page with the dlang.org website.
   > *Beginner Tip:* If you see a warning about the download, refer to the "Handling Download Warnings for the D Installer" section above for step-by-step instructions.
   > *Beginner Tip:* Once the download is complete, open the downloaded file to start the installer. Windows will likely show a dialog: "Do you want to allow this app from an unknown publisher to make changes to your device?" This is normal for D—click Yes to continue with the installation.
   > *Beginner Tip:* The DMD compiler lets your computer understand and run D programs.

   #### Installing Visual Studio 2019 (if prompted)
   If the D installer prompts you to install Visual Studio 2019:
   1. Accept all default options in the Visual Studio installer.
   2. If you see a step with an "Install" button, click Install.
   3. If you see a dialog asking "Do you want to continue without workloads?", click Continue. You do not need to select or install any workloads for D development.
   4. Wait for the installation to finish. You do not need to launch Visual Studio when done.
   5. When the Visual Studio Installer completes, you will see a window titled "Visual Studio Installer" with "Visual Studio Community 2019" displayed. Close this window by clicking the X in the title bar (top right corner).
   > *Note:* You do not need to launch Visual Studio itself—just close the installer window when finished.
   > *Note:* Installing Visual Studio may take several minutes. Please be patient while the installation completes.
3. **Install the D language extension in VS Code:**  
   Open VS Code. Press Ctrl+Shift+X to open Extensions. Search for `code-d` by WebFreak and click Install.  Close VS Code.
   > *Beginner Tip:* Extensions add new features to VS Code. `code-d` helps you write and debug D code easily.
   > *Beginner Tip:* After opening VS Code, you can optionally make it full screen (click the square icon in the top right or press F11) for a better editing experience.
   > *Beginner Tip:* In the Extensions view, type `code-d` into the textbox just below the "EXTENSIONS: MARKETPLACE" label. The first item in the list should be "D Programming Language (code-d)". Click Install next to it.
   > *Beginner Tip:* If prompted, click the "Trust Publishers & Install" button to continue installing the extension.
   > **Note:** You may see a "Reinstall serve-d" notification in VS Code. It is not needed—just close the notification.

4. **Choose where to keep your D projects:**  
   In File Explorer, create the folder path where you want to store your D projects (for example, `C:\dev\d`).  Close File Explorer.
   > *Beginner Tip:* To create a new folder, right-click and choose "New > Folder."
5. **Open the VS Code Terminal:**  
   In VS Code, click "Terminal" in the top menu."  
   > *Beginner Tip:* The terminal is where you type commands for your computer to run.
6. **Download the project template:**  
   In the terminal, type:
   `git clone https://github.com/brotherbill/hello_d_windows`
   Press Enter. This will create a folder called `hello_d_windows` in your chosen location.  
   > *Beginner Tip:* If you see a message about git not being found, you may need to install Git from <https://git-scm.com/>.
   **Do not edit or delete `hello_d_windows`—it is needed for new project creation.**
7. **Set up the project creation script:**  
   In the terminal, type:
   `setup_new_d_project_global.ps1`
   Press Enter. This makes the `new_d_project` script available everywhere on your computer.  
   > *Beginner Tip:* If you get a security warning, right-click the script, choose "Run with PowerShell," or check your PowerShell execution policy.
8. **Create your first D project:**  
   In the terminal, type:
   `new_d_project -name my_next_d_project -description "description of my next d project"`
   Press Enter. This will create a new folder for your project.
9. **Open and debug your project:**  
   In VS Code, open the new project folder. Open `source/app.d`. Click the margin next to line 5 to set a breakpoint (a red dot will appear). Press F5 to start debugging. When the program stops at the breakpoint, press F10 to step and print "Greetings, D!" to the Terminal. Press F5 again to finish running the program.  
   > *Beginner Tip:* Breakpoints let you pause your program and see what it’s doing. F5 starts or continues, F10 steps one line.

Congratulations! You are now ready to start learning and building D projects on Windows.

> **Sidebar:**  
> This method gives you full F5 debugging and uses the VS Code Terminal as your Console. It avoids manual file copying and makes new D project setup quick and reliable—just one command for a ready-to-debug project.
> 
> **Beginner Tip:** If you get stuck, try searching for the error message online, or ask a classmate or instructor for help. Everyone needs help sometimes!

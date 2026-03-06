
# FROM_SCRATCH.md

## How to Create a Fresh D Project on Windows 11 (Beginner Guide, DMD Only)

### 1. Install DMD and Dub
- Download and install the DMD compiler from [https://dlang.org/download.html](https://dlang.org/download.html).
- The installer will also set up `dub`, the D package manager and build tool.
- After installation, open a new terminal and check:
  - `dmd --version` (should print version info)
  - `dub --version` (should print version info)

### 2. Create Your Project Folder
- Open File Explorer and create the folder: `C:\dev\d\hello_d` (or your chosen location)
- Open VS Code and open this folder.

### 3. Initialize a New D Project
- Open the VS Code Terminal (View > Terminal).
- Run:
  - `dub init .`
- Accept the defaults or enter your project info when prompted.
- This creates a `source/app.d` file and a `dub.json` config file.

### 4. Edit the Main File
- Open `source/app.d` in VS Code.
- Replace its contents with:
  ```d
  import std.stdio;
  
  void main()
  {
      writeln("Greetings, D!");
  }
  ```
- Save the file.

### 5. Update dub.json for Debugging
- Open `dub.json` and add the following to ensure debug symbols:
  ```json
  "configurations": [
    {
      "name": "application",
      "targetType": "executable",
      "dflags": ["-g", "-debug"]
    }
  ]
  ```
- Save the file.

### 6. Configure VS Code for Debugging
- In the `.vscode` folder, create or update `launch.json` with:
  ```json
  {
    "version": "0.2.0",
    "configurations": [
      {
        "name": "Debug D project",
        "type": "cppvsdbg",
        "request": "launch",
        "program": "${workspaceFolder}/c00_hello_d_windows.exe",
        "args": [],
        "stopAtEntry": false,
        "cwd": "${workspaceFolder}",
        "preLaunchTask": "dub: build",
        "console": "integratedTerminal"
      },
      {
        "name": "Debug D project (Stop at entry)",
        "type": "cppvsdbg",
        "request": "launch",
        "program": "${workspaceFolder}/c00_hello_d_windows.exe",
        "args": [],
        "stopAtEntry": true,
        "cwd": "${workspaceFolder}",
        "preLaunchTask": "dub: build",
        "console": "integratedTerminal"
      }
    ]
  }
  ```
- Save the file.

### 7. Configure Build Tasks
- In the `.vscode` folder, create or update `tasks.json` with:
  ```json
  {
    "version": "2.0.0",
    "tasks": [
      {
        "label": "dub: build",
        "type": "shell",
        "command": "dub build",
        "group": {
          "kind": "build",
          "isDefault": true
        },
        "presentation": {
          "echo": true,
          "reveal": "always",
          "focus": false,
          "panel": "shared",
          "showReuseMessage": true
        },
        "problemMatcher": []
      },
      {
        "label": "dub: run (integratedTerminal)",
        "type": "shell",
        "command": "dub run",
        "group": {
          "kind": "build",
          "isDefault": true
        },
        "presentation": {
          "echo": true,
          "reveal": "always",
          "focus": true,
          "panel": "shared"
        },
        "problemMatcher": []
      },
      {
        "label": "backup: success snapshot",
        "type": "shell",
        "command": "$ts = Get-Date -Format 'yyyyMMdd_HHmmss'; $zip = '..\\${workspaceFolderBasename}_success_' + $ts + '.zip'; Compress-Archive -Path * -DestinationPath $zip -Force; Write-Host ('Backup created: ' + $zip)",
        "presentation": {
          "echo": true,
          "reveal": "always",
          "focus": false,
          "panel": "shared",
          "showReuseMessage": true
        },
        "problemMatcher": []
      }
    ]
  }
  ```
- Save the file.

### 8. Build and Run
- In the terminal, run:
  - `dub build`
  - `dub run`
- You should see output in the VS Code Terminal Pane.

### 9. Debug with F5 in VS Code
- Click Run > Start Debugging or press F5.
- If prompted, select "Debug D project".
- The program will run and output will appear in the VS Code Terminal Pane.
- You can set breakpoints and step through your code.

---

You now have a working D project that builds, runs and debugs in Windows 11 using VS Code and DMD only.
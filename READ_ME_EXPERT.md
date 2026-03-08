# D Project Quick Reference (Expert)

This guide is for experienced developers setting up D projects on Windows using this template.

## Common Windows Issues
- No F5 debugging with plain `dub init` projects; use this template for full VS Code debug support.
- Garbled Unicode in VS Code Terminal: Many Unicode characters outside the standard ASCII range may not display correctly in the VS Code Terminal on Windows. This can cause output to look garbled or unreadable when your D program prints non-ASCII characters.
- Console output is unbuffered (`write()` flushes immediately).
- `std.random` may not link on Windows; a workaround will be provided in the lesson on random numbers.
- Dub/DMD may require cleaning (`clean` task) to pick up config/dependency changes.
- Path length, spaces, and permissions can cause build/runtime errors—prefer short, simple paths.

## Linux Alternative
Consider using the provided Ubuntu VM setup for a smoother D experience.

## Project Setup
1. Install VS Code, DMD, and the `code-d` extension.
2. Clone the template: `git clone https://github.com/brotherbill/hello_d_windows`
   - Do not delete/edit `hello_d_windows` (used for scaffolding).
3. Run `setup_new_d_project_global.ps1` to install the `new_d_project` project generator.
4. Create a new project:
   `new_d_project -name my_next_d_project -description "desc"`
5. Open the new project in VS Code, set a breakpoint in `source/app.d`, F5 to debug, F10 to step.

For troubleshooting or full details, see the beginner documentation.

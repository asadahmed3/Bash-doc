<div align="center">

# 🐧 Bash Scripting & Automation

### From individual commands to reusable scripts

**Input validation · File processing · Backups · Monitoring · Troubleshooting**

Built and documented by **Asad Ahmed**

</div>

---

## 📖 About this repository

This repository documents my hands-on Bash scripting journey through practical exercises, automation scripts, and technical notes. I worked on turning repeatable tasks into scripts that accept input, make decisions, process files, and provide useful feedback.

My focus was understanding **why a script works**, recognising where it can fail, and improving its behaviour through testing and structured troubleshooting.

## 🧠 Skills covered

| Area | What I practised |
| :--- | :--- |
| **Script foundations** | Shebangs, executable permissions, and running scripts with Bash |
| **Variables & data** | Strings, numbers, arrays, variable expansion, and arithmetic |
| **Input & parameters** | `read`, positional arguments, `$#`, `"$@"`, and script names |
| **Decision-making** | `if`, `elif`, `else`, nested conditions, and logical operators |
| **Comparisons & file tests** | Numeric and string comparisons; existence, type, and permission checks |
| **Loops** | `for`, `while`, `break`, and `continue` |
| **Functions** | Reusable tasks, function arguments, local variables, and return statuses |
| **Validation** | Empty input, numeric formats, range checks, and invalid paths |
| **Error handling & debugging** | Exit statuses, `set -e`, `set -u`, and command tracing with `set -x` |
| **Files & environment** | Redirection, line-by-line reading, configuration files, and `$PATH` |
| **Documentation** | Clear usage notes and comments that explain important decisions |

## 🛠️ Script portfolio

The module included **15 practical scripting exercises**, progressing from file operations to monitoring, backup rotation, and integrated system utilities.

| # | Script | What it does |
| :---: | :--- | :--- |
| **01** | Directory & file setup | Creates `Arena`, adds three text files, and lists its contents |
| **02** | Number sequence | Prints numbers 1 through 10 using a loop |
| **03** | File existence checker | Checks for `hero.txt` and reports whether it exists |
| **04** | Text file backup | Copies `.txt` files from `Arena` into `Backup` |
| **05** | Combined file workflow | Creates files in `Battlefield`, checks for `knight.txt`, moves it into `Archive`, and lists both directories |
| **06** | File line counter | Accepts a filename as an argument, handles missing input, and reports its newline count |
| **07** | File size sorter | Lists `.txt` files in order of size, from smallest to largest |
| **08** | Multi-file log search | Searches `.log` files for a word or phrase and reports matching filenames |
| **09** | Directory change monitor | Logs file creation, modification, and deletion events with timestamps |
| **10** | Combined file processing | Creates five files with random line counts, sorts them by size, and archives files containing `Victory` |
| **11** | Disk usage report | Checks usage for a specified directory and reports whether it exceeds a threshold |
| **12** | Configuration parser | Reads `KEY=VALUE` entries and displays their keys and values |
| **13** | Backup rotation | Backs up a directory to a specified location and retains the latest **five** backups |
| **14** | Interactive system menu | Presents system tasks through a menu and runs the selected option |
| **15** | Integrated system toolkit | Combines disk checks, uptime, `Arena` backups retaining the latest **three**, and `settings.conf` parsing |

### Progression

- **Exercises 01–05:** File operations, loops, existence checks, and combined workflows.
- **Exercises 06–10:** Arguments, sorting, searching, monitoring, and multi-step file processing.
- **Exercises 11–15:** Usage reports, configuration parsing, backup retention, and interactive utilities.

## 💡 Lessons that shaped my scripts

- **Check permissions independently.** An `elif` chain stops at the first matching condition; separate checks report all three permissions.
- **Validate before calculating.** Check for empty input, confirm a numeric format, then test its range.
- **Quote paths and arguments.** Preserve filenames containing spaces and pass arguments with `"$@"`.
- **Choose input for the task.** Command-line arguments make scripts easier to reuse in automation; prompts suit interactive tasks.
- **Sort the underlying values.** Human-readable sizes such as `9K` and `2M` need different handling from raw byte counts.
- **Keep monitoring logs out of the event stream.** A monitor can repeatedly detect its own log writes.
- **Treat exit statuses as part of a function’s contract.** They let the caller decide what to do next.

> A script running successfully is only the first check. Its output and behaviour must also match the intended task.

## ▶️ Running a script

Open a terminal in the directory containing the script. Replace `script.sh` with its actual filename.

```bash
# Run explicitly with Bash
bash script.sh

# Or make it executable and run it directly
chmod +x script.sh
./script.sh
```

For scripts that accept arguments:

```bash
./script.sh "path/to/your/file.txt"
```

**Execution matters:** `bash script.sh` selects Bash directly. `./script.sh` uses the script’s shebang and requires execute permission. `sh script.sh` selects `sh`, which may not support Bash features such as arrays or `[[ ... ]]`.

### Environment notes

- Developed using **macOS, VS Code, and Bash**.
- The directory monitor requires **`fswatch`**.
- Some exercises use GNU command options that differ from the tools bundled with macOS, including `find -printf` and `find -maxdepth`. Check the script’s commands before running it on another system.
- Bash versions differ; scripts should be checked against the version available in the target environment.

## 📝 Notes & documentation

Alongside the scripts, my notes capture command behaviour, troubleshooting discoveries, and the reasoning behind important changes. The aim is to make each exercise useful to revisit and easier to extend.

<details>
<summary><strong>Topics documented throughout the module</strong></summary>

- Script setup, execution methods, shebangs, and permissions
- Variables, arrays, arithmetic, and environment variables
- User input, positional parameters, and special parameters
- Numeric comparisons, string comparisons, and file tests
- Conditional logic, loops, and loop control
- Functions, local scope, and return statuses
- Input validation, error handling, and debugging
- File processing, configuration parsing, backups, and logging
- Meaningful comments and practical troubleshooting

</details>

## 🚀 Next step: Git

With the Bash module completed, I am moving on to **Git and version control**: tracking changes, writing clear commits, understanding project history, and working with branches.

These Bash scripts and notes form a practical foundation for continued work in automation and DevOps.

---

<div align="center">

**Build. Test. Troubleshoot. Document. Improve.**

Asad Ahmed · Greater Toronto Area, Canada

</div>

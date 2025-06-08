import os
import subprocess
import sys
from pathlib import Path


def is_executable(file):
    return os.path.isfile(file) and os.access(file, os.X_OK)


def find_executables(paths, search_term):
    found = set()
    for path in paths:
        path_obj = Path(path).expanduser()
        if path_obj.is_dir():
            for item in path_obj.iterdir():
                if (
                    is_executable(item)
                    and not item.name.startswith(".")
                    and not item.is_dir()
                ):
                    if search_term.lower() in item.name.lower():
                        found.add(item.name)
                        if len(found) >= 10:
                            return list(found)
    return list(found)


def generate_buttons(executables):
    buttons = ""
    for exe in executables:
        buttons += (
            f' (button :class "item" :onclick "eww close searchapps; {exe} &" "{exe}")'
        )
    return buttons


def main():
    if len(sys.argv) < 2:
        sys.exit(1)

    search_term = sys.argv[1]
    bin_paths = [
        "~/.nix-profile/bin/",
        f"/etc/profiles/per-user/{os.environ.get('USER')}/bin/",
        "/run/current-system/sw/bin/",
    ]

    executables = find_executables(bin_paths, search_term)
    buttons = generate_buttons(executables)

    output = f'(box :orientation "v" :spacing 5 :class "apps" :halign "center" :valign "center"{buttons})\n'
    output_path = Path("~/.config/eww/scripts/search_items.txt").expanduser()
    output_path.write_text(output)

    subprocess.run(["eww", "update", f"search_listen={output}"])


if __name__ == "__main__":
    main()

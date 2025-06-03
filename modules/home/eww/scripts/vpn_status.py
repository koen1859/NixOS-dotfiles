import subprocess
import re
import json


def get_active_wg_interface():
    output = subprocess.check_output(["ip", "link"], text=True)
    interfaces = re.findall(r"^\d+: ([^:]+):", output, re.MULTILINE)
    wg_interfaces = [f"{iface}.conf" for iface in interfaces if iface.startswith("wg-")]
    return wg_interfaces[0] if wg_interfaces else ""


if __name__ == "__main__":
    print(get_active_wg_interface())

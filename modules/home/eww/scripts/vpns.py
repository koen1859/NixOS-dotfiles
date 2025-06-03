import os
import json


def print_vpn_confs():
    directory = "/home/koenstevens/.vpn/"
    confs = [f for f in os.listdir(directory) if f.endswith(".conf")]
    return json.dumps(confs)


if __name__ == "__main__":
    print(print_vpn_confs())

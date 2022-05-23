from pathlib import Path
from re import compile as re
data_path = Path(__file__).parent / "buttons.list"
with open(data_path,"r") as f:
    data = f.readlines()

has_colon = re(".*:.*").match
for ln in data:
    line = ln.strip()
    if line:
        if has_colon(line):
            name,_,cmd = line.partition(":")
        else:
            name = cmd = line
        fmt = f"""[{name}]
name={name}
full_text={name}
command=[[ -z "$BLOCK_BUTTON" ]] || i3-msg -q exec {cmd}
"""
        print(fmt)


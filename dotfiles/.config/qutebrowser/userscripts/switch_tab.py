import os
from collections import namedtuple
from subprocess import run

from yaml import load
try:
    from yaml import CLoader as Loader
except ImportError:
    from yaml import Loader


Tabs = namedtuple("Tabs", ["window_num", "tab_num", "url", "title"])


def load_yaml(filepath):
    with open(filepath, 'r') as f:
        return load(f, Loader=Loader)


def load_qute_data():
    data_dir = os.environ["QUTE_DATA_DIR"]
    return load_yaml(os.path.join(data_dir, "sessions", "switch_tab.yml"))


def get_tabs():
    data = load_qute_data()
    tabs = []
    for wid, window in enumerate(data['windows']):
        if 'active' not in window:
            continue
        for tid, tab in enumerate(window["tabs"]):
            last = tab["history"][-1]
            title = last["title"]
            url = last["url"]
            tabs.append(
                Tabs(
                    window_num=wid,
                    tab_num=tid,
                    url=url,
                    title=title,
                )
            )
    return tabs


def format_tab(tab):
    return f"{tab.url}, {tab.title}, w={tab.window_num}, t={tab.tab_num}"


def choose_tab():
    """Returns the tab number of the chosen tab"""
    tabs = get_tabs()
    input = '\n'.join([format_tab(tab) for tab in tabs]).encode('utf-8')
    p = run("dmenu -c -fn 'UbuntuMono Nerd Font:size=10' -nf '#cccccc' -nb '#292d3e' -sb '#74438e' -sf '#a5bdf7' -p \"Select tab\"", input=input, shell=True, capture_output=True)
    if p.returncode != 0:
        return None
    tab_str = p.stdout.decode('utf-8').strip()
    return parse_tab_number(tab_str)


def parse_tab_number(tab_str):
    return int(tab_str.split(', ')[-1].replace("t=", ""))


def main():
    tab_num = choose_tab()
    if tab_num is not None:
        print(f"tab-focus {tab_num + 1}")


if __name__ == "__main__":
    main()


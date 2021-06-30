#!/usr/bin/env python3
import argparse
from pydbus import SessionBus

# keyboard layouts are at ~/.local/share/squeekboard/keyboards/
# squeekboard must be started to work

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="hide and show the keyboard")
    parser.add_argument('-t', action='store_true', help="toggle keyboard")
    parser.add_argument('-s', action='store_true', help="show keyboard")
    parser.add_argument('-r', action='store_true', help="hide keyboard")
    args = parser.parse_args()

    controller = SessionBus().get('sm.puri.OSK0', '/sm/puri/OSK0')
    if   args.t: controller.SetVisible(not controller.Visible)
    elif args.s: controller.SetVisible(True)
    elif args.r: controller.SetVisible(False)

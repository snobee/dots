#!/usr/bin/env python3
import json
import subprocess
import argparse

matrix = { 0  : "  1   0  0   0   1  0",
           90 : "  0   1  0 '-1'  0  1",
           180: "'-1'  0  1   0 '-1' 1",
           270: "  0 '-1' 1   1   0  0"}

def transform(degree):
    subprocess.run(['swaymsg', 'input', '*', 'calibration_matrix'] + matrix[degree].split())
    subprocess.run(['swaymsg', 'output', '*', 'transform'] + [str(degree)])

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="rotate screen and update wayland touch")
    parser.add_argument('-t', type=int, choices=[0,90,180,270], help="degree to rotate to")
    parser.add_argument('-r', type=int, choices=[90,180,270], help="degree to rotate by")
    args = parser.parse_args()


    if args.t is not None: transform(args.t)
    else:
        outputs = subprocess.run(['swaymsg', '-t', 'get_outputs'], capture_output=True).stdout
        screen = json.loads(outputs)[0]
        current = screen['transform']

        rotation = args.r if args.r else 90
        if current == 'normal': transform(0 + rotation)
        else: transform((int(current) + rotation) % 360)

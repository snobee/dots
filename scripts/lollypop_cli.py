#!/usr/bin/env python3
import sys
import argparse
from pydbus import SessionBus

queries = ['volume', 'status', 'title', 'artist', 'albumArtist', 'album', 'genre', 'trackNumber']

def query(controller, command):
    if   command == "volume"  : return str(int(controller.Volume*100)) + "%"
    elif command == "status"  : return controller.PlaybackStatus
    elif command in ['title', 'album', 'trackNumber'] :
        return str(controller.Metadata['xesam:' + command])
    elif command in ['artist', 'albumArtist', 'genre']:
        return controller.Metadata['xesam:' + command][0]

def change_volume(controller, command, value):
    if   command == 'set'   : controller.Volume  = value
    elif command == 'add'   : controller.Volume += value
    elif command == 'remove': controller.Volume -= value

def format_query(controller, form):
    filled_queries = { q:query(controller, q) for q in queries }
    return form.format_map(filled_queries)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="interact with lollypop music player")
    parser.add_argument('-e', action='store_true', help="check if lollypop is running")
    parser.add_argument('-f', nargs=1, help="format query")
    parser.add_argument('-q', choices=queries, help="query")
    parser.add_argument('-v', nargs=2, metavar=('{set|add|remove}', 'volume'), help="change volume")
    args = parser.parse_args()

    bus = SessionBus()
    bus_clients = bus.get('.DBus').ListNames()
    if 'org.gnome.Lollypop' not in bus_clients: sys.exit(1)
    if args.e: sys.exit(0)

    controller = bus.get("org.mpris.MediaPlayer2.Lollypop", "/org/mpris/MediaPlayer2")

    if   args.q: print(query(controller, args.q))
    elif args.v: change_volume(controller, args.v[0], float(args.v[1]))
    elif args.f: print(format_query(controller, args.f[0]))

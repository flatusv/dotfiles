#!/usr/bin/env python3
#
# DESCRIPTION:
# ------------
# Don't ever switch focus to a floating mpv window.
##################################################

from i3ipc import Connection
from i3ipc import Event

from sys import argv
from itertools import cycle
from subprocess import check_output

i3 = Connection()

def on_new_window(i3, e):
    # get the current focused window
    focused = i3.get_tree().find_focused()
    # get the window class
    window_class = focused.window_class
    # is it floating?
    floating = focused.floating
    if floating == "user_on" and "mpv" in window_class:
        e.container.command("focus mode_toggle")

def get_windows_on_ws(i3):
    return filter(lambda x: x.window, i3.get_tree().find_focused().workspace().descendants())

def find_visible_windows(windows_on_workspace):
    visible_windows = []
    for w in windows_on_workspace:

        try:
            xprop = check_output(['xprop', '-id', str(w.window)]).decode()
        except FileNotFoundError:
            raise SystemExit("The `xprop` utility is not found!" " Please install it and retry.")

        if '_NET_WM_STATE_HIDDEN' not in xprop:
            visible_windows.append(w)

    return visible_windows


def focusNext(i3, e):
    # get teh current focused window
    focused = i3.get_tree().find_focused()
    # get the window class
    window_class = focused.window_class
    # is it floating?
    floating = focused.floating
    if floating == "user_on" and "mpv" in window_class:
        visible_windows = find_visible_windows(get_windows_on_ws(i3))
        cycle_windows = cycle(visible_windows)

        for window in cycle_windows:
            if window.focused:
                focus_to = next(cycle_windows)

                print(f'Switch focus to: {focus_to.name}')

                i3.command('[id="%d"] focus' % focus_to.window)
                break

i3.on(Event.WINDOW_NEW, on_new_window)
i3.on(Event.WINDOW_FOCUS, focusNext)
i3.on(Event.WORKSPACE_FOCUS, focusNext)
i3.main()

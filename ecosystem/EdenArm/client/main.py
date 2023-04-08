from coms import Coms
from curses import wrapper
import commands
from joint import Joint
import curses
import time
import json

def four_arm_control(stdscr):
    curses.start_color()
    curses.init_pair(1, curses.COLOR_BLUE, curses.COLOR_RED)
    stdscr.clear()
    stdscr.addstr(0,12,"Eden Arm 4 Motor Control")
    stdscr.refresh()
    main_arm_win = curses.newwin(10,40,2,0)
    main_arm_win.addstr(0,0,"Main Arm")
    side_arm_win = curses.newwin(10,40,2,40)
    side_arm_win.addstr(0,0,"Side Arm")
    z_rot_win = curses.newwin(10,40,12,0)
    z_rot_win.addstr(0,0,"Z Rotation")
    end_effector_win = curses.newwin(10,40,12,40)
    end_effector_win.addstr(0,0,"End Effector")
    windows = [main_arm_win, side_arm_win, z_rot_win, end_effector_win]
    selected_window_index = 0
    for window in windows:
        window.refresh()
    yx = windows[selected_window_index].getbegyx()
    stdscr.move(yx[0], yx[1])
    key = stdscr.getkey()
    if(key == "KEY_RIGHT"):
        selected_window_index = (selected_window_index + 1) % len(windows)
        yx = windows[selected_window_index].getbegyx()
        stdscr.move(yx[0], yx[1])
    stdscr.getkey()

def main(stdscr):
    main_arm = Joint()
    command = commands.joint_status(main_arm)
    coms = Coms("/dev/ttyACM0")
    time.sleep(1)
    coms.write(command)
    four_arm_control(stdscr)

curses.wrapper(main)

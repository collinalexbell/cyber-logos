import curses
from curses import wrapper

def Horizontal_Axis(window,name):
    (y, x) = window.getmaxyx()
    for i in range(x-8):
        window.addch(y-4,i+4,'_')
    window.addstr(y-2,4,name + "-->")
    window.refresh()

def Vertical_Axis(window,name):
    (y, x) = window.getmaxyx()
    for j in range(y-6):
        window.addch(j+2,4,'|')
    window.addstr(y-8,1, "^")
    window.addstr(y-7,1, "|")
    window.addstr(y-6,1, name)
    window.refresh()



def Theta_plane(screen_height, screen_width):
    theta_plane = curses.newwin(screen_height-4,int(screen_width/2),4,0)
    theta_plane.box()
    theta_plane.addstr(0,0,"Theta Plane View")
    theta_plane.refresh()
    Horizontal_Axis(theta_plane, "r")
    Vertical_Axis(theta_plane, "z")

def Z_plane(screen_height,screen_width):
    z_plane = curses.newwin(screen_height-4,int(screen_width/2),4,int(screen_width/2))
    z_plane.box()
    z_plane.addstr(0,0,"Z Plane View")
    z_plane.refresh()
    Horizontal_Axis(z_plane, "x")
    Vertical_Axis(z_plane, "y")

def model(stdscr):
    (screen_height,screen_width) = stdscr.getmaxyx()
    stdscr.clear()
    stdscr.addstr(0, 30, "Tree Arm Model")
    stdscr.refresh()

    Z_plane(screen_height, screen_width)
    Theta_plane(screen_height, screen_width)

    stdscr.getkey()


wrapper(model)

import gi
import json

from gui import GoalsWindow
from goal import Goal
from goal import Repo as GoalRepo
from time import time as utc

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


def start():
    repo = GoalRepo()
    json_str = "["
    all_goals = repo.get_all()
    for i, goal in enumerate(all_goals):
        json_str += "\n"
        json_str += goal.to_json().replace("\n", "\\n")
        if(i != len(all_goals) - 1 ):
            json_str += ","
        json_str += "\n"

    json_str += "]"
    print(json_str)

start()


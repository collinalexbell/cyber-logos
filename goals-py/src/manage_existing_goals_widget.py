import gi
from gi.repository import Gtk

class ManageExistingGoalsWidget(Gtk.Frame):
    def __init__(self, delete_button_callback, select_goal_callback, deselect_goal_callback):
        Gtk.Frame.__init__(self, label="Manage Existing Goals")
        self.really_delete_button_callback = delete_button_callback
        self.is_deleting = False
        self.select_goal_callback = select_goal_callback
        self.deselect_goal_callback = deselect_goal_callback
        self.init_widget_content()

    def init_widget_content(self):
        self.content = Gtk.VBox()
        self.add(self.content)

        self.scrolled_window = Gtk.ScrolledWindow()
        self.content.add(self.scrolled_window)


        self.listbox = Gtk.ListBox()
        self.listbox.connect("row-selected", self.select)
        self.list_of_goals = []
        self.scrolled_window.add(self.listbox)


        self.selected_goal_label = Gtk.Label("")
        self.selected_goal_label.set_line_wrap(True)

        self.deselect_goal_widget = Gtk.Button(label="Deselect Goal")
        self.deselect_goal_widget.connect("clicked", self.deselect)

        self.delete_button = Gtk.Button("Delete Goal")
        self.delete_button.connect("clicked", self.delete_button_callback)


    def delete_button_callback(self, btn):
        if not self.is_deleting:
            self.is_deleting = True
            self.delete_button.set_label("Really Delete Goal?!")
        else:
            self.is_deleting = False
            self.really_delete_button_callback()
            row = self.listbox.get_selected_row()
            if(row != None):
                del self.list_of_goals[row.get_index()]
                self.listbox.remove(row)
            else:
                print("row didn't exist")
            self.deselect(None)

    def select(self, list_box, list_box_row):
        self.is_deleting = False
        selected_goal = self.get_selected_goal()
        if selected_goal != None:
            self.selected_goal_label.set_label(selected_goal.name)
        self.content.remove(self.scrolled_window)
        self.content.add(self.selected_goal_label)
        self.content.pack_start(self.deselect_goal_widget, False, False, 10)
        self.content.pack_start(self.delete_button, False, False, 10)
        self.select_goal_callback(list_box, list_box_row)

    def deselect(self, _btn):
        self.listbox.unselect_all()
        self.content.remove(self.selected_goal_label)
        self.content.remove(self.deselect_goal_widget)
        self.content.remove(self.delete_button)
        self.content.add(self.scrolled_window)
        self.deselect_goal_callback()
        self.content.queue_draw()

    def add_to_goal_list(self, goal):
        self.list_of_goals.append(goal)
        row = Gtk.ListBoxRow()
        label = Gtk.Label(f"{goal}", xalign=0)
        label.set_justify(Gtk.Justification.LEFT)
        row.add(label)
        self.listbox.add(row)

    def get_selected_goal(self):
        row = self.listbox.get_selected_row()
        if row != None:
            return self.list_of_goals[row.get_index()]
        else:
            return None


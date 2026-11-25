from powerline_shell.segments.git import Segment as GitSegment


class Segment(GitSegment):
    def add_to_powerline(self):
        self.join()
        if not self.stats:
            return
        self.branch = '\U0001F500 ' + self.branch
        super(Segment, self).add_to_powerline()

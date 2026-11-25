from powerline_shell.segments.newline import Segment as NewlineSegment


class Segment(NewlineSegment):
    # Skip the break when nothing has been drawn since the last one, so a
    # line whose segments all opted out (e.g. git outside a repo) collapses.
    def add_to_powerline(self):
        segments = self.powerline.segments
        if not segments or segments[-1][0] == "\n":
            return
        super(Segment, self).add_to_powerline()

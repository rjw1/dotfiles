from powerline_shell.utils import BasicSegment


class Segment(BasicSegment):
    def add_to_powerline(self):
        if self.powerline.segment_conf("snowman", "emoji", False):
            # Bold has no effect on a colour emoji, so it is left out.
            content = ' ⛄ '
        else:
            # Colour changes later in the prompt do not clear bold, so turn
            # it off explicitly (22) rather than leaking it into following
            # segments.
            bold = self.powerline.color_template % '[1m'
            normal = self.powerline.color_template % '[22m'
            content = ' %s☃︎%s ' % (bold, normal)
        self.powerline.append(content,
                              self.powerline.theme.SNOWMAN_FG,
                              self.powerline.theme.SNOWMAN_BG)

import subprocess
from powerline_shell.utils import BasicSegment


class Segment(BasicSegment):
    def add_to_powerline(self):
        powerline = self.powerline
        try:
            p1 = subprocess.Popen(["rbenv", "version"], stdout=subprocess.PIPE)
            p2 = subprocess.Popen(['sed', "s/(.*//"], stdin=p1.stdout, stdout=subprocess.PIPE)
            version = p2.communicate()[0].decode("utf-8").rstrip()
            if len(version) <= 0:
                    return
            powerline.append(' %s ' % version,
                             powerline.theme.VIRTUAL_ENV_FG,
                             powerline.theme.VIRTUAL_ENV_BG)
        except OSError:
            return

import subprocess
from powerline_shell.utils import BasicSegment


class Segment(BasicSegment):
    def add_to_powerline(self):
        powerline = self.powerline
        try:
            p1 = subprocess.Popen(["tfenv", "version-name"], stdout=subprocess.PIPE)
            version = p1.communicate()[0].decode("utf-8").rstrip()
            if len(version) <= 0:
                    return
            powerline.append(' %s ' % version,
                             powerline.theme.TF_ENV_FG,
                             powerline.theme.TF_ENV_BG)
        except OSError:
            return

import json
import os
from powerline_shell.utils import BasicSegment

CONFIG_DIR = os.path.expanduser("~/.config/dalmatian")


def read_key(name, key):
    try:
        with open(os.path.join(CONFIG_DIR, name)) as f:
            return json.load(f).get(key) or ""
    except (OSError, ValueError, AttributeError):
        return ""


class Segment(BasicSegment):
    def add_to_powerline(self):
        version = read_key("version.json", "version")
        # Mirrors dalmatian-tools' resolve_installation precedence.
        installation = (os.environ.get("DALMATIAN_INSTALLATION")
                        or read_key("installations.json", "default"))
        parts = [p for p in (version, installation) if p]
        if not parts:
            return
        self.powerline.append(' \U0001F415 %s ' % ' '.join(parts),
                              self.powerline.theme.DALMATIAN_FG,
                              self.powerline.theme.DALMATIAN_BG)

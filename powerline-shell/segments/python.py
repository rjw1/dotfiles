import os
from powerline_shell.utils import BasicSegment


class Segment(BasicSegment):
    def add_to_powerline(self):
        env = os.getenv('VIRTUAL_ENV') \
            or os.getenv('CONDA_ENV_PATH') \
            or os.getenv('CONDA_DEFAULT_ENV')
        if not env:
            return
        # A project-local .venv is named after the project, not the directory.
        if os.getenv('VIRTUAL_ENV') and os.path.basename(env) == '.venv':
            env = os.path.dirname(env)
        self.powerline.append(' \U0001F40D %s ' % os.path.basename(env),
                              self.powerline.theme.VIRTUAL_ENV_FG,
                              self.powerline.theme.VIRTUAL_ENV_BG)

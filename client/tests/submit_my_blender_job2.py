import getpass

import outline
import outline.cuerun
import outline.modules.shell


blender_file = '/spypost/core/projects/NortonSawYetAgain/sandboxes/shots/nsaw050/td_eryan/nsaw050_td_v004_OPENCUE.blend'
blender_command = ['/usr/local/blender/blender-3.6.5-linux-x64/blender', '--enable-autoexec', '--background', blender_file, '--render-frame', '#IFRAME#']


ol = outline.Outline(
    'nsaw', shot='nsaw050', show='testing', user=getpass.getuser())
layer1 = outline.modules.shell.Shell(
    'sideSteam', command=blender_command, chunk=1, service='arnold', cores=3, range='1001-1060x1')
ol.add_layer(layer1)
jobs = outline.cuerun.launch(ol, use_pycuerun=False)
import getpass

import outline
import outline.cuerun
import outline.modules.shell


blender_file = '/nfs/fourage/core/projects/SweetEarth/sandboxes/assets/steam/steamSide/td_eryan/Blender/projects/steamSide_opencue.blend'
blender_command = ['/usr/local/blender/blender-3.6.5-linux-x64/blender', '--enable-autoexec', '--background', blender_file, '--render-frame', '#IFRAME#']


ol = outline.Outline(
    'steam', shot='STEAM', show='testing', user=getpass.getuser())
layer1 = outline.modules.shell.Shell(
    'sideSteam', command=blender_command, chunk=1, service='arnold', cores=3, range='1001-1450x2')
ol.add_layer(layer1)
jobs = outline.cuerun.launch(ol, use_pycuerun=False)
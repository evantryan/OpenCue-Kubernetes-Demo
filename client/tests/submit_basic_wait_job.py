#!/usr/bin/env python
#  Copyright Contributors to the OpenCue Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

"""Basic job structure with a single layer and 100 frames.

Print out the current frame number. Sleep 45 seconds"""

import getpass

import outline
import outline.cuerun
import outline.modules.shell

ol = outline.Outline(
    'basic_wait_job', shot='shot01', show='testing', user=getpass.getuser())
layer = outline.modules.shell.Shell(
    'echo_frame', command=['echo', '#IFRAME#', '&&', 'sleep', '45', '&&', 'echo', 'im done!'], chunk=1, threads=1, range='1-100x1')
ol.add_layer(layer)
jobs = outline.cuerun.launch(ol, use_pycuerun=False)

for job in jobs:
    print(f"Submitted {job.name()}")

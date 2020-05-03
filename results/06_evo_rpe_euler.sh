#########################################################################
# File Name: 06_evo_rpe_euler.sh
# Author: Mr Chen 
# Created Time: 2020年05月02日 星期六 15时48分44秒
#########################################################################
#!/bin/bash

evo_rpe tum ./groundtruth_V2_02.tum ./estimate_result_V2_02.txt -r angle_deg --delta 1 --delta_unit m -a -v -p 

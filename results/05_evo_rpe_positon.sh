#########################################################################
# File Name: 05_evo_rpe_positon.sh
# Author: Mr Chen 
# Created Time: 2020年05月02日 星期六 15时48分18秒
#########################################################################
#!/bin/bash

evo_rpe tum ./groundtruth_V2_02.tum ./estimate_result_V2_02.txt --delta 1 --delta_unit m -a -v -p 

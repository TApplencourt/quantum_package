#!/usr/bin/env bats

source $QP_ROOT/tests/bats/common.bats.sh
source $QP_ROOT/quantum_package.rc

function run() {
  thresh=$2
  test_exe fci || skip
  qp edit --check
  qp set determinants n_det_max 8000
  qp set determinants n_states  1
  qp set davidson threshold_davidson 1.e-10
  qp set davidson n_states_diag 8
  qp run fci 
  energy1="$(ezfio get fci energy | tr '[]' ' ' | cut -d ',' -f 1)"
  eq $energy1 $1 $thresh
}




@test "NH3" { # 10.6657s
  qp set_file nh3.ezfio
  qp set_mo_class --core="[1-4]" --act="[5-72]"
  run -56.2447484821590 1.e-5
}

@test "DHNO" { # 11.4721s
  qp set_file dhno.ezfio
  qp set_mo_class --core="[1-7]" --act="[8-64]" 
  run -130.45902272485 1.e-5
}

@test "HCO" { # 12.2868s
  qp set_file hco.ezfio
  run -113.297580169167 1.444e-05 
}

@test "H2O2" { # 12.9214s
  qp set_file h2o2.ezfio
  qp set_mo_class --core="[1-2]" --act="[3-24]" --del="[25-38]"
  run -151.004593814816 0.00011948 
}

@test "HBO" { # 13.3144s
  qp set_file hbo.ezfio
  run -100.213113590746 1.36e-05
}

@test "H2O" { # 11.3727s
  qp set_file h2o.ezfio
  run -76.2358876720796  1.988e-05 
}

@test "ClO" { # 13.3755s
  qp set_file clo.ezfio
  run -534.545851735243 0.00019344
}

@test "SO" { # 13.4952s
  qp set_file so.ezfio
  run -26.0118045926651 0.00014494
}

@test "H2S" { # 13.6745s
  [[ -n $TRAVIS ]] && skip
  qp set_file h2s.ezfio
  run -398.859198067009 8.46e-06
}

@test "OH" { # 13.865s 
  [[ -n $TRAVIS ]] && skip
  qp set_file oh.ezfio
  run -75.6120973654659 1.744e-05 
}

@test "SiH2_3B1" { # 13.938ss
  [[ -n $TRAVIS ]] && skip
  qp set_file sih2_3b1.ezfio
  run -290.017547995946 1.e-5
}

@test "H3COH" { # 14.7299s
  [[ -n $TRAVIS ]] && skip
  qp set_file h3coh.ezfio
  run -115.200348295051 0.00018132
}

@test "SiH3" { # 15.99s
  [[ -n $TRAVIS ]] && skip
  qp set_file sih3.ezfio
  run -5.57259338826877 1.116e-05 
}

@test "CH4" { # 16.1612s
  [[ -n $TRAVIS ]] && skip
  qp set_file ch4.ezfio
  qp set_mo_class --core="[1]" --act="[2-30]" --del="[31-59]"
  run -40.2410273920655 3.02e-06
}

@test "ClF" { # 16.8864s
  [[ -n $TRAVIS ]] && skip
  qp set_file clf.ezfio
  run -559.171627972338 0.00021062
}

@test "SO2" { # 17.5645s
  [[ -n $TRAVIS ]] && skip
  qp set_file so2.ezfio
  qp set_mo_class --core="[1-8]" --act="[9-87]" 
  run -41.5746738710646 1.e-5
}

@test "C2H2" { # 17.6827s
  [[ -n $TRAVIS ]] && skip
  qp set_file c2h2.ezfio
  qp set_mo_class --act="[1-30]" --del="[31-36]"
  run -12.3681909988587 9.402e-05 
}

@test "N2" { # 18.0198s
  [[ -n $TRAVIS ]] && skip
  qp set_file n2.ezfio
  qp set_mo_class --core="[1,2]" --act="[3-40]" --del="[41-60]"
  run -109.291407960731 0.00010052
}

@test "N2H4" { # 18.5006s
  [[ -n $TRAVIS ]] && skip
  qp set_file n2h4.ezfio
  qp set_mo_class --core="[1-2]" --act="[3-24]" --del="[25-48]"
  run -111.367266319251 0.00010255
}

@test "CO2" { # 21.1748s
  [[ -n $TRAVIS ]] && skip
  qp set_file co2.ezfio
  qp set_mo_class --core="[1,2]" --act="[3-30]" --del="[31-42]"
  run -187.968251806361 0.00028902
}

@test "F2" { # 21.331s
  [[ -n $TRAVIS ]] && skip
  qp set_file f2.ezfio
  qp set_mo_class --core="[1,2]" --act="[3-30]" --del="[31-62]"
  run -199.068698950474 0.00014534
}

@test "[Cu(NH3)4]2+" { # 25.0417s
  [[ -n $TRAVIS ]] && skip
  qp set_file cu_nh3_4_2plus.ezfio
  qp set_mo_class --core="[1-24]" --act="[25-45]" --del="[46-87]"
  run -1862.98632761077  5.e-07
}

@test "HCN" { # 20.3273s
  [[ -n $TRAVIS ]] && skip
  qp set_file hcn.ezfio
  qp set_mo_class --core="[1,2]" --act="[3-40]" --del="[41-55]"
  run -93.0774580352237 0.00016522
}


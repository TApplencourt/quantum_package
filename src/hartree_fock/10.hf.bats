#!/usr/bin/env bats

source $QP_ROOT/tests/bats/common.bats.sh
source $QP_ROOT/quantum_package.rc


function run() {
  thresh=1.e-8
  test_exe scf || skip
  qp set_file $1
  qp edit --check
  qp run scf 
  qp set_frozen_core 
  energy="$(ezfio get hartree_fock energy)"
  eq $energy $2 $thresh
}


@test "SiH2_3B1" { # 0.539000
  run sih2_3b1.ezfio -289.9654718650881
}

@test "SO" { # 0.539000
  run so.ezfio -25.7175263371942
}

@test "HCO" { # 0.636700
  run hco.ezfio -113.0862778269114
}

@test "HBO" { # 0.805600
  run  hbo.ezfio  -100.018582259096 
}

@test "H2S" { # 1.655600
  run h2s.ezfio -398.6944130421982
}

@test "H3COH" { # 1.751000
  run h3coh.ezfio  -114.9865030596373
}

@test "H2O" { # 1.811100
  run  h2o.ezfio  -0.760270218692179E+02
}

@test "H2O2" { # 2.217000
  run h2o2.ezfio -150.7806608469964
}

@test "ClF" { # 2.797000
  run clf.ezfio -558.8442570663570
}

@test "CO2" { # 2.811100
  run co2.ezfio -187.6507108861204
}

@test "N2H4" { # 4.054600
  run n2h4.ezfio -111.1799916679009
}

@test "ClO" { # 4.927400
  run clo.ezfio -534.2496714154559
}

@test "F2" { # 5.070800
  run f2.ezfio  -198.7643578233773
}

@test "CH4" { # 5.994000
  run ch4.ezfio -40.19961807784367
}

@test "HCN" { # 7.792500
  run hcn.ezfio -92.88717500035233
}

@test "N2" { # 8.648100
  run n2.ezfio  -108.9834897852979
}

@test "DHNO" { # 12.856700
  run  dhno.ezfio  -130.4278777822   
}

@test "NH3" { # 13.632200
  run nh3.ezfio -56.21783428976567
}

@test "C2H2" { # 19.599000
  run c2h2.ezfio -12.12144019495306
}

@test "SiH3" { # 20.316100
  run sih3.ezfio -5.455398769158780
}

@test "OH" { # 32.042200
  run oh.ezfio -75.42025413469165
}


@test "[Cu(NH3)4]2+" { # 59.610100
  [[ -n $TRAVIS ]] && skip
  qp set_file cu_nh3_4_2plus.ezfio
  qp set scf_utils thresh_scf 1.e-10
  run  cu_nh3_4_2plus.ezfio -1862.97590388214
}

@test "SO2" { # 71.894900
  [[ -n $TRAVIS ]] && skip
  run so2.ezfio -41.55800190733211
}


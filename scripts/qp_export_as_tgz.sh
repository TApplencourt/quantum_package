#!/bin/bash -x
# 
# Creates a self-contained binary distribution in the form of a tar.gz file
# 
# Tue Jan 13 14:06:25 CET 2015
#


# Check the QP_ROOT directory
if [[ -z ${QP_ROOT} ]]
then
  echo "The QP_ROOT environment variable is not set."
  echo "Please reload the quantum_package.rc file."
  exit 1
fi

cd ${QP_ROOT}
if [[ -f quantum_package.rc \
   && -f README.md \
   && -d src  \
   && -d bin  \
   && -d ocaml \
   && -d scripts ]]
then
  head -1 README.md | grep "IMPORTANT" > /dev/null
  if [[ $? -ne 0 ]]
  then
    echo "This doesn't look like a quantum_package directory  (README.md)"
    exit 1
  fi
else
  echo "This doesn't look like a quantum_package directory"
  exit 1
fi


# Build all sources
ninja
if [[ $? -ne 0 ]]
then
  echo "Error building ${dir}"
fi


# Copy the files in the static directory
QPACKAGE_STATIC=${QP_ROOT}/quantum_package_static

function find_libs ()
{
  for i in $@
  do
      ldd $i
  done | sort | grep '/' | cut -d ' ' -f 3 | uniq
}

function find_exec ()
{
  find ${QP_ROOT}/$1 -perm /u+x -type f
}



#
echo "Creating root of static directory"
#     ---------------------------------

rm -rf -- ${QPACKAGE_STATIC}
mkdir -p -- ${QPACKAGE_STATIC}/{bin,lib,extra_lib,install}
if [[ $? -ne 0 ]] ;
then
  echo "Error creating ${QPACKAGE_STATIC}/{bin,lib,extra_lib,install}"
  exit 1
fi


#
echo "Copying binary files"
#     --------------------

FORTRAN_EXEC=$(find_exec src)
if [[ -z $FORTRAN_EXEC ]] ;
then
  echo 'Error : No Fortran binaries found.'
  exit 1
fi

OCAML_EXEC=$(find_exec ocaml | grep .native )
if [[ -z $OCAML_EXEC ]] ;
then
  echo 'Error : No ocaml binaries found.'
  exit 1
fi

cp -- ${FORTRAN_EXEC} ${OCAML_EXEC} ${QPACKAGE_STATIC}/bin
if [[ $? -ne 0 ]] ;
then
  cp -- ${FORTRAN_EXEC} ${OCAML_EXEC} ${QPACKAGE_STATIC}/bin
  exit 1
fi

cd ${QPACKAGE_STATIC}/bin
  for i in *.native
  do
    mv "$i" $(basename "$i" .native)
  done
cd -

cp -r ${QP_ROOT}/data ${QPACKAGE_STATIC}/data
for i in ${FORTRAN_EXEC}
do
  i=$(basename $i)
  echo $i \$QP_ROOT/bin/$i
done > ${QPACKAGE_STATIC}/data/executables

mkdir -p ${QPACKAGE_STATIC}/src/Bitmask
cp ${QP_ROOT}/src/Bitmask/bitmasks_module.f90 ${QPACKAGE_STATIC}/src/Bitmask

#
echo "Copying dynamic libraries"
#     --------------------------

MKL_LIBS=$(find_libs ${FORTRAN_EXEC} | grep libmkl | head -1)
if [[ -n ${MKL_LIBS} ]]
then
  MKL_LIBS=$(dirname ${MKL_LIBS})
  MKL_LIBS=$(ls ${MKL_LIBS}/libmkl_{def,avx,avx2}.so)
fi

ALL_LIBS=$(find_libs ${OCAML_EXEC} ${FORTRAN_EXEC})
for i in ${ALL_LIBS} ${MKL_LIBS} 
do
  cp -- ${i} ${QPACKAGE_STATIC}/extra_lib
done

if [[ $? -ne 0 ]] ;
then
  echo 'cp -- ${ALL_LIBS} ${MKL_LIBS} ${QPACKAGE_STATIC}/extra_lib'
  exit 1
fi

cp -- ${QPACKAGE_STATIC}/extra_lib/lib{[gi]omp*,mkl*,lapack*,blas*,z*} ${QPACKAGE_STATIC}/lib/

#
echo "Copying EMSL_Basis directory"
#     ---------------------------- 

cp -r -- ${QP_ROOT}/install/emsl ${QPACKAGE_STATIC}/install
if [[ $? -ne 0 ]] ;
then
  echo 'cp -r -- ${QP_ROOT}/install/emsl ${QPACKAGE_STATIC}/'
  exit 1
fi


#
echo "Copying scripts directory"
#     ------------------------- 

cp -r -- ${QP_ROOT}/scripts ${QPACKAGE_STATIC}/
if [[ $? -ne 0 ]] ;
then
  echo 'cp -r -- ${QP_ROOT}/scripts ${QPACKAGE_STATIC}/'
  exit 1
fi
cp ${QP_ROOT}/install/EZFIO/Python/ezfio.py ${QPACKAGE_STATIC}/scripts/


#
echo "Creating quantum_package.rc"
#     ---------------------------

cat << EOF > ${QPACKAGE_STATIC}/quantum_package.rc
export QP_ROOT=\$( cd \$(dirname "\${BASH_SOURCE}")  ; pwd -P )

export QP_EZFIO=\${QP_ROOT}/install/EZFIO
export QP_PYTHON=\${QP_ROOT}/scripts:\${QP_ROOT}/scripts/ezfio_interface:\${QP_ROOT}/scripts/utility:\${QP_ROOT}/scripts/module:\${QP_ROOT}/scripts/pseudo:\${QP_ROOT}/scripts/compilation:\${QP_ROOT}/install/bats:\${QP_ROOT}/install/Downloads:\${QP_ROOT}/install/eigen:\${QP_ROOT}/install/p_graphviz:\${QP_ROOT}/install/gmp:\${QP_ROOT}/install/resultsFile:\${QP_ROOT}/install/_build:\${QP_ROOT}/install/emsl:\${QP_ROOT}/install/scripts:\${QP_ROOT}/install/docopt:\${QP_ROOT}/install/irpf90:\${QP_ROOT}/install/zlib:\${QP_ROOT}/install/EZFIO

export IRPF90=\${QP_ROOT}/bin/irpf90
export NINJA=\${QP_ROOT}/bin/ninja
function qp_prepend_export () {
eval "value_1="\\\${\$1}""
if [[ -z \$value_1 ]] ; then
    echo "\${2}:"
else
    echo "\${2}:\${value_1}"
fi
}
export PYTHONPATH=\$(qp_prepend_export "PYTHONPATH" "\${QP_EZFIO}/Python":"\${QP_PYTHON}")
export PATH=\$(qp_prepend_export "PATH" "\${QP_PYTHON}":"\${QP_ROOT}"/bin:"\${QP_ROOT}"/ocaml)
export LD_LIBRARY_PATH=\$(qp_prepend_export "LD_LIBRARY_PATH" "\${QP_ROOT}"/lib:"\${QP_ROOT}"/extra_lib:"\${QP_ROOT}"/lib64)
export LIBRARY_PATH=\$(qp_prepend_export "LIBRARY_PATH" "\${QP_ROOT}"/lib:"\${QP_ROOT}"/extra_lib:"\${QP_ROOT}"/lib64)
export C_INCLUDE_PATH=\$(qp_prepend_export "C_INCLUDE_PATH" "\${QP_ROOT}"/include)

# export QP_NIC=ib0
EOF

#exit 0
#
echo "Creating the archive"
#     --------------------

tar -zcf "${QPACKAGE_STATIC}".tar.gz quantum_package_static && rm -rf -- "${QPACKAGE_STATIC}"
if [[ $? -ne 0 ]] ;
then
  echo 'tar -zcf "${QPACKAGE_STATIC}".tar.gz "${QPACKAGE_STATIC}" && rm -rf -- "${QPACKAGE_STATIC}"'
  exit 1
fi

echo "Done : ${QPACKAGE_STATIC}.tar.gz"


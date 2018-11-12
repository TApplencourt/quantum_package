#!/bin/env python2

from __future__ import print_function
import os
import ConfigParser


def generate(abs_module):
  MODULE = os.path.split(abs_module)[-1]
  module = MODULE.lower()
  if module == "dummy":
    return

  with open( os.path.join(abs_module,'README.rst'), 'r' ) as f:
    readme = f.read()
  rst = [
    ".. _%s:"%(module), "", 
    ".. program:: %s"%(module), "", 
    ".. default-role:: option", "", 
    readme, "", 
  ]

  EZFIO = os.path.join(abs_module,'EZFIO.cfg')
  if os.path.exists(EZFIO):
    rst += [ "", "EZFIO parameters", "----------------", "" ]
    config_file = ConfigParser.ConfigParser()
    with open(EZFIO,'r') as f:
        config_file.readfp(f)
        for section in config_file.sections():
            doc = config_file.get(section,"doc")
            doc     = "   " + doc.replace("\n","\n\n   ")+"\n"
            try:
                default = config_file.get(section,"default")
                default = "   " + "Default: %s\n"%default
            except:
                default = ""
            rst += [ ".. option:: %s\n"%(section), doc, default ]

  rst_file = os.path.join('modules',module+".rst")
  with open(rst_file,'w') as f: 
    f.write("\n".join(rst))



def main():

  if "QP_ROOT" in os.environ:
    QP_ROOT=os.environ["QP_ROOT"]
  else:
    QP_ROOT="../../../"

  SRC = os.path.join(QP_ROOT, "src")


  for abs_module in os.listdir(SRC):
    abs_module = os.path.join(SRC,abs_module)
    if os.path.exists( os.path.join(abs_module, "README.rst") ):
      generate(abs_module)

if __name__ == '__main__':
  main()


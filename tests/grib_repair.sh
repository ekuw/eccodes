#!/bin/sh
# (C) Copyright 2005- ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
# 
# In applying this licence, ECMWF does not waive the privileges and immunities granted to it by
# virtue of its status as an intergovernmental organisation nor does it submit to any jurisdiction.
#

. ./include.ctest.sh

label="grib_repair_test"
tempText=temp.$label.txt
tempGrib=temp.$label.grib

if [ -e "${tools_dir}/grib_repair" ]; then
    export ECCODES_GRIB_REPAIR_MAX_NUM_MESSAGES=3
    ${tools_dir}/grib_repair $data_dir/bad.grib $tempGrib > $tempText 2>&1
    cat $tempText
    ${tools_dir}/grib_ls  $tempGrib

    grep -q "Wrong message length" $tempText
fi

# Clean up
rm -f $tempText $tempGrib

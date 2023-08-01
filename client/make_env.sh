opencue_version_major=0
opencue_version_minor=22
opencue_version_patch=14
opencue_version=$opencue_version_major.$opencue_version_minor.$opencue_version_patch
root_dir=$(pwd)

declare -a packages=(
                  "pycue"
                  "pyoutline"
                  "cuegui"
                  "cuesubmit"
                 )

python3 -m venv venv
source venv/bin/activate
mkdir build

for package in "${packages[@]}"
do
    echo
    echo "--------------------------------------------$package--------------------------------------------------"
    echo 
    curl -SL https://github.com/AcademySoftwareFoundation/OpenCue/releases/download/v$opencue_version/$package-$opencue_version-all.tar.gz \
        -o build/$package-$opencue_version-all.tar.gz

    tar -xzf build/$package-$opencue_version-all.tar.gz -C build/.

    rm build/$package-$opencue_version-all.tar.gz

    cd build/$package-$opencue_version-all && pip install -r requirements.txt
    python setup.py install
    cd $root_dir
done



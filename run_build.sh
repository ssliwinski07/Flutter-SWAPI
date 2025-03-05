directories=("modules/base" "modules/connector" "modules/core" "modules/UI")

for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        cd "$dir" || exit
        echo "Running command in $dir"
        fvm flutter pub get
        cd - || exit
    else
        echo "Directory $dir does not exist."
    fi
done
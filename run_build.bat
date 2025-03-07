@echo off
setlocal enabledelayedexpansion

set directories=modules\base modules\connector modules\core modules\UI .

for %%d in (%directories%) do (
    if exist %%d (
        pushd %%d
        echo Running command in %%d
        fvm flutter pub get
        popd
    ) else (
        echo Directory %%d does not exist.
    )
)
#!/usr/bin/env bash

# PLEASE NOTE: This script has been automatically generated by conda-smithy. Any changes here
# will be lost next time ``conda smithy rerender`` is run. If you would like to make permanent
# changes to this script, consider a proposal to conda-smithy so that other feedstocks can also
# benefit from the improvement.

set -xeuo pipefail
export PYTHONUNBUFFERED=1
# export FEEDSTOCK_ROOT="${FEEDSTOCK_ROOT:-/home/conda/feedstock_root}"
# export RECIPE_ROOT="${RECIPE_ROOT:-/home/conda/recipe_root}"
# export CI_SUPPORT="${FEEDSTOCK_ROOT}/.ci_support"
# export CONFIG_FILE="${CI_SUPPORT}/${CONFIG}.yaml"

cat >~/.condarc <<CONDARC
conda-build:
    root-dir: ${FEEDSTOCK_ROOT}/build_artifacts
CONDARC

conda install --yes --quiet conda-build pip anaconda-client -c conda-forge
# setup_conda_rc "${FEEDSTOCK_ROOT}" "${RECIPE_ROOT}" "${CONFIG_FILE}"
# export PATH="$HOME/miniconda/bin:$PATH"
conda config --set anaconda_upload yes
conda config --set show_channel_urls true
conda config --set auto_update_conda false
conda config --set add_pip_as_python_dependency false

conda config --append channels defaults
conda config --add channels conda-forge
conda config --set channel_priority strict

export "CONDA_BLD_PATH=${FEEDSTOCK_ROOT}/build_artifacts"

conda info
conda config --show-sources
conda list --show-channel-urls

pwd

cd ${FEEDSTOCK_ROOT}

pip install -e .

cd examples
vinca

conda build .
# # set up the condarc

# source run_conda_forge_build_setup

# # make the build number clobber
# make_build_number "${FEEDSTOCK_ROOT}" "${RECIPE_ROOT}" "${CONFIG_FILE}"

# conda build "${RECIPE_ROOT}" -m "${CI_SUPPORT}/${CONFIG}.yaml" \
#     --clobber-file "${CI_SUPPORT}/clobber_${CONFIG}.yaml"

# if [[ "${UPLOAD_PACKAGES}" != "False" ]]; then
#     upload_package  "${FEEDSTOCK_ROOT}" "${RECIPE_ROOT}" "${CONFIG_FILE}"
# fi

# touch "${FEEDSTOCK_ROOT}/build_artifacts/conda-forge-build-done-${CONFIG}"
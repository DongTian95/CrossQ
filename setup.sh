#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Function to print messages with a timestamp
log() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

# Create a new conda environment named 'crossq' with Python 3.11.
log "Creating the conda environment 'crossq' with Python 3.11..."
#conda create -n crossq python=3.11 -y

# Activate the new environment.
# Ensure that the conda base environment is initialized for this shell.
if [ -f "$(conda info --base)/etc/profile.d/conda.sh" ]; then
    source "$(conda info --base)/etc/profile.d/conda.sh"
else
    log "Could not find conda.sh; make sure conda is installed and initialized."
    exit 1
fi

# Explicitly activate the 'crossq' environment.
log "Activating the 'crossq' environment..."
conda activate crossq

# Install the Python project requirements.
if [ -f requirements.txt ]; then
    log "Installing project requirements from requirements.txt..."
    pip install -r requirements.txt
else
    log "requirements.txt not found. Skipping pip install -r requirements.txt."
fi

# Install JAX with CUDA support.
log "Installing jax with CUDA (cuda12_pip) support..."
pip install "jax[cuda12_pip]==0.4.33" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# Install flax version 0.9.0.
log "Installing flax==0.9.0..."
pip install flax==0.9.0

pip install jax==0.4.33

# Install the specified PyTorch version.
log "Installing torch==2.4.1..."
pip install torch==2.4.1

pip install orbax-checkpoint==0.6.4


log "Setup complete! The 'crossq' environment is ready for use."

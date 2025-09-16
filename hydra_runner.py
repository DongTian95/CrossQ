from pathlib import Path
import subprocess, sys
from omegaconf import OmegaConf
import hydra

@hydra.main(config_path="conf", config_name="config", version_base=None)
def main(cfg):
    # Build the same CLI CrossQ expects
    args = [
        sys.executable, "train.py",
        "-algo", str(cfg.crossq.algo),
        "-env",  str(cfg.crossq.env),
        "-seed", str(cfg.crossq.seed),
        "-adam_b1", str(cfg.crossq.adam_b1),
        "-wandb_mode", str(cfg.crossq.wandb.mode),
    ]
    if cfg.crossq.wandb.entity:
        args += ["-wandb_entity", str(cfg.crossq.wandb.entity)]
    if cfg.crossq.wandb.project:
        args += ["-wandb_project", str(cfg.crossq.wandb.project)]

    print("Launching:", " ".join(args), flush=True)
    sys.exit(subprocess.call(args))

if __name__ == "__main__":
    main()

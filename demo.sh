conda create -n gr00t python=3.10 -y
conda activate gr00t
pip install --upgrade setuptools
pip install -e .
pip install --no-build-isolation flash-attn==2.7.1.post4 

python scripts/gr00t_finetune.py --dataset-path ./demo_data/robot_sim.PickNPlace --num-gpus 1 --max-steps 500 --output-dir ./gr00t-1/finetuned-model --data-config gr1_arms_only
python scripts/inference_service.py --server --model_path ./gr00t-1/finetuned-model --embodiment_tag new_embodiment --data_config gr1_arms_only
python scripts/eval_policy.py --plot --dataset_path ./demo_data/robot_sim.PickNPlace --embodiment_tag new_embodiment --data_config gr1_arms_only
#!/bin/sh
#

for dataset in "yoshida_2021" "tran_2021" "tosti_2021" "litvinukova_2020" "lake_2021" "dominguez_2022_spleen" "tabula_2022_spleen" "koenig_2022" "dominguez_2022_lymph"; #"dominguez_2022_lymph"
do
    sbatch --partition=gpu --gres=gpu:1 --time=35:00:00 --job-name t3_$dataset benchmark_task_3.sh $dataset Original_annotation batch True
    sbatch --partition=cpucourt --exclusive --time=71:00:00 --job-name t3_$dataset benchmark_task_3.sh $dataset Original_annotation batch False
done

sbatch --partition=gpu --gres=gpu:1 --time=35:00:00 --job-name t3_ajrccm_by_batch benchmark_task_3.sh ajrccm_by_batch celltype manip True
sbatch --partition=gpu --gres=gpu:1 --time=35:00:00 --job-name t3_htap benchmark_task_3.sh htap ann_finest_level donor True
sbatch --partition=gpu --gres=gpu:1 --time=35:00:00 --job-name t3_hlca_par_dataset_harmonized benchmark_task_3.sh hlca_par_dataset_harmonized ann_finest_level dataset True
sbatch --partition=gpu --gres=gpu:1 --time=35:00:00 --job-name t3_hlca_trac_dataset_harmonized benchmark_task_3.sh hlca_trac_dataset_harmonized ann_finest_level dataset True

sbatch --partition=cpucourt --exclusive --time=71:00:00 --job-name t3_ajrccm_by_batch benchmark_task_3.sh ajrccm_by_batch celltype manip False
sbatch --partition=cpucourt --exclusive --time=71:00:00 --job-name t3_htap benchmark_task_3.sh htap ann_finest_level donor False
sbatch --partition=cpucourt --exclusive --time=71:00:00 --job-name t3_hlca_par_dataset_harmonized benchmark_task_3.sh hlca_par_dataset_harmonized ann_finest_level dataset False
sbatch --partition=cpucourt --exclusive --time=71:00:00 --job-name t3_hlca_trac_dataset_harmonized benchmark_task_3.sh hlca_trac_dataset_harmonized ann_finest_level dataset False




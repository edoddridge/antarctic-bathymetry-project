Modify restarts to use alternative bathymetry
=============================================

See [ACCESS-NRI docs](https://access-om3-configs.access-hive.org.au/inputs/Topography-generation/#updating-ocean-restart-files) for guidance.

Rather than doing this interactively for each one, the plan is to create PBS and python scripts that will do these modifications programmatically.

Workflow:
 - Check that there is a control directory in `control_dirs` for the chosen bathymetry product. If not, create it and then populate it following the guidance [here](https://github.com/edoddridge/antarctic-bathymetry-project/blob/main/setup/Set-up-different-bathymetry-configs.md).
 - Create a new control directory in `template-restart-dirs` for the chosen bathymetry product by cloning the appropriate branch of the https://github.com/edoddridge/panAnt_bathy_config repo in to the `template-restart-dirs`. For example:

    payu clone --branch DTU_DKL https://github.com/edoddridge/panAnt_bathy_config DTU_DKL

 - Edit config in `template-restart-dirs` by:
   - modifying `restart_n`, `restart_option`, `stop_n`, and `stop_option`, in `nuopc.runconfig` to make the simulation run for a short time. Use `nhours` and set to 1. Options for `stop_option` apparently equal to those listed here: https://escomp.github.io/CMEPS/versions/master/html/generic.html NOTE: I tried `nsteps` and got SegFaults.
   - Changing experiment name: `experiment: XXX_template`
 - Run config in `template-restart-dirs`.
 - Run `apply_bathy_mom_restarts.py` on the output by using the shell script `modify-restarts.sh`
   - Modify the `template_prefix` and `old_prefix` to match the target restarts.

    ```
    qsub -v template_dir="/path/to/template/restarts",old_dir="/path/to/spunup/restarts",output_dir="/path/to/save/perturbation/restarts" -P $PROJECT modify-restarts.sh
    ```
   - These paths are:
       - template_dir - restarts in `template-restart-dirs/XXX` that use the new bathymetry;
       - old_dir - restarts from the spun up PanAntarctic control run in  `ac99c`; and
       - output_dir - folder for new restarts (combine spun up PanAntarctic run with new bathymetry and some filler from the initial conditions of the template_dir run).
   - Example for DTU_DKL:

    ```
    qsub -v template_dir="/home/552/ed7737/coding-and-projects/panant_bathy_ensemble/control_dirs/template-restart-dirs/DTU_DKL/archive/restart000",old_dir="/home/552/ed7737/coding-and-projects/panant_bathy_ensemble/control_dirs/ac99c/archive/restart001",output_dir="/g/data/jk72/ed7737/access-om3/modified-restarts/DTU_DKL" -P $PROJECT modify-restarts.sh
    ```


 - Now it is time to run the new bathymetry configuration! Science on!

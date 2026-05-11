Modify restarts to use alternative bathymetry
=============================================

See [ACCESS-NRI docs](https://access-om3-configs.access-hive.org.au/inputs/Topography-generation/#updating-ocean-restart-files) for guidance.

Rather than doing this interactively for each one, the plan is to create PBS and python scripts that will do these modifications programmatically.

Workflow:
 - Check that there is a control directory in `control_dirs` for the chosen bathymetry product. If not, create it.
 - Create a new control directory in `template-restart-dirs` for the chosen bathymetry product by cloning the appropriate branch of the https://github.com/edoddridge/panAnt_bathy_config repo in to the `template-restart-dirs`
 - Run config in `template-restart-dirs` for one time step.
 - Run `apply_bathy_mom_restarts.py` pointing to:
   - template restarts in `template-restart-dirs/XXX` that use the new bathymetry;
   - old restarts (spun up PanAntarctic run) in `control_run`; and
   - folder for new restarts (combine spun up PanAntarctic run with new bathymetry and some filler from the initial conditions of the 1 timestep run).
 - Run the new bathymetry configuration.

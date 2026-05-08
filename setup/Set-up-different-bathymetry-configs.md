Set up different bathymetry configs
===================================

The steps will be equivalent for all bathymetry products. Probably best to write the full commands out so they can be copied and pasted.

Steps:
 - Make a new branch and control directory for each bathymetry.
 - Change the config to point to the new input files.

Will likely also need to adjust restart files to account for new bathymetry. See [guide here](https://access-om3-configs.access-hive.org.au/inputs/Topography-generation/#updating-restarts-for-new-bathymetry). The coastline has been held constant between all bathymetry perturbations, so the land mask should be consistent across runs (need to double check that they are equivalent to the original land mask though).

DTU_DKL
-------

Make the config folder and clone the PanAnt branch in to it using a specific commit (config crashes on `HEAD`):

    payu clone -s ac99c202a8e43eb2b8f40bc470dd9a6b3507a30f -b DTU_DKL -r ac99c https://github.com/ACCESS-NRI/access-om3-configs DTU_DKL

Make the origin url point to my new repo

    git remote set-url origin git@github.com:edoddridge/panAnt_bathy_config.git

Push the config to GitHub

    git push

Now we need to modify the config to point to the new files

    sed -i '' 's@/g/data/vk83/prerelease/configurations/inputs/access-om3/panan.4km/2026.01.08/kmt.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/kmt.nc@g' config.yaml

    sed -i '' 's@/g/data/vk83/prerelease/configurations/inputs/access-om3/panan.4km/2026.01.08/topog.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/topog.nc@g' config.yaml

    sed -i '' 's@/g/data/vk83/prerelease/configurations/inputs/access-om3/panan.4km/2026.01.08/access-om3-4km-ESMFmesh.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/access-om3-4km-ML-DTU_DKL-ESMFmesh.nc@g' config.yaml

    sed -i '' 's@/g/data/vk83/prerelease/configurations/inputs/access-om3/panan.4km/2026.01.08/access-om3-4km-nomask-ESMFmesh.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/access-om3-4km-ML-DTU_DKL-nomask-ESMFmesh.nc@g' config.yaml

    sed -i '' 's@/g/data/vk83/prerelease/configurations/inputs/access-om3/panan.4km/2026.01.08/access-om3-4km-rof-remap-weights.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/access-om3-4km-ML-DTU_DKL-rof-remap-weights.nc@g' config.yaml

NOTE: These `sed` commands only seem to work properly on MacOS.

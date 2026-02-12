Set up branches to manage configs
=================================

Make the config folder and clone the PanAnt branch in to it

    git clone --branch dev-MC_4km_jra_ryf+regionalpanan git@github.com:ACCESS-NRI/access-om3-configs.git panAnt_bathy

Make the origin url point to my new repo

    git remote set-url origin git@github.com:edoddridge/panAnt_bathy_config.git

Push the config to GitHub

    git push

Make a new branch for each new bathymetry. Example for DTU_DKL

    git checkout -b DTU_DKL

Now we need to modify the config to point to the new files

    sed -i '' 's@/g/data/tm70/cy8964/mom6/input/input-8km/topog_Charrassin_nocavity_cropped.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/topog.nc@g' config.yaml

    sed -i '' 's@/g/data/tm70/cy8964/mom6/input/input-8km/access-om3-8km-ESMFmesh_Charrassin_nocavity_cropped.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/access-om3-4km-ML-DTU_DKL-ESMFmesh.nc@g' config.yaml

    sed -i '' 's@/g/data/tm70/cy8964/mom6/input/input-8km/access-om3-8km-nomask-ESMFmesh_Charrassin_nocavity_cropped.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/access-om3-4km-ML-DTU_DKL-nomask-ESMFmesh.nc@g' config.yaml

    sed -i '' 's@/g/data/tm70/cy8964/mom6/input/input-8km/topog_Charrassin_nocavity_cropped.nc@/g/data/jk72/ed7737/access-om3/inputs/4km-PanAntarctic/bathy_products/DTU_DKL/topog.nc@g' config.yaml
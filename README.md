# Arch
Create an Arch VM in Arch and a configuration file to setup a new Arch instance.

## To create Arch VM

The following will create an Arch VM with user/password root/root

Run following command to create script
```shell
cd ArchVM && \
find spells/ -name "*.json" -exec basename {} .json \; | xargs -I{} -P0 bash -c "curl -X DELETE https://topher.spellcaster.sh/spells/{}; curl -s -X POST https://topher.spellcaster.sh?persist=true --data-binary @spells/{}.json -H 'Content-Type: application/json' | tee scripts/{}.sh"

```

```shell
bash scripts/archVM.sh
```

To destory Arch VM
```shell
virsh destroy arch-vm; virsh undefine arch-vm --remove-all-storage
```

## To run Arch config script

The following will configure the Arch instance with user/password topher/topher

Run following command to create script
```shell
cd ArchConfig && \
find spells/ -name "*.json" -exec basename {} .json \; | xargs -I{} -P0 bash -c "curl -X DELETE https://topher.spellcaster.sh/spells/{}; curl -s -X POST https://topher.spellcaster.sh?persist=true --data-binary @spells/{}.json -H 'Content-Type: application/json' | tee scripts/{}.sh"
```

Run the following command in Arch instance
```shell
curl https://topher.spellcaster.sh/spells/archConfig | bash
```

Copyright© 2025 Topher Ludlow and Stephen Lauck | Distinguished™ powered by Spellcaster™
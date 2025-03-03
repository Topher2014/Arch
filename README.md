# Arch
Create an Arch VM in Arch and a configuration file to setup a new Arch instance.

## To create Arch VM

Run following command to create script
```shell
cd ArchVM && \
find spells/ -name "*.json" -exec basename {} .json \; | xargs -I{} -P0 bash -c "curl -X DELETE https://topher.spellcaster.sh/spells/{}; curl -s -X POST https://topher.spellcaster.sh?persist=true --data-binary @spells/{}.json -H 'Content-Type: application/json' | tee scripts/{}.sh"

```

To destory Arch VM
```shell
virsh destroy arch-vm; virsh undefine arch-vm --remove-all-storage
```

## To run Arch config script

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
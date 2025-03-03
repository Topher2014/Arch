# Arch Linux

```shell
find spells/ -name "*.json" -exec basename {} .json \; | xargs -I{} -P0 bash -c "curl -X DELETE https://topher.spellcaster.sh/spells/{}; curl -s -X POST https://topher.spellcaster.sh?persist=true --data-binary @spells/{}.json -H 'Content-Type: application/json' | tee scripts/{}.sh"

```

```shell
virsh destroy arch-vm; virsh undefine arch-vm --remove-all-storage
```


Copyright© 2025 Topher Ludlow and Stephen Lauck | Distinguished™ powered by Spellcaster™
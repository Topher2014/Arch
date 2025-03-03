# Arch Linux

```shell
find spells/ -name "*.json" -exec basename {} .json \; | xargs -I{} -P0 bash -c "curl -X DELETE https://topher.spellcaster.sh/spells/{}; curl -s -X POST https://topher.spellcaster.sh?persist=true --data-binary @spells/{}.json -H 'Content-Type: application/json' | tee scripts/{}.sh"

```

```shell
curl https://topher.spellcaster.sh/spells/archConfig | bash
```

Copyright© 2025 Topher Ludlow and Stephen Lauck | Distinguished™ powered by Spellcaster™
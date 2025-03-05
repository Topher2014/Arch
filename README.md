# Arch
Create an Arch VM in Arch and a configuration file to setup a new Arch instance with full-disk encryption.
This is intended to be ran immediately after arch-chroot, whether from a live USB or existing Arch installation.

## Pre-chroot Instructions

Partitioning and encryption is intentionally left as a manual process (for now, at least).

These instructions assume a partition layout of
/boot (EFI boot parition)
[SWAP] (swap space)
/ (encrypted root partition)

### Format partitions and mount partitions

NOTE: If installing from existing Arch OS, you may need to rename the current /dev/mapper/root with
```shell
sudo dmsetup rename root OGroot
```

cryptsetup -v luksFormat /dev/root_partition
cryptsetup open /dev/root_partition root
mkfs.ext4 /dev/mapper/root
mount /dev/mapper/root /mnt

mkfs.fat -F 32 /dev/efi_system_partition
mount --mkdir /dev/sda1 /mnt/boot

mkswap /dev/swap_partition

pacstrap -K /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

Run the following command in Arch instance
```shell
curl https://topher.spellcaster.sh/spells/archConfig | bash
```

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
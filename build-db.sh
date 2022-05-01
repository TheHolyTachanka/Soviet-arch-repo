#!/usr/bin/env bash
#
# Script name: build-db.sh
# Description: Script for rebuilding the database for Soviet-arch-repo.
# Github: https://github.com/TheHolyTachanka/Soviet-arch-repo
# Contributors: TheHolyTachanka

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.

echo "###########################"
echo "Building the repo database."
echo "###########################"

## Arch: x86_64
cd x86_64
rm -f Soviet-arch-repo*

echo "###################################"
echo "Building for architecture 'x86_64'."
echo "###################################"

## repo-add
## -s: signs the packages
## -n: only add new packages not already in database
## -R: remove old package files when updating their entry
repo-add -s -n -R Soviet-arch-repo.db.tar.gz *.pkg.tar.zst

# Removing the symlinks because GitLab can't handle them.
rm Soviet-arch-repo.db
rm Soviet-arch-repo.db.sig
rm Soviet-arch-repo.files
rm Soviet-arch-repo.files.sig

# Renaming the tar.gz files without the extension.
mv Soviet-arch-repo.db.tar.gz Soviet-arch-repo.db
mv Soviet-arch-repo.db.tar.gz.sig Soviet-arch-repo-db.sig
mv Soviet-arch-repo.files.tar.gz Soviet-arch-repo.files
mv Soviet-arch-repo.files.tar.gz.sig Soviet-arch-repo.files.sig

echo "#######################################"
echo "Packages in the repo have been updated!"
echo "#######################################"

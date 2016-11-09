#!/usr/bin/env bash

set -o errexit

#
# Please see: https://help.ubuntu.com/community/AutoLogin
#
if [ ! -d /etc/lightdm/lightdm.conf.d ] ; then
  mkdir -p /etc/lightdm/lightdm.conf.d

  echo -e "[SeatDefaults]\nautologin-user=vagrant" >| \
  /etc/lightdm/lightdm.conf.d/50-vagrant-autologin.conf

  #
  # Now that the user is set to automatically log in, we need to
  # restart the service to actually log the user in.
  #
  service lightdm restart
fi

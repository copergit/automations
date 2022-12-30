# Ansible playbooks documentation
Liceo Copernico (UD)
### tasks/install/libs
***julia.yaml***
*Install non standard packages*
<br>
***julia-minimal.yaml***
*Install non standard packages*
<br>
***julia-red.yaml***
*Install non standard packages*
<br>
### tasks/install/packages/windows
***drivers.yaml***
<br>
***test_windows_packages.yaml***
<br>
***labs_standard_packages.yaml***
<br>
***classroom.yaml***
<br>
### tasks/install/packages/linux
***lab4.yaml***
<br>
***snaps.yaml***
<br>
***auth.yaml***
<br>
***remove_packages.yaml***
<br>
***old_veyon.yaml***
<br>
***install_hypatia.yaml***
*Install non standard packages*
<br>
***johnny.yaml***
*Install non standard packages*
<br>
***fisica_lab_packages.yaml***
<br>
***install_julia.yaml***
*Install non standard packages*
<br>
***install_arduino.yaml***
*Install non standard packages*
<br>
***install_processing.yaml***
*Install non standard packages*
<br>
***install_tracker.yaml***
*Install tracker*
<br>
***install_blender_libs.yaml***
*Install blender addons*
<br>
***install_multiple_packages.yaml***
<br>
***python_pip.yaml***
<br>
***standard_lab_packages.yaml***
<br>
### tasks/install/envs
***jupyterlab_env_lab.yaml***
*Install jupyterlab_env for labs computers*
*this playbook is preconfigured for computer  science labs and not physics labs*
<br>
***processing.yaml***
*Configure and distribute  processing env to default user*
*folder*
<br>
***vscode.yaml***
*This playbook distributes vscode env to labs default user*
**
<br>
***julia_env.yaml***
**
*This playbook  distributes  common Julia sysimage and vscode conf*
*You must compile Julia sysimage yourself*
<br>
***jupyterlab_env.yaml***
*This playbook installs default jupyter lab env inside*
*default labs local user*
<br>
### tasks/shutdown
***linux.yaml***
*configure php apache mod*
<br>
***shutdown_win.yaml***
<br>
***now.yaml***
*shutdown machines*
<br>
### tasks/configure/grub
***set_defaults.yaml***
*This playbook sets some standard grub options*
*in order to use pxe boot*
*this playbook is Linux only*
<br>
### tasks/configure/firewall
***iptables_scripts.yaml***
*This playbook configures iptables*
*for Computer science tournaments*
**
<br>
### tasks/configure/users/windows
***change_local_user_pwd.yaml***
*This playbook changes a specified local user password*
*usage aplaybook -l <group> --extra-vars "username=<value> password=<value>"*
**
<br>
### tasks/configure/users/linux
***chrome.yaml***
*This playbook resets default user chrome config*
*deletes every previous configuration*
**
<br>
***change_user_shell.yaml***
*This playbook changes a specific user shell and resets it to bash*
*usage aplaybook -l <machines> --extra-vars "username=<value>"*
<br>
***change_local_user_pwd.yaml***
*This playbook changes a specified local user password*
*usage aplaybook -l <machines> --extra-vars "username=<value> password=<value>"*
<br>
***create_physics_lab_local_users.yaml***
*This playbook creates physics lab local users*
*usage aplaybook -l <group> --extra-vars "password=<value> password=<value>"*
<br>
***add_user_group.yaml***
*This playbook appends groups to a specific user*
*usage aplaybook -l <machines> --extra-vars "username=<value> group=<value>"*
<br>
***change_user_description.yaml***
*This playbook changes a default local user description*
*usage aplaybook -l <machines> --extra-vars "username=<value> description=<value>"*
**
<br>
### tasks/configure/shell
***bashrc.yaml***
*This playbook configure labs pc bash*
*it distributes bashrc inside default user home dir*
*this playbook is Linux Only*
<br>
### tasks/configure/apt
***apt_extra_repo.yaml***
*This playbook configures all non standard apt repos*
*this is used on labs computers*
*this playbook is Linux Only*
<br>
### tasks/configure/wine
***userdir.yaml***
*This playbook install non standard wine packages and*
*configures default lab user wine dir*
**
<br>
### tasks/configure/visual
***wallpaper.yaml***
*Change linux local user wallpaper*
*distribute wallpapers*
*not tested yet*
<br>
### tasks/configure/gdm
***disable_autologin.yaml***
*This playbook disables autologin in gdm*
*this playbook is Linux only*
<br>
***autologin.yaml***
*This playbook enables gdm autologin with labs default user*
*this playbook is Linux only*
**
<br>
### tasks/configure/php
***apache.yaml***
*This playbook configures apache and php debug*
*for Computer science courses*
*this playbook is Linux only*
<br>
### tasks/configure/auth
***sssd.yaml***
*This playbook is used to configure sssd in order to*
*use google ldap auth in ubuntu clients*
*this playbook is windows only*
<br>
### tasks/configure/overlay
***disable.yaml***
*This playbook disables overlayroot fs*
*inside computer labs*
*this playbook is Linux Only*
<br>
***enable.yaml***
*This playbook enables overlayroot fs*
*onto labs computers*
<br>
### tasks/configure/inventory
***fusion.yaml***
*This playbook configures fusion inventory plugin*
*by uploading its configuration file*
*this playbook is Linux Only*
<br>
### tasks/monitoring
***iperf.yaml***
<br>
***hdd_encryption_status.yaml***
**
<br>
***list_gw_users.yaml***
**
<br>
### tasks/wakeup
***wake_and_wait_lab4.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
***wake_and_wait_lab1.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
***wake_and_wait_laptop.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
***wake_and_wait_lab2.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
***wake_and_wait_teacher.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
***wake_and_wait.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
***now.yaml***
*Wake desktops, wait for them to become ready and continue playbook*
<br>
### tasks/cleanup
***cleanup_users_dir.yaml***
*This playbook deletes old gsuite users home directories*
*this playbook is Windows only*
<br>
***cleanup_old_users.yaml***
*This playbook deletes local users from windows machines*
*during summer manteinance*
*this playbook is Windows only*
<br>
### tasks/actions
***is_alive.yaml***
*ping machines*
*Check if computer are online and active*
*for a quick and dirty test you could use*
*ansible <group> -m ping*
<br>
***install_windows_updates.yaml***
*Install windows updates and reboot as many times as required*
**
<br>
***boot_pxe.yaml***
*set pxe boot once*
*this playbook configures pxe boot*
*this is usefull when you need to reimage labs computers*
**
<br>
***install_ubuntu_updates2.yaml***
<br>
***install_ubuntu_updates.yaml***
*This playbook installs latest Ubuntu updates*
*use this script on lab computers*
**
<br>
### tasks/setup/windows
***disable_fastboot.yaml***
*set default shell to cmd*
<br>
***enable_wol.yaml***
*set default shell to cmd*
<br>
***domain.yaml***
*add host to dida domain*
*usage aplaybook -l <group> --extra-vars "password=<value>"*
<br>
***encrypt_disk.yaml***
*set default shell to cmd*
<br>
***gcpw.yaml***
*set default shell to cmd*
<br>
***default_win_shell.yaml***
<br>
***revert_cmd.yaml***
*set default shell to cmd*
<br>
### tasks/setup/linux
***change_hostname.yaml***
<br>

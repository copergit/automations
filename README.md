# Ansible playbooks documentation
Liceo Copernico (UD)
### tasks/install
##### julia.yaml
##### julia-minimal.yaml
##### julia-red.yaml
##### jupyterlab_env_lab.yaml
*Install jupyterlab_env for labs computers*
##### processing.yaml
*Configure and distribute  processing env to default user*
##### vscode.yaml
*This playbook distributes vscode env to labs default user*
##### julia_env.yaml
**
*This playbook  distributes  common Julia sysimage and vscode conf*
##### jupyterlab_env.yaml
*This playbook installs default jupyter lab env inside*
### tasks/install/packages
##### drivers.yaml
##### test_windows_packages.yaml
##### labs_standard_packages.yaml
##### classroom.yaml
##### lab4.yaml
##### snaps.yaml
##### auth.yaml
##### remove_packages.yaml
##### old_veyon.yaml
##### install_hypatia.yaml
##### johnny.yaml
##### fisica_lab_packages.yaml
##### install_julia.yaml
##### install_arduino.yaml
##### install_processing.yaml
##### install_tracker.yaml
##### install_blender_libs.yaml
##### install_multiple_packages.yaml
##### python_pip.yaml
##### standard_lab_packages.yaml
### tasks
##### linux.yaml
##### shutdown_win.yaml
##### now.yaml
##### iperf.yaml
##### hdd_encryption_status.yaml
##### list_gw_users.yaml
##### wake_and_wait_lab4.yaml
##### wake_and_wait_lab1.yaml
##### wake_and_wait_laptop.yaml
##### wake_and_wait_lab2.yaml
##### wake_and_wait_teacher.yaml
##### wake_and_wait.yaml
##### now.yaml
##### cleanup_users_dir.yaml
*This playbook deletes old gsuite users home directories*
##### cleanup_old_users.yaml
*This playbook deletes local users from windows machines*
*during summer manteinance*
##### is_alive.yaml
*ping machines*
*Check if computer are online and active*
*for a quick and dirty test you could use*
##### install_windows_updates.yaml
*Install windows updates and reboot as many times as required*
##### boot_pxe.yaml
*set pxe boot once*
*this playbook configures pxe boot*
*this is usefull when you need to reimage labs computers*
##### install_ubuntu_updates2.yaml
##### install_ubuntu_updates.yaml
*This playbook installs latest Ubuntu updates*
*use this script on lab computers*
### tasks/configure
##### set_defaults.yaml
*This playbook sets some standard grub options*
*in order to use pxe boot*
##### iptables_scripts.yaml
*This playbook configures iptables*
*for Computer science tournaments*
##### bashrc.yaml
*This playbook configure labs pc bash*
*it distributes bashrc inside default user home dir*
##### apt_extra_repo.yaml
*This playbook configures all non standard apt repos*
*this is used on labs computers*
##### userdir.yaml
*This playbook install non standard wine packages and*
*configures default lab user wine dir*
##### wallpaper.yaml
*Change linux local user wallpaper*
*distribute wallpapers*
##### disable_autologin.yaml
*This playbook disables autologin in gdm*
##### autologin.yaml
*This playbook enables gdm autologin with labs default user*
*this playbook is Linux only*
##### apache.yaml
*This playbook configures apache and php debug*
*for Computer science courses*
##### sssd.yaml
*This playbook is used to configure sssd in order to*
*use google ldap auth in ubuntu clients*
##### disable.yaml
*This playbook disables overlayroot fs*
*inside computer labs*
##### enable.yaml
*This playbook enables overlayroot fs*
##### fusion.yaml
*This playbook configures fusion inventory plugin*
*by uploading its configuration file*
### tasks/configure/users
##### change_local_user_pwd.yaml
*This playbook changes a specified local user password*
*usage aplaybook -l <group> --extra-vars "username=<value> password=<value>"*
##### chrome.yaml
*This playbook resets default user chrome config*
*deletes every previous configuration*
##### change_user_shell.yaml
*This playbook changes a specific user shell and resets it to bash*
##### change_local_user_pwd.yaml
*This playbook changes a specified local user password*
##### create_physics_lab_local_users.yaml
*This playbook creates physics lab local users*
##### add_user_group.yaml
*This playbook appends groups to a specific user*
##### change_user_description.yaml
*This playbook changes a default local user description*
*usage aplaybook -l <machines> --extra-vars "username=<value> description=<value>"*
### tasks/setup
##### disable_fastboot.yaml
##### enable_wol.yaml
##### domain.yaml
*add host to dida domain*
##### encrypt_disk.yaml
##### gcpw.yaml
##### default_win_shell.yaml
##### revert_cmd.yaml
##### change_hostname.yaml

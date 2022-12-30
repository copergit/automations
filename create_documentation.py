from pathlib import Path
result = list(Path("tasks").rglob("*.yaml"))


data={}


for playbook in result:

    key=playbook.parts[0:-2]
    filename=playbook.parts[-1]
    if not(key in data):
        data[key]=[]
    with open(playbook) as myfile:
        
        current_file_help=[filename]

        for line in myfile:
            if line[0]=="#":
                current_file_help.append(line[1:-1].strip())
        data[key].append(current_file_help)

help_file=open('README.md','w')

help_file.write("# Ansible playbooks documentation\n")
help_file.write("Liceo Copernico (UD)\n")


for current_section in data:
    help_file.write("## "+'/'.join(current_section)+"\n")
    for help in data[current_section]:
        help_file.write("### "+help[0]+"\n")
        for line in help[1:-1]:
            help_file.write(line+"\n")


help_file.close()

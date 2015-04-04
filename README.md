# Run Ansible from a Docker image

This image allows you to run Ansible without installing it on your local machine, namely used for CoreOS.

It assumes:
- The Ansible playbooks are located somewhere within the users home directory
- SSH keys end with either _rsa, _dsa, _ecdsa

## Aliases

These aliases can be used to have the Ansible Docker image behave like a local installation of Ansible

```bash
alias ansible='docker run -it --rm -m 128m -v ${HOME}:${HOME}:ro -v ${HOME}/.ssh:${HOME}/.ssh:ro -w ${PWD} denzuko/ansible ansible'
alias ansible-playbook='docker run -it --rm -m 128m -v ${HOME}:${HOME}:ro -v ${HOME}/.ssh:${HOME}/.ssh:ro  -w ${PWD} denzuko/ansible ansible-playbook'
alias ansible-vault='docker run -it --rm -m 128m -v ${HOME}:${HOME}:ro -v ${HOME}/.ssh:${HOME}/.ssh:ro  -w ${PWD} denzuko/ansible ansible-vault'
```

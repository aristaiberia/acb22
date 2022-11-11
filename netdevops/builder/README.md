#ACB-TOWER-EE

Build an Ansible Tower execution environment (EE) that contains requirements cvprac python module and arista.cvp Ansible collection.

$ ansible-builder build --tag=acb-tower-ee --container-runtime=podman --verbosity=3

Once the EE has been built the container image is available:

$ podman image ls
REPOSITORY                       TAG         IMAGE ID      CREATED         SIZE
localhost/acb-tower-ee           latest      80a8bb82065f  9 minutes ago   1.95 GB

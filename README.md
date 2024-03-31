# Test4MAS_K8s
This repository hosts the code to deploy a K8s cluster on AWS using Kubeadm.

Kubernetes Cluster Config - 

   Master Node - 1
   Worker Node - 1
   EC2 size - 2 vCPU & 4GB RAM
   Kubernetes Version - v1.28 , installed using Kubeadm

Ansible Playbook consists of below roles - 

  1) ec2 - Creates worker and Master Nodes
  2) master_node - Configures and Install required tools (kubeadm etc) on Master Node
  3) worker_node - Configures and Install required tools and join with master node

If you want to use it and run it on your setup. Kindly ensure to complete below pre-requisites -

  1) Install Ansible on you localhost
  2) Create and save the keypair in the workspace "AWS_Infra". this is to connect to AWS EC2.Let's call it "aws.pem"
  3) Create one ansible vault yml to store AWS access key and Secret ID. Let's call it vault_cred.yml


Execute below command from AWS_Infra workspace to trigger the ansible playbook - 

   ansible-playbook setup.yml --ask-vault-pass

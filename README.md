# IaC-Portfolio
This is my DevOps infrastructure automation portfolio. It contains IaC automation in Ansible, Terraform, and others. 

# Practical DevOps Methodology
The DevOps world is a tool-rich ecosystem. Many of the tools have overlapping areas of responsibility. Some have heavy vendor lock-in, and some use esoteric configuration languages. The bottom line is this: DevOps aims to bring simplicity to the world of deploying code and running systems at scale, not to overcomplicate things like I often see from developers who have *no* business being infrastructure people. DevOps tools should be simple, portable, and reliable. This is why my go-to tools are `Terraform,` `Ansible,` and when security is a higher-than-normal concern - `cfEngine.` 

# Scope of Rick's DevOps/IaC Portfolio
So, like many of my industry peers, I have a small Homelab that I use to run various things that power my technical life. The initial setup was a "get everything running and return to it later" mentality. While I was busy making everyone else's cloud infrastructure awesome, I should have paid more attention to my own. A case of the cobbler's shoes having holes, if you will. That changes today. 

In this portfolio, I wanted to demonstrate: 

#### Using IaC and automation tools to execute data and state migration 
This is important because I have a bunch of services with stateful data that need to be migrated into the new architecture that gets deployed as part of this project. This is something that is not often talked about, so I wanted 

#### Using Terraform for Infrastructure Pieces, Ansible for "Last Mile" Configuration 
Terraform is great for defining the infrastrcuture itself, but once you get VM's deployed, you need to configure the VM's by installing software and running scripts to do that "last mile" of the marathon that is configuring infrastructure. We will be deploying Rancher to manage a small Kubernetes cluster, but there will need to be some odds and ends that need to be tweaked on the VM's before Rancher can manage those nodes. 

#### Managing support services with IaC 
I want to make sure that all my support services that are living outside of Kubernetes are also properly managed as part of my IaC scheme. 

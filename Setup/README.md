# Setup Instructions For Lab

## Dependencies
You will need the following items to get everything in this lab working correctly: 

- Virtualbox 
- A Windows 2008 Server R2 ISO (I have mine from back when I had my TechNet subscription)
- Ubuntu Server 22.04 ISO's 
- Windows 10 or Windows 11 ISO's (for the workstations)

The 2008 server R2 instance might be difficult to find, but the internet archive has one that you can search for. I am not encouraging software piracy, nor do I condone such things, so let this be a disclaimer, I am not responsible for *how* you find the 2008 R2 ISO. 

## Step by Step Instructions 

Since this story-driven lab is about IaC (Infrastrucutre as Code), and designed to show off my capabilities as an engineer, much of the lab bootstrapping process is scripted. 

(This is draft - TODO: add the actual instructions)

### Legacy Infrastructure Setup

In order to demonstrate everything in the story, you will need to set up the legacy environment. 

#### Bootstrap the Windows 2008 R2 Instance

You'll need to spin up a copy of 2008 Server R2. I still have a bunch of ISO's I downloaded from TechNet back in the day. You will need to search the internet to find an ISO since I legally can't provide it here. Once you have the ISO, you will need to do the following:

**Create VM in virtualbox**

- You will need to mirror my network config. I made a script that creates a new NAT network, which is called `LabNAT` and has a `10.230.10.0/24` subnet. The process for running the script is as follows: 
```
# If you are already in this folder
cd ../
chmod +x virtualbox-create.sh
./virtualbox-create.sh
``` 
This will create the network that you will need once you have 2K8 up and runninfg. 
- Create the VM in Virtualbox with 2vcpu, 4096mb or RAM and a 32GB HDD. 
- Attach it to the `LabNAT` network.
- Fill out the unattended info in the setup wizard presented by the new VM Wizard 
- On successful install, you'll need to share the root repository directory into the VM so you can run the scripts. Since Windows 2008 Server comes with IE7, most websites where you'd want to download tools from will be **broken**. Once you share it in, create a folder somewhere on `C:\` because executing this on the mapped network drive that gets presented to 2008 from the virtualbox host will throw errors or cause some scripts not to run correctly. 
- Run Powershell as an adminstrator and run `Set-ExecutionPolicy RemoteSigned` so we can run our scripts. 
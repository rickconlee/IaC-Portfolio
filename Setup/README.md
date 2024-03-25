# Setup Instructions For Lab

## Dependencies
You will need the following items to get everything in this lab working correctly: 

- Virtualbox 
- A WIndows 2008 Server R2 ISO (I have mine from back when I had my TechNet subscription)
- Ubuntu Server 22.04 ISO's 
- Windows 10 or Windows 11 ISO's (for the workstations)

The 2008 server R2 instance might be difficult to find, but the internet archive has one that you can search for. I am not encouraging software piracy, nor do I condone such things, so let this be a disclaimer, I am not responsible for *how* you find the 2008 R2 ISO. 

## Step by Step Instructions 

Since this story-driven lab is about IaC (Infrastrucutre as Code), and designed to show off my capabilities as an engineer, much of the lab bootstrapping process is scripted. 

(This is draft - TODO: add the actual instructions)

### Legacy Infrastructure Setup

In order to demonstrate everything in the story, you will need to set up the legacy environment. 

#### Bootstrap the Windows 2008 R2 Instance

I already created and tested an autounattended.xml file that you can mount as a floppy image. If you want to modify it by adding your own product key, or perform any other tweaks you'd like, you will need to create a new image file from scratch. 

**Install with my `autounattend.xml`**

- Create the VM in Virtualbox with 2vcpu, 4096mb or RAM and a 32GB HDD. 
- Attach it to the host-only network. I created a new one called `vboxnet1` which created an IPv4 subnet of `192.168.57.1/24`
- Fill out the unattended info in the setup wizard presented by the new VM Wizard 
- On successful install, change the network adapter to have an address of `192.168.57.10`
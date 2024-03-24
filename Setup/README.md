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
- Right click on the server you just created and click settings 
- Navigate to storage, click the "Add Controller" button under storage devices. And select the controller type that says "(Floppy)."
- Click on the dick with the + icon to the right of the new floppy controller you just created, click **Add**
- Navigate to the `../Legacy-To-Modern-Lab-ANsible/Setup/Windows2008Server` directory where you will find `unattended_install.img` floppy image, which contains `autounattend.xml` - double click on that file in the selection window. When it drops you back in the "Floppy Disk Selector," Click **Choose** in the bottom right. 
- Go to **System** on the left and move "Optical" to the top of the boot order list using the little up arrow.
- Click OK in the settings window. 
- Double Click to start the server. At this time, it should go through the installation process completely unattended. 
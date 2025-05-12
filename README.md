# Terraform-Azure-Vnet-Subnet-NSG-NIC
# 🚀 Terraform Azure Network Infrastructure Modules

This repository contains a **modular Terraform setup** to provision a complete **Azure Network Infrastructure**, including:

- 🧱 Virtual Network (VNet)
- 🔹 Subnets (4)
- 🛡️ Network Security Groups (NSG) with associations
- 🔌 Network Interfaces (NIC)

---

## 📁 Module Breakdown

| Module         | Description                                    |
|----------------|------------------------------------------------|
| `VNet_Module`  | Creates the Azure Virtual Network              |
| `Subnet_Module`| Creates 4 Subnets within the VNet              |
| `NSG_Module`   | Creates 4 NSGs and associates them with subnets|
| `NIC_Module`   | Creates 4 NICs, each attached to one subnet    |
| `Parent_Module`| Root module that calls all the above modules   |

---

## 🧰 Technologies Used

- [Terraform](https://www.terraform.io/) v1.x
- [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- Infrastructure-as-Code (IaC) approach

---

## 🖼️ Architecture Diagram


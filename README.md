# VMISC
Example of a vendor management supply through SC in solidity

The file deployed contains a functional SC written in solidity to simulate a VMI interaction.

It permits:

1. Placing new order, from vendor side
2. Check the contents of the order and accept it, from customer side
3. Deliver the order and update the changes of the products, from vendor and deliverer side. A simple variable stores changes, but a mapping of locations and temperatures, as well as other variables can be included. However, this example remains simple
4. Confirm that the products have been received, from customer side.

Although is a high level example, it enables full functionality and QoS. The code has been extensively commented for an easy follow up. The SC functions enable:


**Vendor:**

>In the creation step, specifies addresses, contents or the order and creates SC.

**Customer:**

>Checks the contents, the number of products and specifications, and accepts(triggers) it.

**Vendor:**

>Starts delivery

**Vendor/Deliverer:**

>Update status and conditions of products. We can specify more attributes in the Product struct such as location, but we kept it simple in the example.

**Customer:**

>Checks the products and confirms that products have been received.

The code can be used if you cite it properly:

Bibtex

@INPROCEEDINGS{8751478,
author={T. {Dasaklis} and F. {Casino}},
booktitle={2019 IEEE International Conference on Blockchain and Cryptocurrency (ICBC)},
title={Improving Vendor-managed Inventory Strategy Based on Internet of Things (IoT) Applications and Blockchain Technology},
year={2019},
volume={},
number={},
pages={50-55},
keywords={contracts;cryptocurrencies;decision making;distributed databases;information management;Internet of Things;inventory management;logistics;complex distribution channels;smart contracts;internet of things applications;vendor-managed inventory strategy;local private blockchain technology;decisions making;information sharing;systems integration;logistics;Vendor Management Inventory;Supply Chain management;Blockchain;Smart Contracts},
doi={10.1109/BLOC.2019.8751478},
ISSN={},
month={May},}

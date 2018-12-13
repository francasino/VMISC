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

@misc{CasinoVMISC2018,
    author = {Fran Casino},
    title = {A Smart Contract to Enable VMI},
    howpublished = {\url{https://github.com/francasino/VMISC}},
    year=2018,
}


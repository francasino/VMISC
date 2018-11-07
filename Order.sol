pragma solidity ^0.4.24;

contract Order{

	//MODEL  a product
	struct Product {
		uint id;
		string name;
		uint quantity;
		string others;  // for QOs or conditions, location etc. A mapping should be used but example is kept simple
	}
	// key is a uint, later corresponding to the product id
	// what we store (the value) is a Product
	// the information of this mapping is the set of products of the order.
	mapping(uint => Product) private products; // public, so that w can access with a free function 

	//store products count
	// since mappings cant be looped and is difficult the have a count like array
	// we need a var to store the coutings  
	// useful also to iterate the mapping 
	uint private productsCount;
	

	//declare address of the participants
	address constant public customer = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;
	address constant public vendor = 0xE0f5206BBD039e7b0592d8918820024e2a743445;
	address constant public deliverer = 0xE0f5206BBD039e7b0592d8918820024e2a743222;

	private bool triggered;
	private bool delivery;
	private bool received;


	// event, this will trigger when we want, according to a function
	event triggeredEvent (  // triggers new accepted order 
	);

	event deliveryEvent (  // triggers delivery start
	);

	event receivedEvent ( // triggers order received by customer
	);

	event updateEvent ( // triggers product status change
	);


	function Order () public { // constructor, creates order. we map starting from id=1
	 addProduct(1,"Apples",200, "Delivey in 3 days, temperature X");
	 addProduct(2,"Oranges",150, "Delivey in 4 days, temperature Y");
	 triggered=false;
	 delivery=false;
	 received=false;
	}

    // add product to mapping.  private because we dont want to be accesible or add products afterwards to our mapping. We only want
    // our contract to be able to do that, from constructor
    // otherwise the conditions of the accepted contract could change
    function addProduct (string _name, uint _quantity, string _others) private {
    	productsCount ++; // inc count at the begining. represents ID also. 
    	products[productsCount] = Product(productsCount, _name,_quantity,_others);
    	// reference the mapping with the key (that is the count). We assign the value to 
    	// the mapping, the count will be the ID.  
    }

    // returns the number of products, needed to iterate the mapping and to know info about the order.
    //only customer 
    function getNumberOfProducts () returns (uint){
    	require(msg.sender==customer);
    	return productsCount;
    }

    // function to check the contents of the contract, the customer will check it and later will trigger if correct
    // only customer can check it 
    // customer will loop outside for this, getting the number of products before with getNumberOfProducts
    function getOrder (uint _productId) returns (Product) {
    	require(msg.sender==customer);

    	require(_productId > 0 && _productId <= productsCount); 

    	return products[_productId];
    }

    //this function triggers the contract, enables it since the customer accepts it 
    // only customer
    function triggerContract () public { 
    	require(msg.sender==customer);
		triggered=true;
		emit triggeredEvent(); // trigger event 

    }

    // only vendor
    function deliverOrder () public { 
    	require(msg.sender==vendor);
		delivery=true;
		emit deliveryEvent(); // trigger event 

    }

    //only customer
    function receivedOrder () public { 
    	require(msg.sender==customer);
		received=true;
		emit receivedEvent(); // trigger event 

    }

    // only vendor or deliverers
    function UpdateProduct (uint _productId, string _others) public { 
    	require(msg.sender==vendor || msg.sender==deliverer);
		products[_productId].others = _others;  // update conditions
		emit updateEvent(); // trigger event 
    }

}

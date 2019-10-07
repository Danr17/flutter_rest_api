class Item {
  final String id;
  final String created;
  final String name;
  final String expDate;
  final int expOpen;
  final String comment;
  final String targetAge;
  final bool isOpen;
  final String opened;
  final bool isValid;
  final int daysValid;

  Item({
    this.id, 
    this.created, 
    this.name,  
    this.expDate, 
    this.expOpen,
    this.comment,
    this.targetAge, 
    this.isOpen, 
    this.opened, 
    this.isValid,
    this.daysValid});

/*
  set name(String newName) {
			this.name = newName;
	}

  set manufactured(String newManufactured) {
			this.manufactured = newManufactured;
	}

  set expDate(String newExpdate) {
			this.expDate = newExpdate;
	}  

  set expOpen(int newExpopen) {
			this.expOpen = newExpopen;
	}

  set isOpen(bool newIsopen) {
			this.isOpen = newIsopen;
	}

  set opened(String newOpened) {
			this.opened = newOpened;
	}
  */        

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      created: json["Created"],
      name: json["name"],
      expDate: json["expdate"],
      expOpen: json["expopen"],
      comment: json["comment"],
      targetAge: json["targetage"],
      isOpen: json["isopen"],
      opened: json["opened"],
      isValid: json["isvalid"],
      daysValid: json["daysvalid"]
    ); 
  }
}